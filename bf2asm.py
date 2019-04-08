#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import re
import sys

from argparse import ArgumentParser
from functools import partial


MOVE_RE = re.compile(r'[<>]{2,}')
INC_DEC_RE = re.compile(r'[+-]{2,}')
CLEAR_LOOP_RE = re.compile(r'\[(\+|\-)\]')
START_COMMENT_RE = re.compile(r'^\[.+?\]', re.DOTALL)
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
ASM_HEADER = """\
; Translated with bf2asm.py from {filename}.bf
; Compile with: nasm -f elf64 {filename}.asm
; Link with: ld {filename}.o -o {filename}
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDIN 0
%define STDOUT 1
%define INPUT_OUTPUT_SIZE 1
%define TAPE_SIZE 32768

section .bss
    buf resb 1

section .data
    tape times TAPE_SIZE db 0

section .text
    global _start

putc:
    mov rdi, STDOUT
    mov rdx, INPUT_OUTPUT_SIZE
    mov rax, SYS_WRITE
    syscall
    ret

getc:
    mov rdi, STDIN
    mov rdx, INPUT_OUTPUT_SIZE
    mov rax, SYS_READ
    syscall
    cmp byte [rsi], 10
    je no_input
    call clear_linebuffer
    ret
no_input:
    mov byte [rsi], 0
    ret

clear_linebuffer:
    push rsi
cl_loop:
    mov rdi, STDIN
    mov rsi, buf
    mov rdx, 1
    mov rax, SYS_READ
    syscall
    cmp byte [rsi], 10
    jne cl_loop
    pop rsi
    ret

{binc}
_start:
    mov rsi, tape
{generated_code}
    xor rdi, rdi
    mov rax, SYS_EXIT
    syscall
"""
BINC = """\
back_inc:
    sub rsi, 1
    add byte [rsi], 1
    ret
"""


# Helper functions (only for optimization)
def balance(match, inc, dec):
    s = match.group(0)
    count_inc = s.count(inc)
    count_dec = s.count(dec)
    if count_inc > count_dec:
        return (count_inc - count_dec) * inc
    elif count_dec > count_inc:
        return (count_dec - count_inc) * dec
    else:
        return ''


def aggregate(match, sym):
    return '{}{}'.format(sym, len(match.group(0)))


def _asm_pre_optimize(code, commands):
    return code


def _asm_post_optimize(code, commands):
    repl = '{MOVE_LEFT}{INCREMENT}'.format(**commands)
    code = code.replace(repl, 'C')
    return code


def optimize(code, commands):
    cl = len(code)
    print('Cleaned code length:', cl, file=sys.stderr)
    code = _asm_pre_optimize(code, commands)
    code = INC_DEC_RE.sub(
        partial(balance, inc=commands['INCREMENT'], dec=commands['DECREMENT']),
        code
    )
    code = MOVE_RE.sub(
        partial(balance, inc=commands['MOVE_RIGHT'],
                dec=commands['MOVE_LEFT']),
        code
    )
    code = CLEAR_LOOP_RE.sub('%', code)
    code = START_COMMENT_RE.sub('', code)
    lookup = {
        'I': commands['INCREMENT'],
        'D': commands['DECREMENT'],
        'R': commands['MOVE_RIGHT'],
        'L': commands['MOVE_LEFT'],
    }
    for sym, instruction in lookup.items():
        sym_re = r'{}{{2,}}'.format(re.escape(instruction))
        code = re.sub(sym_re, partial(aggregate, sym=sym), code)
    code = _asm_post_optimize(code, commands)
    ocl = len(code)
    if cl == ocl:
        print('No optimization found', file=sys.stderr)
    else:
        print('Optimized code length:', ocl, file=sys.stderr)
    return code


class Brainfuck:

    def __init__(self, filename, asm_filename=None, **commands):
        self.filename = filename
        self.executable = os.path.splitext(filename)[0]
        self.asm_filename = asm_filename or '{}.asm'.format(self.executable)
        with open(filename) as fp:
            code = fp.read()
        self.commands = BF_COMMANDS.copy()
        self.commands.update(commands)
        self.cleaned_code = self._clean_code(code)
        self.code = optimize(self.cleaned_code, self.commands)
        self.pc = 0
        self._stack = []
        self.asm = []
        self.loop = 0

    def _clean_code(self, raw_code):
        print('Input length:', len(raw_code))
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

    def process(self):
        print('Cleaned code:', self.cleaned_code)
        if len(self.code) < len(self.cleaned_code):
            print('Optimized code:', self.code)
        binc = BINC if 'C' in self.code else ''
        while self.pc < len(self.code):
            instruction = self.code[self.pc]
            self.process_instruction(instruction)
        with open(self.asm_filename, 'w') as fp:
            fp.write(
                ASM_HEADER.format(
                    filename=self.executable.split('/')[-1],
                    generated_code='\n'.join(self.asm),
                    binc=binc
                )
            )
        print('Assembler source written to', self.asm_filename)

    def process_instruction(self, instruction):
        if instruction == self.commands['MOVE_RIGHT']:
            self.asm.append('    add rsi, 1')
        elif instruction == self.commands['MOVE_LEFT']:
            self.asm.append('    sub rsi, 1')
        elif instruction == self.commands['INCREMENT']:
            self.asm.append('    add byte [rsi], 1')
        elif instruction == self.commands['DECREMENT']:
            self.asm.append('    sub byte [rsi], 1')
        elif instruction == self.commands['WRITE_CHAR']:
            self.asm.append('    call putc')
        elif instruction == self.commands['READ_CHAR']:
            self.asm.append('    call getc')
        elif instruction == self.commands['LOOP_START']:
            self._stack.append(self.loop)
            self.asm.append('LOOP_{}:'.format(self.loop))
            self.asm.append('    cmp byte [rsi], 0')
            self.asm.append('    jz END_{}'.format(self.loop))
            self.loop += 1
        elif instruction == self.commands['LOOP_END']:
            loop_nr = self._stack.pop()
            self.asm.append('    jmp LOOP_{}'.format(loop_nr))
            self.asm.append('END_{}:'.format(loop_nr))
        # Special optimized instructions
        elif instruction == '%':
            self.asm.append('    mov byte [rsi], 0')
        elif instruction == 'I':
            self.pc += 1
            num = self._get_num()
            self.asm.append(f'    add byte [rsi], {num}')
        elif instruction == 'D':
            self.pc += 1
            num = self._get_num()
            self.asm.append(f'    sub byte [rsi], {num}')
        elif instruction == 'R':
            self.pc += 1
            num = self._get_num()
            self.asm.append(f'    add rsi, {num}')
        elif instruction == 'L':
            self.pc += 1
            num = self._get_num()
            self.asm.append(f'    sub rsi, {num}')
        elif instruction == 'C':
            self.asm.append('    call back_inc')
        else:
            raise ValueError(f'Illegal instruction: {instruction}')
        self.pc += 1


def main():
    parser = ArgumentParser(description='Translate Brainfuck source to '
                            'x86_64 Assembler (NASM syntax).')
    parser.add_argument('infile', help='Brainfuck file to translate')
    parser.add_argument('-o', '--outfile', help='Name of the .asm file, '
                        'default: infile.asm', default=None)
    parser.add_argument('-c', '--command', action='append', help='Change '
                        'the Brainfuck commands. Read the source for '
                        'choices. Example: -c LOOP_START="(" -c LOOP_END=")"',
                        default=[])
    args = parser.parse_args()
    commands = {}
    for command in args.command:
        k, v = command.split('=')
        commands[k] = v
    bf = Brainfuck(args.infile, args.outfile, **commands)
    bf.process()


if __name__ == '__main__':
    main()
