# Brainfuck Stuff

Some experiments with the brainfuck language.

This repository mainly contains three Python files:

- bf.py Brainfuck interpreter (with some optimizations)
- bbf.py Translates Brainfuck to simple bytecode and interprets it
         (with the same optimizations)
- bf2asm.py Translates Brainfuck to Linux x86_64 Assembler (NASM syntax)
            source files

## Speed

With my AMD FX-8800 the file bf_source/bench1.bf took the following times:

- bf.py ~340s
- bbf.py ~140s
- bf2asm.py 0.10s (the compiled and linked binary)
