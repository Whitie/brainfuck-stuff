#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import sys
import time

from collections import deque
from functools import partial


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


# Code helper
def build_bracemap(code, start_loop, end_loop):
    stack = []
    bracemap = {}
    for pos, instruction in enumerate(code):
        if instruction == start_loop:
            stack.append(pos)
        elif instruction == end_loop:
            start = stack.pop()
            bracemap[start] = pos
            bracemap[pos] = start
    return bracemap


class BrainfuckInterpreter:

    def __init__(self, code, datasize=DATASIZE, debug='', **commands):
        self.commands = BF_COMMANDS.copy()
        self.commands['BF_DEBUG'] = debug
        self.commands.update(commands)
        self.cleaned_code = self._clean_code(code)
        self.code = optimize(self.cleaned_code, self.commands)
        self.bracemap = build_bracemap(self.code, self.commands['LOOP_START'],
                                       self.commands['LOOP_END'])
        self.data = bytearray(datasize)
        self.ptr = 0
        self.pc = 0
        self.input_buffer = deque(maxlen=255)

    def _clean_code(self, raw_code):
        print('Input length:', len(raw_code), file=sys.stderr)
        tmp = []
        for c in raw_code:
            if c in self.commands.values():
                tmp.append(c)
        return ''.join(tmp)

    def _inc(self, step=1):
        if self.data[self.ptr] == 255:
            self.data[self.ptr] = 0
        else:
            self.data[self.ptr] += 1
        step -= 1
        if step:
            self.data[self.ptr] += step

    def _dec(self, step=1):
        if self.data[self.ptr] == 0:
            self.data[self.ptr] = 255
        else:
            self.data[self.ptr] -= 1
        step -= 1
        if step:
            self.data[self.ptr] -= step

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
        start = time.monotonic()
        while self.pc < len(self.code):
            instruction = self.code[self.pc]
            self.process_instruction(instruction)
        duration = time.monotonic() - start
        print('Runtime: {:.2f}ms'.format(duration * 1000), file=sys.stderr)

    def process_instruction(self, instruction):
        if instruction == self.commands['MOVE_RIGHT']:
            self.ptr += 1
        elif instruction == self.commands['MOVE_LEFT']:
            self.ptr -= 1
        elif instruction == self.commands['INCREMENT']:
            self._inc()
        elif instruction == self.commands['DECREMENT']:
            self._dec()
        elif instruction == self.commands['WRITE_CHAR']:
            print(chr(self.data[self.ptr]), end='')
        elif instruction == self.commands['READ_CHAR']:
            self.data[self.ptr] = ord(self._get_input())
        elif instruction == self.commands['LOOP_START']:
            if self.data[self.ptr] == 0:
                self.pc = self.bracemap[self.pc]
        elif instruction == self.commands['LOOP_END']:
            if self.data[self.ptr] != 0:
                self.pc = self.bracemap[self.pc]
        elif instruction == self.commands['BF_DEBUG']:
            self._debug_print()
        # Special optimized instructions
        elif instruction == '%':
            self.data[self.ptr] = 0
        elif instruction == 'I':
            self.pc += 1
            self._inc(self._get_num())
        elif instruction == 'D':
            self.pc += 1
            self._dec(self._get_num())
        elif instruction == 'R':
            self.pc += 1
            self.ptr += self._get_num()
        elif instruction == 'L':
            self.pc += 1
            self.ptr -= self._get_num()
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


def main(filename):
    with open(filename) as fp:
        code = fp.read()
    bf = BrainfuckInterpreter(code, debug='')
    bf.process()


if __name__ == '__main__':
    try:
        main(sys.argv[1])
    except IndexError:
        code = input('Enter code to execute: ')
        bf = BrainfuckInterpreter(code, debug='?')
        bf.process()
