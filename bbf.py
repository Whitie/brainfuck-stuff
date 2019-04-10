#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re
import sys
import time

from collections import deque
from functools import partial
from struct import pack, unpack


DATASIZE = 30000
MAX_NESTING_LEVELS = 100
BF_COMMANDS = {
    'MOVE_RIGHT': '>',
    'MOVE_LEFT':  '<',
    'INCREMENT':  '+',
    'DECREMENT':  '-',
    'WRITE_CHAR': '.',
    'READ_CHAR':  ',',
    'LOOP_START': '[',
    'LOOP_END':   ']',
}
_OPCODES = {
    'MOVE':       0x01,
    'INCREMENT':  0x03,
    'WRITE_CHAR': 0x10,
    'READ_CHAR':  0x11,
    'LOOP_START': 0x20,
    'LOOP_END':   0x22,
    'SET_NULL':   0x30,
    'BF_DEBUG':   0xdb,
}


# Helper functions (only for optimization)
def balance(match, inc, dec):
    s = match.group(0)
    count_inc = s.count(inc)
    count_dec = s.count(dec)
    if count_inc > count_dec:
        return (count_inc - count_dec) * inc
    else:
        return (count_dec - count_inc) * dec


def aggregate(match, sym):
    return '{}{}'.format(sym, len(match.group(0)))


def optimize(code, commands):
    cl = len(code)
    print('Cleaned code length:', cl)
    code = re.sub(
        r'[{INCREMENT}{DECREMENT}]{{2,}}'.format(**commands),
        partial(balance, inc=commands['INCREMENT'], dec=commands['DECREMENT']),
        code
    )
    code = re.sub(
        r'[{MOVE_LEFT}{MOVE_RIGHT}]{{2,}}'.format(**commands),
        partial(balance, inc=commands['MOVE_RIGHT'],
                dec=commands['MOVE_LEFT']),
        code
    )
    code = re.sub(
        r'\{LOOP_START}(\{INCREMENT}|\{DECREMENT})\{LOOP_END}'.format(
            **commands
        ),
        '%', code
    )
    code = re.sub(r'^\{LOOP_START}.+?\{LOOP_END}'.format(**commands), '',
                  code, flags=re.DOTALL)
    lookup = {
        'I': commands['INCREMENT'],
        'D': commands['DECREMENT'],
        'R': commands['MOVE_RIGHT'],
        'L': commands['MOVE_LEFT'],
    }
    for sym, instruction in lookup.items():
        sym_re = r'{}{{2,}}'.format(re.escape(instruction))
        code = re.sub(sym_re, partial(aggregate, sym=sym), code)
    ocl = len(code)
    if cl <= ocl:
        print('No optimization found')
    else:
        print('Optimized code length:', ocl)
    return code


class BrainfuckInterpreter:

    def __init__(self, filename, datasize=DATASIZE, debug='', **commands):
        self.filename = filename
        with open(filename) as fp:
            code = fp.read()
        self.compiled_filename = '{}.bfc'.format(os.path.splitext(filename)[0])
        self.commands = BF_COMMANDS.copy()
        self.commands['BF_DEBUG'] = debug
        self.commands.update(commands)
        self.cleaned_code = self._clean_code(code)
        self.code = optimize(self.cleaned_code, self.commands)
        self.data = bytearray(datasize)
        self.ptr = 0
        self.pc = 0
        self.input_buffer = deque(maxlen=255)
        self.ast = []
        self._stack = []
        self._load_compiled()

    def _load_compiled(self):
        if os.path.isfile(self.compiled_filename):
            # check here if source is newer
            with open(self.compiled_filename, 'rb') as fp:
                data = fp.read(3)
                while data:
                    self.ast.append((None, *unpack('=Bh', data)))
                    data = fp.read(3)

    def _clean_code(self, raw_code):
        print('Input length:', len(raw_code), file=sys.stderr)
        tmp = []
        for c in raw_code:
            if c in self.commands.values():
                tmp.append(c)
        return ''.join(tmp)

    def _get_num(self):
        d = self.code[self.pc]
        while True:
            if self.code[self.pc + 1].isdigit():
                self.pc += 1
                d += self.code[self.pc]
            else:
                break
        return int(d)

    def _get_input(self):
        try:
            inp = self.input_buffer.popleft()
        except IndexError:
            inp = input('$ ')
            if not inp:
                inp = '\x00'
            elif len(inp) > 1:
                self.input_buffer.extend(inp[1:])
                inp = inp[0]
        return inp

    def process(self):
        print('Cleaned code:', self.cleaned_code, file=sys.stderr)
        if len(self.code) < len(self.cleaned_code):
            print('Optimized code:', self.code, file=sys.stderr)
        loop = 0
        while self.pc < len(self.code):
            instruction = self.code[self.pc]
            self.process_instruction(instruction, loop)
            loop += 1
        try:
            with open(self.compiled_filename, 'wb') as fp:
                for op in self.ast:
                    fp.write(pack('=Bh', op[1], op[2]))
        except Exception as err:
            print('Error while writing compiled file:', err, file=sys.stderr)

    def process_instruction(self, instruction, loop):
        if instruction == self.commands['MOVE_RIGHT']:
            self.ast.append(('MOVE', _OPCODES['MOVE'], 1))
        elif instruction == self.commands['MOVE_LEFT']:
            self.ast.append(('MOVE', _OPCODES['MOVE'], -1))
        elif instruction == self.commands['INCREMENT']:
            self.ast.append(('INCREMENT', _OPCODES['INCREMENT'], 1))
        elif instruction == self.commands['DECREMENT']:
            self.ast.append(('INCREMENT', _OPCODES['INCREMENT'], -1))
        elif instruction == self.commands['WRITE_CHAR']:
            self.ast.append(('WRITE_CHAR', _OPCODES['WRITE_CHAR'], 0))
        elif instruction == self.commands['READ_CHAR']:
            self.ast.append(('READ_CHAR', _OPCODES['READ_CHAR'], 0))
        elif instruction == self.commands['LOOP_START']:
            self._stack.append(loop)
            self.ast.append(('LOOP_START_TMP', 0, 0))
        elif instruction == self.commands['LOOP_END']:
            start = self._stack.pop()
            self.ast.append(('LOOP_END', _OPCODES['LOOP_END'], start))
            self.ast[start] = ('LOOP_START', _OPCODES['LOOP_START'], loop)
        elif instruction == self.commands['BF_DEBUG']:
            self.ast.append(('BF_DEBUG', _OPCODES['BF_DEBUG'], 0))
        # Special optimized instructions
        elif instruction == '%':
            self.ast.append(('SET_NULL', _OPCODES['SET_NULL'], 0))
        elif instruction == 'I':
            self.pc += 1
            self.ast.append(('INCREMENT', _OPCODES['INCREMENT'],
                             self._get_num()))
        elif instruction == 'D':
            self.pc += 1
            self.ast.append(('INCREMENT', _OPCODES['INCREMENT'],
                             -self._get_num()))
        elif instruction == 'R':
            self.pc += 1
            self.ast.append(('MOVE', _OPCODES['MOVE'], self._get_num()))
        elif instruction == 'L':
            self.pc += 1
            self.ast.append(('MOVE', _OPCODES['MOVE'], -self._get_num()))
        else:
            raise ValueError(f'Illegal instruction: {instruction}')
        self.pc += 1

    def _debug_print(self):
        data = [
            x for x in zip(range(100), self.data[:100],
                           map(chr, self.data[:100]))
            if x[1]
        ]
        print(
            'PC: {pc} PTR: {ptr} VAL: {val} DATA (P, D, C): {data} '.format(
                pc=self.pc, ptr=self.ptr, val=self.data[self.ptr], data=data
            )
        )

    def run(self):
        if not self.ast:
            self.process()
        print('Number of bytecode instructions:', len(self.ast))
        self.pc = 0
        start = time.monotonic()
        while self.pc < len(self.ast):
            name, op, arg = self.ast[self.pc]
            if op == 0x01:
                self.ptr += arg
            elif op == 0x03:
                self.data[self.ptr] = (self.data[self.ptr] + arg) & 0xff
            elif op == 0x10:
                print(chr(self.data[self.ptr]), end='')
            elif op == 0x11:
                self.data[self.ptr] = ord(self._get_input())
            elif op == 0x20:
                if self.data[self.ptr] == 0:
                    self.pc = arg
            elif op == 0x22:
                if self.data[self.ptr] != 0:
                    self.pc = arg
            elif op == 0x30:
                self.data[self.ptr] = 0
            elif op == 0xdb:
                self._debug_print()
            else:
                raise ValueError(f'Illegal instruction: {name}, OP: 0x{op:x}')
            self.pc += 1
        duration = time.monotonic() - start
        print('Duration: {:.2f}ms'.format(duration * 1000))


def main(filename):
    bf = BrainfuckInterpreter(filename, debug='')
    bf.run()


if __name__ == '__main__':
    try:
        main(sys.argv[1])
    except IndexError:
        code = input('Enter code to execute: ')
        bf = BrainfuckInterpreter(code, debug='?')
        bf.process()
