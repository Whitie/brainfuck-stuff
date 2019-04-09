#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import time

from argparse import ArgumentParser
from pathlib import Path
from subprocess import run

from bf2asm import Brainfuck


BF_SOURCE_RE = re.compile(r'^.+?\.bf?$')


def create_directories(args):
    args.sourcedir = Path(args.sourcedir)
    args.sourcedir.mkdir(parents=True, exist_ok=True)
    args.destdir = Path(args.destdir)
    args.destdir.mkdir(parents=True, exist_ok=True)
    args.bindir = Path(args.bindir)
    args.bindir.mkdir(parents=True, exist_ok=True)
    return args


def translate(bf_source, destdir):
    tmp = '{}.asm'.format(bf_source.stem)
    asm_file = destdir / tmp
    bf = Brainfuck(bf_source, asm_file)
    bf.process()
    return asm_file


def compile(asm_file, destdir, nasm):
    tmp = '{}.o'.format(asm_file.stem)
    obj_file = destdir / tmp
    run([nasm, '-f', 'elf64', '-o', str(obj_file), str(asm_file)])
    return obj_file


def link(obj_file, bindir, ld):
    outfile = bindir / obj_file.stem
    run([ld, str(obj_file), '-o', str(outfile)])


def parse_commandline():
    p = ArgumentParser(
        description='Translate all source files from `sourcedir` into '
        '`destdir`, compile and link them and place the binaries in `bindir`.'
    )
    cwd = Path.cwd()
    sourcedir = cwd / 'bf_source'
    destdir = cwd / 'asm_source'
    bindir = cwd / 'bin'
    p.add_argument('-s', '--sourcedir', default=sourcedir, help='Directory '
                   'containing the Brainfuck sources, default: %(default)s')
    p.add_argument('-d', '--destdir', default=destdir, help='Directory '
                   'where the ASM sources should go, default: %(default)s')
    p.add_argument('-b', '--bindir', default=bindir, help='Directory '
                   'where the binaries should go, default: %(default)s')
    p.add_argument('-n', '--nasm', default='nasm', metavar='PATH',
                   help='Path to nasm binary, if not in $PATH, '
                   'default: %(default)s')
    p.add_argument('-l', '--ld', default='ld', metavar='PATH',
                   help='Path to ld binary, if not in $PATH, '
                   'default: %(default)s')
    p.add_argument('-r', '--remove-object-files', action='store_true',
                   default=False, dest='remove', help='Remove object files '
                   'after linking, default: %(default)s')
    return p.parse_args()


def main():
    args = parse_commandline()
    args = create_directories(args)
    count = 0
    start = time.monotonic()
    for source in args.sourcedir.iterdir():
        if BF_SOURCE_RE.match(str(source)):
            asm_file = translate(source, args.destdir)
            obj_file = compile(asm_file, args.destdir, args.nasm)
            link(obj_file, args.bindir, args.ld)
            count += 1
    if args.remove:
        for obj_file in args.destdir.glob('*.o'):
            obj_file.unlink()
    duration = time.monotonic() - start
    print(count, 'files processed in {:.2f}s'.format(duration))


if __name__ == '__main__':
    main()
