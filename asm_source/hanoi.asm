; Translated with bf2asm.py from hanoi.bf
; Compile with: nasm -f elf64 hanoi.asm
; Link with: ld hanoi.o -o hanoi
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
    add rsi, 8
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 4
    add rsi, 1
    add byte [rsi], 1
    add rsi, 6
    add byte [rsi], 8
LOOP_0:
    cmp byte [rsi], 0
    jz END_0
    sub rsi, 1
    add byte [rsi], 12
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_0
END_0:
    sub rsi, 1
LOOP_1:
    cmp byte [rsi], 0
    jz END_1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_1
END_1:
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 3
    add rsi, 1
    add byte [rsi], 5
    sub rsi, 7
LOOP_2:
    cmp byte [rsi], 0
    jz END_2
    add rsi, 1
LOOP_3:
    cmp byte [rsi], 0
    jz END_3
    sub byte [rsi], 1
    add rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 1
LOOP_4:
    cmp byte [rsi], 0
    jz END_4
    sub byte [rsi], 1
LOOP_5:
    cmp byte [rsi], 0
    jz END_5
    sub byte [rsi], 1
LOOP_6:
    cmp byte [rsi], 0
    jz END_6
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 3
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 5
LOOP_7:
    cmp byte [rsi], 0
    jz END_7
    add rsi, 1
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    jmp LOOP_7
END_7:
    add rsi, 1
LOOP_8:
    cmp byte [rsi], 0
    jz END_8
    call back_inc
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_8
END_8:
    add rsi, 1
    sub byte [rsi], 1
LOOP_9:
    cmp byte [rsi], 0
    jz END_9
    mov byte [rsi], 0
    call back_inc
    add rsi, 3
    add byte [rsi], 4
    sub rsi, 7
LOOP_10:
    cmp byte [rsi], 0
    jz END_10
    add rsi, 8
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 9
    sub byte [rsi], 1
    jmp LOOP_10
END_10:
    add rsi, 9
LOOP_11:
    cmp byte [rsi], 0
    jz END_11
    sub rsi, 9
    add byte [rsi], 1
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_11
END_11:
    sub rsi, 7
LOOP_12:
    cmp byte [rsi], 0
    jz END_12
    add rsi, 7
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 8
    sub byte [rsi], 1
    jmp LOOP_12
END_12:
    add rsi, 8
LOOP_13:
    cmp byte [rsi], 0
    jz END_13
    sub rsi, 8
    add byte [rsi], 1
    add rsi, 8
    sub byte [rsi], 1
    jmp LOOP_13
END_13:
    sub rsi, 9
LOOP_14:
    cmp byte [rsi], 0
    jz END_14
    add rsi, 9
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 10
    sub byte [rsi], 1
    jmp LOOP_14
END_14:
    add rsi, 10
LOOP_15:
    cmp byte [rsi], 0
    jz END_15
    sub rsi, 10
    add byte [rsi], 1
    add rsi, 10
    sub byte [rsi], 1
    jmp LOOP_15
END_15:
    sub rsi, 8
LOOP_16:
    cmp byte [rsi], 0
    jz END_16
    add rsi, 8
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 9
    sub byte [rsi], 1
    jmp LOOP_16
END_16:
    add rsi, 9
LOOP_17:
    cmp byte [rsi], 0
    jz END_17
    sub rsi, 9
    add byte [rsi], 1
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_17
END_17:
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 2
    jmp LOOP_9
END_9:
    sub rsi, 8
    jmp LOOP_6
END_6:
    add rsi, 1
LOOP_18:
    cmp byte [rsi], 0
    jz END_18
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 2
    add rsi, 5
    add byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 7
LOOP_19:
    cmp byte [rsi], 0
    jz END_19
    add rsi, 8
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 9
    sub byte [rsi], 1
    jmp LOOP_19
END_19:
    add rsi, 9
LOOP_20:
    cmp byte [rsi], 0
    jz END_20
    sub rsi, 9
    add byte [rsi], 1
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_20
END_20:
    sub rsi, 8
LOOP_21:
    cmp byte [rsi], 0
    jz END_21
    add rsi, 8
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 9
    sub byte [rsi], 1
    jmp LOOP_21
END_21:
    add rsi, 9
LOOP_22:
    cmp byte [rsi], 0
    jz END_22
    sub rsi, 9
    add byte [rsi], 1
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_22
END_22:
    sub rsi, 8
LOOP_23:
    cmp byte [rsi], 0
    jz END_23
    add rsi, 8
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 9
    sub byte [rsi], 1
    jmp LOOP_23
END_23:
    add rsi, 9
LOOP_24:
    cmp byte [rsi], 0
    jz END_24
    sub rsi, 9
    add byte [rsi], 1
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_24
END_24:
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_18
END_18:
    sub rsi, 1
    jmp LOOP_5
END_5:
    add rsi, 1
LOOP_25:
    cmp byte [rsi], 0
    jz END_25
    sub byte [rsi], 1
    add rsi, 5
LOOP_26:
    cmp byte [rsi], 0
    jz END_26
    add rsi, 1
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    jmp LOOP_26
END_26:
    add rsi, 1
LOOP_27:
    cmp byte [rsi], 0
    jz END_27
    call back_inc
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_27
END_27:
    add rsi, 1
    sub byte [rsi], 1
LOOP_28:
    cmp byte [rsi], 0
    jz END_28
    mov byte [rsi], 0
    call back_inc
    add rsi, 3
    add byte [rsi], 4
    sub rsi, 6
LOOP_29:
    cmp byte [rsi], 0
    jz END_29
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 7
    sub byte [rsi], 1
    jmp LOOP_29
END_29:
    add rsi, 8
LOOP_30:
    cmp byte [rsi], 0
    jz END_30
    sub rsi, 8
    add byte [rsi], 1
    add rsi, 8
    sub byte [rsi], 1
    jmp LOOP_30
END_30:
    sub rsi, 9
LOOP_31:
    cmp byte [rsi], 0
    jz END_31
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    sub byte [rsi], 1
    jmp LOOP_31
END_31:
    add rsi, 10
LOOP_32:
    cmp byte [rsi], 0
    jz END_32
    sub rsi, 10
    add byte [rsi], 1
    add rsi, 10
    sub byte [rsi], 1
    jmp LOOP_32
END_32:
    sub rsi, 8
LOOP_33:
    cmp byte [rsi], 0
    jz END_33
    add rsi, 8
    add byte [rsi], 1
    sub rsi, 8
    sub byte [rsi], 1
    jmp LOOP_33
END_33:
    add rsi, 9
LOOP_34:
    cmp byte [rsi], 0
    jz END_34
    sub rsi, 9
    add byte [rsi], 1
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_34
END_34:
    sub rsi, 8
LOOP_35:
    cmp byte [rsi], 0
    jz END_35
    add rsi, 8
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 9
    sub byte [rsi], 1
    jmp LOOP_35
END_35:
    add rsi, 9
LOOP_36:
    cmp byte [rsi], 0
    jz END_36
    sub rsi, 9
    add byte [rsi], 1
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_36
END_36:
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 2
    jmp LOOP_28
END_28:
    sub rsi, 7
    jmp LOOP_25
END_25:
    sub rsi, 1
    jmp LOOP_4
END_4:
    add rsi, 1
LOOP_37:
    cmp byte [rsi], 0
    jz END_37
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 4
LOOP_38:
    cmp byte [rsi], 0
    jz END_38
    sub rsi, 1
    add byte [rsi], 8
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_38
END_38:
    add rsi, 1
    add byte [rsi], 8
LOOP_39:
    cmp byte [rsi], 0
    jz END_39
    sub rsi, 1
    add byte [rsi], 9
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_39
END_39:
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 2
    add byte [rsi], 8
LOOP_40:
    cmp byte [rsi], 0
    jz END_40
    sub rsi, 1
    add byte [rsi], 12
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_40
END_40:
    sub rsi, 1
    add byte [rsi], 5
    add rsi, 2
    add byte [rsi], 9
LOOP_41:
    cmp byte [rsi], 0
    jz END_41
    sub rsi, 1
    add byte [rsi], 12
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_41
END_41:
    sub rsi, 1
    add byte [rsi], 3
    sub rsi, 2
    call putc
    add byte [rsi], 7
    add rsi, 1
    call putc
    add byte [rsi], 2
    call putc
    sub byte [rsi], 2
    call putc
    sub rsi, 2
    call putc
    add rsi, 2
    sub byte [rsi], 1
    call putc
    add byte [rsi], 5
    call putc
    sub byte [rsi], 4
    call putc
    sub rsi, 2
    call putc
    add rsi, 3
    call putc
    sub rsi, 1
    sub byte [rsi], 3
    call putc
    add byte [rsi], 3
    call putc
    add rsi, 1
    add byte [rsi], 3
    call putc
    add byte [rsi], 1
    call putc
    add byte [rsi], 1
    call putc
    sub rsi, 1
    call putc
    sub rsi, 2
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    sub byte [rsi], 2
    call putc
    add byte [rsi], 5
    call putc
    sub byte [rsi], 3
    call putc
    add byte [rsi], 4
    call putc
    sub byte [rsi], 7
    call putc
    add byte [rsi], 3
    call putc
    sub rsi, 2
    call putc
    add rsi, 3
    add byte [rsi], 2
    call putc
    sub byte [rsi], 7
    call putc
    sub byte [rsi], 1
    call putc
    sub rsi, 3
    call putc
    add rsi, 1
    add byte [rsi], 1
    call putc
    add rsi, 2
    add byte [rsi], 7
    call putc
    sub byte [rsi], 3
    call putc
    sub byte [rsi], 5
    call putc
    sub rsi, 3
    call putc
    sub rsi, 4
    call putc
    add rsi, 4
    call putc
    add rsi, 2
    sub byte [rsi], 4
    call putc
    add rsi, 1
    add byte [rsi], 8
    call putc
    sub rsi, 1
    add byte [rsi], 5
    call putc
    sub rsi, 2
    call putc
    add rsi, 1
    call putc
    add rsi, 2
    call putc
    sub byte [rsi], 3
    call putc
    sub byte [rsi], 5
    call putc
    sub rsi, 3
    call putc
    sub rsi, 2
    call putc
    add rsi, 2
    add byte [rsi], 14
    call putc
    add rsi, 3
    mov byte [rsi], 0
    sub rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 13
    call putc
    sub byte [rsi], 3
    call putc
    mov byte [rsi], 0
    sub rsi, 6
    jmp LOOP_37
END_37:
    add rsi, 1
LOOP_42:
    cmp byte [rsi], 0
    jz END_42
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    jmp LOOP_42
END_42:
    sub rsi, 2
    jmp LOOP_3
END_3:
    sub rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 12
LOOP_43:
    cmp byte [rsi], 0
    jz END_43
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    jmp LOOP_43
END_43:
    sub rsi, 3
    jmp LOOP_2
END_2:
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

