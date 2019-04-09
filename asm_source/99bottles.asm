; Translated with bf2asm.py from 99bottles.bf
; Compile with: nasm -f elf64 99bottles.asm
; Link with: ld 99bottles.o -o 99bottles
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
    call putc
    add rsi, 1
    add byte [rsi], 7
    add rsi, 1
    add byte [rsi], 10
LOOP_0:
    cmp byte [rsi], 0
    jz END_0
    sub rsi, 1
    add byte [rsi], 5
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_0
END_0:
    add byte [rsi], 7
    add rsi, 1
    add byte [rsi], 10
LOOP_1:
    cmp byte [rsi], 0
    jz END_1
    sub rsi, 1
    add byte [rsi], 5
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_1
END_1:
    add byte [rsi], 10
    add rsi, 1
    add byte [rsi], 9
    add rsi, 2
    add byte [rsi], 8
LOOP_2:
    cmp byte [rsi], 0
    jz END_2
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_2
END_2:
    add rsi, 1
    add byte [rsi], 14
LOOP_3:
    cmp byte [rsi], 0
    jz END_3
    sub rsi, 1
    add byte [rsi], 7
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_3
END_3:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 11
LOOP_4:
    cmp byte [rsi], 0
    jz END_4
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_4
END_4:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 19
LOOP_5:
    cmp byte [rsi], 0
    jz END_5
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_5
END_5:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 19
LOOP_6:
    cmp byte [rsi], 0
    jz END_6
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_6
END_6:
    add rsi, 1
    add byte [rsi], 12
LOOP_7:
    cmp byte [rsi], 0
    jz END_7
    sub rsi, 1
    add byte [rsi], 9
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_7
END_7:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 10
LOOP_8:
    cmp byte [rsi], 0
    jz END_8
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_8
END_8:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 19
LOOP_9:
    cmp byte [rsi], 0
    jz END_9
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_9
END_9:
    add rsi, 1
    add byte [rsi], 8
LOOP_10:
    cmp byte [rsi], 0
    jz END_10
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_10
END_10:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 11
LOOP_11:
    cmp byte [rsi], 0
    jz END_11
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_11
END_11:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 10
LOOP_12:
    cmp byte [rsi], 0
    jz END_12
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_12
END_12:
    add rsi, 1
    add byte [rsi], 8
LOOP_13:
    cmp byte [rsi], 0
    jz END_13
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_13
END_13:
    add rsi, 1
    add byte [rsi], 14
LOOP_14:
    cmp byte [rsi], 0
    jz END_14
    sub rsi, 1
    add byte [rsi], 7
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_14
END_14:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 10
LOOP_15:
    cmp byte [rsi], 0
    jz END_15
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_15
END_15:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 10
LOOP_16:
    cmp byte [rsi], 0
    jz END_16
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_16
END_16:
    add rsi, 1
    add byte [rsi], 19
LOOP_17:
    cmp byte [rsi], 0
    jz END_17
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_17
END_17:
    add rsi, 1
    add byte [rsi], 8
LOOP_18:
    cmp byte [rsi], 0
    jz END_18
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_18
END_18:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 11
LOOP_19:
    cmp byte [rsi], 0
    jz END_19
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_19
END_19:
    add rsi, 1
    add byte [rsi], 11
LOOP_20:
    cmp byte [rsi], 0
    jz END_20
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_20
END_20:
    add rsi, 1
    add byte [rsi], 8
LOOP_21:
    cmp byte [rsi], 0
    jz END_21
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_21
END_21:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 19
LOOP_22:
    cmp byte [rsi], 0
    jz END_22
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_22
END_22:
    add byte [rsi], 4
    add rsi, 1
    add byte [rsi], 10
LOOP_23:
    cmp byte [rsi], 0
    jz END_23
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_23
END_23:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 10
LOOP_24:
    cmp byte [rsi], 0
    jz END_24
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_24
END_24:
    add rsi, 1
    add byte [rsi], 8
LOOP_25:
    cmp byte [rsi], 0
    jz END_25
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_25
END_25:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 13
LOOP_26:
    cmp byte [rsi], 0
    jz END_26
    sub rsi, 1
    add byte [rsi], 9
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_26
END_26:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 12
LOOP_27:
    cmp byte [rsi], 0
    jz END_27
    sub rsi, 1
    add byte [rsi], 8
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_27
END_27:
    add rsi, 1
    add byte [rsi], 12
LOOP_28:
    cmp byte [rsi], 0
    jz END_28
    sub rsi, 1
    add byte [rsi], 9
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_28
END_28:
    add rsi, 1
    add byte [rsi], 12
LOOP_29:
    cmp byte [rsi], 0
    jz END_29
    sub rsi, 1
    add byte [rsi], 9
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_29
END_29:
    add rsi, 1
    add byte [rsi], 5
LOOP_30:
    cmp byte [rsi], 0
    jz END_30
    sub rsi, 1
    add byte [rsi], 2
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_30
END_30:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 19
LOOP_31:
    cmp byte [rsi], 0
    jz END_31
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_31
END_31:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 12
LOOP_32:
    cmp byte [rsi], 0
    jz END_32
    sub rsi, 1
    add byte [rsi], 8
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_32
END_32:
    add byte [rsi], 3
    add rsi, 1
    add byte [rsi], 13
LOOP_33:
    cmp byte [rsi], 0
    jz END_33
    sub rsi, 1
    add byte [rsi], 8
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_33
END_33:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 10
LOOP_34:
    cmp byte [rsi], 0
    jz END_34
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_34
END_34:
    add rsi, 1
    add byte [rsi], 8
LOOP_35:
    cmp byte [rsi], 0
    jz END_35
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_35
END_35:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 11
LOOP_36:
    cmp byte [rsi], 0
    jz END_36
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_36
END_36:
    add rsi, 1
    add byte [rsi], 11
LOOP_37:
    cmp byte [rsi], 0
    jz END_37
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_37
END_37:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 10
LOOP_38:
    cmp byte [rsi], 0
    jz END_38
    sub rsi, 1
    add byte [rsi], 10
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
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_39
END_39:
    add rsi, 1
    add byte [rsi], 10
LOOP_40:
    cmp byte [rsi], 0
    jz END_40
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_40
END_40:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 11
LOOP_41:
    cmp byte [rsi], 0
    jz END_41
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_41
END_41:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 13
LOOP_42:
    cmp byte [rsi], 0
    jz END_42
    sub rsi, 1
    add byte [rsi], 9
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_42
END_42:
    add rsi, 1
    add byte [rsi], 11
LOOP_43:
    cmp byte [rsi], 0
    jz END_43
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_43
END_43:
    add rsi, 1
    add byte [rsi], 8
LOOP_44:
    cmp byte [rsi], 0
    jz END_44
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_44
END_44:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 12
LOOP_45:
    cmp byte [rsi], 0
    jz END_45
    sub rsi, 1
    add byte [rsi], 8
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_45
END_45:
    add rsi, 1
    add byte [rsi], 11
LOOP_46:
    cmp byte [rsi], 0
    jz END_46
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_46
END_46:
    add rsi, 1
    add byte [rsi], 10
LOOP_47:
    cmp byte [rsi], 0
    jz END_47
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_47
END_47:
    add rsi, 1
    add byte [rsi], 8
LOOP_48:
    cmp byte [rsi], 0
    jz END_48
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_48
END_48:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 11
LOOP_49:
    cmp byte [rsi], 0
    jz END_49
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_49
END_49:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 12
LOOP_50:
    cmp byte [rsi], 0
    jz END_50
    sub rsi, 1
    add byte [rsi], 8
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_50
END_50:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 19
LOOP_51:
    cmp byte [rsi], 0
    jz END_51
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_51
END_51:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 19
LOOP_52:
    cmp byte [rsi], 0
    jz END_52
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_52
END_52:
    add rsi, 1
    add byte [rsi], 8
LOOP_53:
    cmp byte [rsi], 0
    jz END_53
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_53
END_53:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 13
LOOP_54:
    cmp byte [rsi], 0
    jz END_54
    sub rsi, 1
    add byte [rsi], 8
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_54
END_54:
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 19
LOOP_55:
    cmp byte [rsi], 0
    jz END_55
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_55
END_55:
    add rsi, 1
    add byte [rsi], 8
LOOP_56:
    cmp byte [rsi], 0
    jz END_56
    sub rsi, 1
    add byte [rsi], 4
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_56
END_56:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 12
LOOP_57:
    cmp byte [rsi], 0
    jz END_57
    sub rsi, 1
    add byte [rsi], 8
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_57
END_57:
    add rsi, 1
    add byte [rsi], 19
LOOP_58:
    cmp byte [rsi], 0
    jz END_58
    sub rsi, 1
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_58
END_58:
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 11
LOOP_59:
    cmp byte [rsi], 0
    jz END_59
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_59
END_59:
    add rsi, 1
    add byte [rsi], 13
LOOP_60:
    cmp byte [rsi], 0
    jz END_60
    sub rsi, 1
    add byte [rsi], 9
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_60
END_60:
    add rsi, 1
    add byte [rsi], 11
LOOP_61:
    cmp byte [rsi], 0
    jz END_61
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_61
END_61:
    add rsi, 1
    add byte [rsi], 10
LOOP_62:
    cmp byte [rsi], 0
    jz END_62
    sub rsi, 1
    add byte [rsi], 10
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_62
END_62:
    add rsi, 1
    add byte [rsi], 5
LOOP_63:
    cmp byte [rsi], 0
    jz END_63
    sub rsi, 1
    add byte [rsi], 2
    add rsi, 1
    sub byte [rsi], 1
    jmp LOOP_63
END_63:
    add byte [rsi], 13
LOOP_64:
    cmp byte [rsi], 0
    jz END_64
    sub rsi, 1
    jmp LOOP_64
END_64:
    add rsi, 4
LOOP_65:
    cmp byte [rsi], 0
    jz END_65
    sub rsi, 1
LOOP_66:
    cmp byte [rsi], 0
    jz END_66
LOOP_67:
    cmp byte [rsi], 0
    jz END_67
    add rsi, 1
    jmp LOOP_67
END_67:
    sub rsi, 2
    call putc
    call putc
LOOP_68:
    cmp byte [rsi], 0
    jz END_68
    sub rsi, 1
    jmp LOOP_68
END_68:
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_69:
    cmp byte [rsi], 0
    jz END_69
    sub rsi, 1
    jmp LOOP_69
END_69:
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 13
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_70:
    cmp byte [rsi], 0
    jz END_70
    sub rsi, 1
    jmp LOOP_70
END_70:
    add rsi, 2
    sub byte [rsi], 1
    sub rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_71:
    cmp byte [rsi], 0
    jz END_71
    sub rsi, 1
    jmp LOOP_71
END_71:
    add rsi, 3
    sub byte [rsi], 1
    jmp LOOP_66
END_66:
    add byte [rsi], 10
    sub rsi, 1
    add byte [rsi], 10
    sub rsi, 1
    sub byte [rsi], 1
LOOP_72:
    cmp byte [rsi], 0
    jz END_72
    add rsi, 1
    jmp LOOP_72
END_72:
    sub rsi, 1
    call putc
LOOP_73:
    cmp byte [rsi], 0
    jz END_73
    sub rsi, 1
    jmp LOOP_73
END_73:
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_74:
    cmp byte [rsi], 0
    jz END_74
    sub rsi, 1
    jmp LOOP_74
END_74:
    add rsi, 4
    sub byte [rsi], 1
    jmp LOOP_65
END_65:
    add byte [rsi], 1
    sub rsi, 1
    sub byte [rsi], 2
LOOP_75:
    cmp byte [rsi], 0
    jz END_75
LOOP_76:
    cmp byte [rsi], 0
    jz END_76
    add rsi, 1
    jmp LOOP_76
END_76:
    sub rsi, 2
    call putc
    call putc
LOOP_77:
    cmp byte [rsi], 0
    jz END_77
    sub rsi, 1
    jmp LOOP_77
END_77:
    add rsi, 2
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_78:
    cmp byte [rsi], 0
    jz END_78
    sub rsi, 1
    jmp LOOP_78
END_78:
    add rsi, 2
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 13
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_79:
    cmp byte [rsi], 0
    jz END_79
    sub rsi, 1
    jmp LOOP_79
END_79:
    add rsi, 2
    sub byte [rsi], 1
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_80:
    cmp byte [rsi], 0
    jz END_80
    sub rsi, 1
    jmp LOOP_80
END_80:
    add rsi, 3
    sub byte [rsi], 1
    jmp LOOP_75
END_75:
    add byte [rsi], 1
LOOP_81:
    cmp byte [rsi], 0
    jz END_81
    add rsi, 1
    jmp LOOP_81
END_81:
    sub rsi, 1
    call putc
LOOP_82:
    cmp byte [rsi], 0
    jz END_82
    sub rsi, 1
    jmp LOOP_82
END_82:
    add rsi, 2
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 2
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    sub rsi, 4
    call putc
LOOP_83:
    cmp byte [rsi], 0
    jz END_83
    add rsi, 1
    jmp LOOP_83
END_83:
    sub rsi, 2
    call putc
    call putc
LOOP_84:
    cmp byte [rsi], 0
    jz END_84
    sub rsi, 1
    jmp LOOP_84
END_84:
    add rsi, 2
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 2
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_85:
    cmp byte [rsi], 0
    jz END_85
    sub rsi, 1
    jmp LOOP_85
END_85:
    add rsi, 2
    call putc
    add rsi, 3
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 2
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 13
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
LOOP_86:
    cmp byte [rsi], 0
    jz END_86
    add rsi, 1
    jmp LOOP_86
END_86:
    sub rsi, 4
    call putc
    sub rsi, 2
    call putc
    sub rsi, 3
    call putc
LOOP_87:
    cmp byte [rsi], 0
    jz END_87
    sub rsi, 1
    jmp LOOP_87
END_87:
    add rsi, 5
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
    call putc
    add rsi, 1
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


