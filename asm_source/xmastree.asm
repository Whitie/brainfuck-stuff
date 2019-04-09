; Translated with bf2asm.py from xmastree.bf
; Compile with: nasm -f elf64 xmastree.asm
; Link with: ld xmastree.o -o xmastree
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

_start:
    mov rsi, tape
    add rsi, 3
    sub byte [rsi], 8
    sub rsi, 1
    call getc
LOOP_0:
    cmp byte [rsi], 0
    jz END_0
    sub rsi, 1
LOOP_1:
    cmp byte [rsi], 0
    jz END_1
    add rsi, 1
    add byte [rsi], 10
    sub rsi, 1
    sub byte [rsi], 1
    jmp LOOP_1
END_1:
    add rsi, 2
LOOP_2:
    cmp byte [rsi], 0
    jz END_2
    sub rsi, 1
    sub byte [rsi], 6
    add rsi, 2
    sub byte [rsi], 1
    call back_inc
    jmp LOOP_2
END_2:
    call getc
    jmp LOOP_0
END_0:
    add byte [rsi], 2
    add rsi, 2
    add byte [rsi], 2
    sub rsi, 1
    sub byte [rsi], 2
LOOP_3:
    cmp byte [rsi], 0
    jz END_3
    sub rsi, 1
    add byte [rsi], 2
LOOP_4:
    cmp byte [rsi], 0
    jz END_4
    add byte [rsi], 1
    add rsi, 1
    jmp LOOP_4
END_4:
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 3
    sub rsi, 1
    jmp LOOP_3
END_3:
    sub rsi, 2
LOOP_5:
    cmp byte [rsi], 0
    jz END_5
    add rsi, 2
    add byte [rsi], 1
LOOP_6:
    cmp byte [rsi], 0
    jz END_6
LOOP_7:
    cmp byte [rsi], 0
    jz END_7
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    jmp LOOP_7
END_7:
    sub rsi, 2
    jmp LOOP_6
END_6:
    add rsi, 4
LOOP_8:
    cmp byte [rsi], 0
    jz END_8
LOOP_9:
    cmp byte [rsi], 0
    jz END_9
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 1
    call putc
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_9
END_9:
    add rsi, 2
    jmp LOOP_8
END_8:
    sub rsi, 1
    call putc
    sub rsi, 3
    add byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    jmp LOOP_5
END_5:
    add rsi, 2
LOOP_10:
    cmp byte [rsi], 0
    jz END_10
    sub rsi, 1
    call putc
    add rsi, 1
    sub byte [rsi], 2
    jmp LOOP_10
END_10:
    add rsi, 1
    call putc
    add rsi, 2
    call putc
    xor rdi, rdi
    mov rax, SYS_EXIT
    syscall

; Helper subroutines
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

back_inc:
    sub rsi, 1
    add byte [rsi], 1
    ret

