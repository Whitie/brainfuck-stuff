; Translated with bf2asm.py from mandelbrot.bf
; Compile with: nasm -f elf64 mandelbrot.asm
; Link with: ld mandelbrot.o -o mandelbrot
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
    add byte [rsi], 13
LOOP_0:
    cmp byte [rsi], 0
    jz END_0
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 2
    add rsi, 3
    add byte [rsi], 5
    add rsi, 1
    add byte [rsi], 2
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 6
    jmp LOOP_0
END_0:
    add rsi, 5
    add byte [rsi], 6
    add rsi, 1
    sub byte [rsi], 3
    add rsi, 10
    add byte [rsi], 15
LOOP_1:
    cmp byte [rsi], 0
    jz END_1
LOOP_2:
    cmp byte [rsi], 0
    jz END_2
    add rsi, 9
    jmp LOOP_2
END_2:
    add byte [rsi], 1
LOOP_3:
    cmp byte [rsi], 0
    jz END_3
    sub rsi, 9
    jmp LOOP_3
END_3:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_1
END_1:
    add byte [rsi], 1
LOOP_4:
    cmp byte [rsi], 0
    jz END_4
    add rsi, 8
    mov byte [rsi], 0
    add rsi, 1
    jmp LOOP_4
END_4:
    sub rsi, 9
LOOP_5:
    cmp byte [rsi], 0
    jz END_5
    sub rsi, 9
    jmp LOOP_5
END_5:
    add rsi, 8
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 5
LOOP_6:
    cmp byte [rsi], 0
    jz END_6
    sub byte [rsi], 1
LOOP_7:
    cmp byte [rsi], 0
    jz END_7
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_7
END_7:
    add rsi, 9
    jmp LOOP_6
END_6:
    add rsi, 7
    add byte [rsi], 1
    add rsi, 27
    add byte [rsi], 1
    sub rsi, 17
LOOP_8:
    cmp byte [rsi], 0
    jz END_8
    sub rsi, 9
    jmp LOOP_8
END_8:
    add rsi, 3
    mov byte [rsi], 0
    add byte [rsi], 1
LOOP_9:
    cmp byte [rsi], 0
    jz END_9
    add rsi, 6
LOOP_10:
    cmp byte [rsi], 0
    jz END_10
    add rsi, 7
    mov byte [rsi], 0
    add rsi, 2
    jmp LOOP_10
END_10:
    sub rsi, 9
LOOP_11:
    cmp byte [rsi], 0
    jz END_11
    sub rsi, 9
    jmp LOOP_11
END_11:
    add rsi, 7
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 4
LOOP_12:
    cmp byte [rsi], 0
    jz END_12
    sub byte [rsi], 1
LOOP_13:
    cmp byte [rsi], 0
    jz END_13
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_13
END_13:
    add rsi, 9
    jmp LOOP_12
END_12:
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 7
LOOP_14:
    cmp byte [rsi], 0
    jz END_14
    sub byte [rsi], 1
LOOP_15:
    cmp byte [rsi], 0
    jz END_15
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_15
END_15:
    add rsi, 9
    jmp LOOP_14
END_14:
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 16
LOOP_16:
    cmp byte [rsi], 0
    jz END_16
    sub rsi, 9
    jmp LOOP_16
END_16:
    add rsi, 3
LOOP_17:
    cmp byte [rsi], 0
    jz END_17
    mov byte [rsi], 0
    add rsi, 6
LOOP_18:
    cmp byte [rsi], 0
    jz END_18
    add rsi, 7
LOOP_19:
    cmp byte [rsi], 0
    jz END_19
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_19
END_19:
    sub rsi, 6
LOOP_20:
    cmp byte [rsi], 0
    jz END_20
    sub byte [rsi], 1
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_20
END_20:
    add rsi, 8
    jmp LOOP_18
END_18:
    sub rsi, 9
LOOP_21:
    cmp byte [rsi], 0
    jz END_21
    sub rsi, 9
    jmp LOOP_21
END_21:
    add rsi, 9
LOOP_22:
    cmp byte [rsi], 0
    jz END_22
    add rsi, 8
LOOP_23:
    cmp byte [rsi], 0
    jz END_23
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_23
END_23:
    sub rsi, 7
LOOP_24:
    cmp byte [rsi], 0
    jz END_24
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_24
END_24:
    add rsi, 8
    jmp LOOP_22
END_22:
    sub rsi, 9
LOOP_25:
    cmp byte [rsi], 0
    jz END_25
    sub rsi, 9
    jmp LOOP_25
END_25:
    add rsi, 7
LOOP_26:
    cmp byte [rsi], 0
    jz END_26
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_26
END_26:
    sub rsi, 7
LOOP_27:
    cmp byte [rsi], 0
    jz END_27
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    sub rsi, 5
    jmp LOOP_27
END_27:
    add rsi, 9
    add byte [rsi], 15
LOOP_28:
    cmp byte [rsi], 0
    jz END_28
LOOP_29:
    cmp byte [rsi], 0
    jz END_29
    add rsi, 9
    jmp LOOP_29
END_29:
    add byte [rsi], 1
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
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 9
LOOP_30:
    cmp byte [rsi], 0
    jz END_30
    sub rsi, 9
    jmp LOOP_30
END_30:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_28
END_28:
    add byte [rsi], 1
LOOP_31:
    cmp byte [rsi], 0
    jz END_31
    add rsi, 1
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_31
END_31:
    sub rsi, 9
LOOP_32:
    cmp byte [rsi], 0
    jz END_32
    sub rsi, 9
    jmp LOOP_32
END_32:
    add rsi, 9
LOOP_33:
    cmp byte [rsi], 0
    jz END_33
    add rsi, 1
    sub byte [rsi], 1
    add rsi, 4
LOOP_34:
    cmp byte [rsi], 0
    jz END_34
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_34
END_34:
    sub rsi, 4
LOOP_35:
    cmp byte [rsi], 0
    jz END_35
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 5
LOOP_36:
    cmp byte [rsi], 0
    jz END_36
    sub byte [rsi], 1
    add rsi, 2
LOOP_37:
    cmp byte [rsi], 0
    jz END_37
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_37
END_37:
    sub rsi, 2
LOOP_38:
    cmp byte [rsi], 0
    jz END_38
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 4
    jmp LOOP_38
END_38:
    add byte [rsi], 1
    add rsi, 9
    jmp LOOP_36
END_36:
    sub rsi, 8
LOOP_39:
    cmp byte [rsi], 0
    jz END_39
    sub rsi, 9
    jmp LOOP_39
END_39:
    jmp LOOP_35
END_35:
    add rsi, 9
LOOP_40:
    cmp byte [rsi], 0
    jz END_40
    add rsi, 9
    jmp LOOP_40
END_40:
    sub rsi, 9
LOOP_41:
    cmp byte [rsi], 0
    jz END_41
    add rsi, 1
LOOP_42:
    cmp byte [rsi], 0
    jz END_42
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_42
END_42:
    sub rsi, 10
    jmp LOOP_41
END_41:
    add rsi, 1
LOOP_43:
    cmp byte [rsi], 0
    jz END_43
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_43
END_43:
    call back_inc
    add rsi, 8
    jmp LOOP_33
END_33:
    sub rsi, 9
LOOP_44:
    cmp byte [rsi], 0
    jz END_44
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 4
LOOP_45:
    cmp byte [rsi], 0
    jz END_45
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 1
LOOP_46:
    cmp byte [rsi], 0
    jz END_46
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_46
END_46:
    sub rsi, 1
LOOP_47:
    cmp byte [rsi], 0
    jz END_47
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_47
END_47:
    add rsi, 4
    jmp LOOP_45
END_45:
    sub rsi, 3
LOOP_48:
    cmp byte [rsi], 0
    jz END_48
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_48
END_48:
    call back_inc
    sub rsi, 9
    jmp LOOP_44
END_44:
    add rsi, 9
LOOP_49:
    cmp byte [rsi], 0
    jz END_49
    add rsi, 1
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_49
END_49:
    sub rsi, 9
LOOP_50:
    cmp byte [rsi], 0
    jz END_50
    sub rsi, 9
    jmp LOOP_50
END_50:
    add rsi, 9
LOOP_51:
    cmp byte [rsi], 0
    jz END_51
    add rsi, 1
    sub byte [rsi], 1
    add rsi, 5
LOOP_52:
    cmp byte [rsi], 0
    jz END_52
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_52
END_52:
    sub rsi, 5
LOOP_53:
    cmp byte [rsi], 0
    jz END_53
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 6
LOOP_54:
    cmp byte [rsi], 0
    jz END_54
    sub byte [rsi], 1
    add rsi, 3
LOOP_55:
    cmp byte [rsi], 0
    jz END_55
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_55
END_55:
    sub rsi, 3
LOOP_56:
    cmp byte [rsi], 0
    jz END_56
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 4
    jmp LOOP_56
END_56:
    add byte [rsi], 1
    add rsi, 9
    jmp LOOP_54
END_54:
    sub rsi, 8
LOOP_57:
    cmp byte [rsi], 0
    jz END_57
    sub rsi, 9
    jmp LOOP_57
END_57:
    jmp LOOP_53
END_53:
    add rsi, 9
LOOP_58:
    cmp byte [rsi], 0
    jz END_58
    add rsi, 9
    jmp LOOP_58
END_58:
    sub rsi, 9
LOOP_59:
    cmp byte [rsi], 0
    jz END_59
    add rsi, 2
LOOP_60:
    cmp byte [rsi], 0
    jz END_60
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_60
END_60:
    sub rsi, 11
    jmp LOOP_59
END_59:
    add rsi, 2
LOOP_61:
    cmp byte [rsi], 0
    jz END_61
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_61
END_61:
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_51
END_51:
    sub rsi, 9
LOOP_62:
    cmp byte [rsi], 0
    jz END_62
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 4
LOOP_63:
    cmp byte [rsi], 0
    jz END_63
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 1
LOOP_64:
    cmp byte [rsi], 0
    jz END_64
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_64
END_64:
    sub rsi, 1
LOOP_65:
    cmp byte [rsi], 0
    jz END_65
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_65
END_65:
    add rsi, 4
    jmp LOOP_63
END_63:
    sub rsi, 3
LOOP_66:
    cmp byte [rsi], 0
    jz END_66
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_66
END_66:
    call back_inc
    sub rsi, 9
    jmp LOOP_62
END_62:
    add rsi, 9
LOOP_67:
    cmp byte [rsi], 0
    jz END_67
    add rsi, 4
LOOP_68:
    cmp byte [rsi], 0
    jz END_68
    sub byte [rsi], 1
    sub rsi, 36
    add byte [rsi], 1
    add rsi, 36
    jmp LOOP_68
END_68:
    add rsi, 5
    jmp LOOP_67
END_67:
    sub rsi, 9
LOOP_69:
    cmp byte [rsi], 0
    jz END_69
    sub rsi, 9
    jmp LOOP_69
END_69:
    add rsi, 9
    add byte [rsi], 15
LOOP_70:
    cmp byte [rsi], 0
    jz END_70
LOOP_71:
    cmp byte [rsi], 0
    jz END_71
    add rsi, 9
    jmp LOOP_71
END_71:
    sub rsi, 9
    sub byte [rsi], 1
    sub rsi, 9
LOOP_72:
    cmp byte [rsi], 0
    jz END_72
    sub rsi, 9
    jmp LOOP_72
END_72:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_70
END_70:
    add byte [rsi], 1
    add rsi, 21
    add byte [rsi], 1
    sub rsi, 3
LOOP_73:
    cmp byte [rsi], 0
    jz END_73
    sub rsi, 9
    jmp LOOP_73
END_73:
    add rsi, 9
LOOP_74:
    cmp byte [rsi], 0
    jz END_74
    add rsi, 3
LOOP_75:
    cmp byte [rsi], 0
    jz END_75
    sub byte [rsi], 1
    sub rsi, 3
    sub byte [rsi], 1
    add rsi, 3
    jmp LOOP_75
END_75:
    add byte [rsi], 1
    sub rsi, 3
LOOP_76:
    cmp byte [rsi], 0
    jz END_76
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    add rsi, 1
LOOP_77:
    cmp byte [rsi], 0
    jz END_77
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_77
END_77:
    sub rsi, 4
LOOP_78:
    cmp byte [rsi], 0
    jz END_78
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 13
LOOP_79:
    cmp byte [rsi], 0
    jz END_79
    sub rsi, 9
    jmp LOOP_79
END_79:
    add rsi, 4
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 5
LOOP_80:
    cmp byte [rsi], 0
    jz END_80
    add rsi, 9
    jmp LOOP_80
END_80:
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_78
END_78:
    jmp LOOP_76
END_76:
    add byte [rsi], 1
    add rsi, 4
LOOP_81:
    cmp byte [rsi], 0
    jz END_81
    sub byte [rsi], 1
    sub rsi, 4
    sub byte [rsi], 1
    add rsi, 4
    jmp LOOP_81
END_81:
    add byte [rsi], 1
    sub rsi, 4
LOOP_82:
    cmp byte [rsi], 0
    jz END_82
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 1
LOOP_83:
    cmp byte [rsi], 0
    jz END_83
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_83
END_83:
    sub rsi, 3
LOOP_84:
    cmp byte [rsi], 0
    jz END_84
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 12
LOOP_85:
    cmp byte [rsi], 0
    jz END_85
    sub rsi, 9
    jmp LOOP_85
END_85:
    add rsi, 3
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 6
LOOP_86:
    cmp byte [rsi], 0
    jz END_86
    add rsi, 9
    jmp LOOP_86
END_86:
    add rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_84
END_84:
    jmp LOOP_82
END_82:
    add byte [rsi], 1
    add rsi, 1
LOOP_87:
    cmp byte [rsi], 0
    jz END_87
    sub byte [rsi], 1
    sub rsi, 1
LOOP_88:
    cmp byte [rsi], 0
    jz END_88
    add rsi, 9
    jmp LOOP_88
END_88:
    sub rsi, 8
    jmp LOOP_87
END_87:
    add rsi, 8
    jmp LOOP_74
END_74:
    sub rsi, 9
LOOP_89:
    cmp byte [rsi], 0
    jz END_89
    sub rsi, 9
    jmp LOOP_89
END_89:
    sub rsi, 7
LOOP_90:
    cmp byte [rsi], 0
    jz END_90
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 4
    jmp LOOP_90
END_90:
    add rsi, 9
    add byte [rsi], 26
    add rsi, 2
LOOP_91:
    cmp byte [rsi], 0
    jz END_91
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_91
END_91:
    sub rsi, 4
LOOP_92:
    cmp byte [rsi], 0
    jz END_92
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 2
    mov byte [rsi], 0
    sub rsi, 2
    jmp LOOP_92
END_92:
    add rsi, 2
LOOP_93:
    cmp byte [rsi], 0
    jz END_93
    sub rsi, 7
    add byte [rsi], 1
    sub rsi, 1
LOOP_94:
    cmp byte [rsi], 0
    jz END_94
    sub byte [rsi], 1
    call back_inc
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 2
    mov byte [rsi], 0
    jmp LOOP_94
END_94:
    add rsi, 1
LOOP_95:
    cmp byte [rsi], 0
    jz END_95
    sub byte [rsi], 1
    sub rsi, 2
LOOP_96:
    cmp byte [rsi], 0
    jz END_96
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 4
    jmp LOOP_96
END_96:
    add rsi, 3
    jmp LOOP_95
END_95:
    add rsi, 13
LOOP_97:
    cmp byte [rsi], 0
    jz END_97
    add rsi, 2
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 5
    jmp LOOP_97
END_97:
    sub rsi, 9
LOOP_98:
    cmp byte [rsi], 0
    jz END_98
    sub rsi, 9
    jmp LOOP_98
END_98:
    add rsi, 3
    mov byte [rsi], 0
    add rsi, 6
LOOP_99:
    cmp byte [rsi], 0
    jz END_99
    add rsi, 5
LOOP_100:
    cmp byte [rsi], 0
    jz END_100
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_100
END_100:
    sub rsi, 4
LOOP_101:
    cmp byte [rsi], 0
    jz END_101
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_101
END_101:
    add rsi, 8
    jmp LOOP_99
END_99:
    sub rsi, 9
LOOP_102:
    cmp byte [rsi], 0
    jz END_102
    sub rsi, 9
    jmp LOOP_102
END_102:
    add rsi, 9
LOOP_103:
    cmp byte [rsi], 0
    jz END_103
    add rsi, 2
LOOP_104:
    cmp byte [rsi], 0
    jz END_104
    sub byte [rsi], 1
    sub rsi, 9
    add byte [rsi], 1
    add rsi, 9
    jmp LOOP_104
END_104:
    add rsi, 7
    jmp LOOP_103
END_103:
    sub rsi, 9
LOOP_105:
    cmp byte [rsi], 0
    jz END_105
    sub rsi, 9
    jmp LOOP_105
END_105:
    add rsi, 9
    add byte [rsi], 15
LOOP_106:
    cmp byte [rsi], 0
    jz END_106
LOOP_107:
    cmp byte [rsi], 0
    jz END_107
    add rsi, 9
    jmp LOOP_107
END_107:
    add byte [rsi], 1
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
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 9
LOOP_108:
    cmp byte [rsi], 0
    jz END_108
    sub rsi, 9
    jmp LOOP_108
END_108:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_106
END_106:
    add byte [rsi], 1
LOOP_109:
    cmp byte [rsi], 0
    jz END_109
    add rsi, 1
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_109
END_109:
    sub rsi, 9
LOOP_110:
    cmp byte [rsi], 0
    jz END_110
    sub rsi, 9
    jmp LOOP_110
END_110:
    add rsi, 9
LOOP_111:
    cmp byte [rsi], 0
    jz END_111
    add rsi, 1
    sub byte [rsi], 1
    add rsi, 5
LOOP_112:
    cmp byte [rsi], 0
    jz END_112
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_112
END_112:
    sub rsi, 5
LOOP_113:
    cmp byte [rsi], 0
    jz END_113
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 6
LOOP_114:
    cmp byte [rsi], 0
    jz END_114
    sub byte [rsi], 1
    add rsi, 2
LOOP_115:
    cmp byte [rsi], 0
    jz END_115
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_115
END_115:
    sub rsi, 2
LOOP_116:
    cmp byte [rsi], 0
    jz END_116
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_116
END_116:
    add byte [rsi], 1
    add rsi, 9
    jmp LOOP_114
END_114:
    sub rsi, 8
LOOP_117:
    cmp byte [rsi], 0
    jz END_117
    sub rsi, 9
    jmp LOOP_117
END_117:
    jmp LOOP_113
END_113:
    add rsi, 9
LOOP_118:
    cmp byte [rsi], 0
    jz END_118
    add rsi, 9
    jmp LOOP_118
END_118:
    sub rsi, 9
LOOP_119:
    cmp byte [rsi], 0
    jz END_119
    add rsi, 1
LOOP_120:
    cmp byte [rsi], 0
    jz END_120
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_120
END_120:
    sub rsi, 10
    jmp LOOP_119
END_119:
    add rsi, 1
LOOP_121:
    cmp byte [rsi], 0
    jz END_121
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_121
END_121:
    call back_inc
    add rsi, 8
    jmp LOOP_111
END_111:
    sub rsi, 9
LOOP_122:
    cmp byte [rsi], 0
    jz END_122
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 3
LOOP_123:
    cmp byte [rsi], 0
    jz END_123
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 1
LOOP_124:
    cmp byte [rsi], 0
    jz END_124
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_124
END_124:
    sub rsi, 1
LOOP_125:
    cmp byte [rsi], 0
    jz END_125
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_125
END_125:
    add rsi, 3
    jmp LOOP_123
END_123:
    sub rsi, 2
LOOP_126:
    cmp byte [rsi], 0
    jz END_126
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_126
END_126:
    call back_inc
    sub rsi, 9
    jmp LOOP_122
END_122:
    add rsi, 9
LOOP_127:
    cmp byte [rsi], 0
    jz END_127
    add rsi, 6
LOOP_128:
    cmp byte [rsi], 0
    jz END_128
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_128
END_128:
    sub rsi, 5
LOOP_129:
    cmp byte [rsi], 0
    jz END_129
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_129
END_129:
    add rsi, 8
    jmp LOOP_127
END_127:
    sub rsi, 9
LOOP_130:
    cmp byte [rsi], 0
    jz END_130
    sub rsi, 9
    jmp LOOP_130
END_130:
    add rsi, 9
LOOP_131:
    cmp byte [rsi], 0
    jz END_131
    add rsi, 1
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_131
END_131:
    sub rsi, 9
LOOP_132:
    cmp byte [rsi], 0
    jz END_132
    sub rsi, 9
    jmp LOOP_132
END_132:
    add rsi, 9
LOOP_133:
    cmp byte [rsi], 0
    jz END_133
    add rsi, 1
    sub byte [rsi], 1
    add rsi, 5
LOOP_134:
    cmp byte [rsi], 0
    jz END_134
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_134
END_134:
    sub rsi, 5
LOOP_135:
    cmp byte [rsi], 0
    jz END_135
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 6
LOOP_136:
    cmp byte [rsi], 0
    jz END_136
    sub byte [rsi], 1
    add rsi, 2
LOOP_137:
    cmp byte [rsi], 0
    jz END_137
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_137
END_137:
    sub rsi, 2
LOOP_138:
    cmp byte [rsi], 0
    jz END_138
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 4
    jmp LOOP_138
END_138:
    add byte [rsi], 1
    add rsi, 9
    jmp LOOP_136
END_136:
    sub rsi, 8
LOOP_139:
    cmp byte [rsi], 0
    jz END_139
    sub rsi, 9
    jmp LOOP_139
END_139:
    jmp LOOP_135
END_135:
    add rsi, 9
LOOP_140:
    cmp byte [rsi], 0
    jz END_140
    add rsi, 9
    jmp LOOP_140
END_140:
    sub rsi, 9
LOOP_141:
    cmp byte [rsi], 0
    jz END_141
    add rsi, 1
LOOP_142:
    cmp byte [rsi], 0
    jz END_142
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_142
END_142:
    sub rsi, 10
    jmp LOOP_141
END_141:
    add rsi, 1
LOOP_143:
    cmp byte [rsi], 0
    jz END_143
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_143
END_143:
    call back_inc
    add rsi, 8
    jmp LOOP_133
END_133:
    sub rsi, 9
LOOP_144:
    cmp byte [rsi], 0
    jz END_144
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 4
LOOP_145:
    cmp byte [rsi], 0
    jz END_145
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 1
LOOP_146:
    cmp byte [rsi], 0
    jz END_146
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_146
END_146:
    sub rsi, 1
LOOP_147:
    cmp byte [rsi], 0
    jz END_147
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_147
END_147:
    add rsi, 4
    jmp LOOP_145
END_145:
    sub rsi, 3
LOOP_148:
    cmp byte [rsi], 0
    jz END_148
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_148
END_148:
    call back_inc
    sub rsi, 9
    jmp LOOP_144
END_144:
    add rsi, 9
LOOP_149:
    cmp byte [rsi], 0
    jz END_149
    add rsi, 4
LOOP_150:
    cmp byte [rsi], 0
    jz END_150
    sub byte [rsi], 1
    sub rsi, 36
    add byte [rsi], 1
    add rsi, 36
    jmp LOOP_150
END_150:
    add rsi, 5
    jmp LOOP_149
END_149:
    sub rsi, 9
LOOP_151:
    cmp byte [rsi], 0
    jz END_151
    sub rsi, 9
    jmp LOOP_151
END_151:
    add rsi, 9
LOOP_152:
    cmp byte [rsi], 0
    jz END_152
    add rsi, 3
LOOP_153:
    cmp byte [rsi], 0
    jz END_153
    sub byte [rsi], 1
    sub rsi, 36
    add byte [rsi], 1
    add rsi, 36
    jmp LOOP_153
END_153:
    add rsi, 6
    jmp LOOP_152
END_152:
    sub rsi, 9
LOOP_154:
    cmp byte [rsi], 0
    jz END_154
    sub rsi, 9
    jmp LOOP_154
END_154:
    add rsi, 9
    add byte [rsi], 15
LOOP_155:
    cmp byte [rsi], 0
    jz END_155
LOOP_156:
    cmp byte [rsi], 0
    jz END_156
    add rsi, 9
    jmp LOOP_156
END_156:
    sub rsi, 9
    sub byte [rsi], 1
    sub rsi, 9
LOOP_157:
    cmp byte [rsi], 0
    jz END_157
    sub rsi, 9
    jmp LOOP_157
END_157:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_155
END_155:
    add byte [rsi], 1
LOOP_158:
    cmp byte [rsi], 0
    jz END_158
    add rsi, 8
LOOP_159:
    cmp byte [rsi], 0
    jz END_159
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_159
END_159:
    sub rsi, 7
LOOP_160:
    cmp byte [rsi], 0
    jz END_160
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_160
END_160:
    add rsi, 8
    jmp LOOP_158
END_158:
    sub rsi, 9
LOOP_161:
    cmp byte [rsi], 0
    jz END_161
    sub rsi, 9
    jmp LOOP_161
END_161:
    add rsi, 9
LOOP_162:
    cmp byte [rsi], 0
    jz END_162
    add rsi, 6
    mov byte [rsi], 0
    add rsi, 3
    jmp LOOP_162
END_162:
    sub rsi, 9
LOOP_163:
    cmp byte [rsi], 0
    jz END_163
    sub rsi, 9
    jmp LOOP_163
END_163:
    add rsi, 4
    add byte [rsi], 1
    add rsi, 1
LOOP_164:
    cmp byte [rsi], 0
    jz END_164
    sub byte [rsi], 1
    sub rsi, 1
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_164
END_164:
    add rsi, 1
LOOP_165:
    cmp byte [rsi], 0
    jz END_165
    sub byte [rsi], 1
    sub rsi, 6
LOOP_166:
    cmp byte [rsi], 0
    jz END_166
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 1
    add byte [rsi], 2
    sub rsi, 4
    jmp LOOP_166
END_166:
    add rsi, 5
LOOP_167:
    cmp byte [rsi], 0
    jz END_167
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_167
END_167:
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    add rsi, 1
    jmp LOOP_165
END_165:
    sub rsi, 1
LOOP_168:
    cmp byte [rsi], 0
    jz END_168
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_168
END_168:
    sub rsi, 5
LOOP_169:
    cmp byte [rsi], 0
    jz END_169
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 5
    jmp LOOP_169
END_169:
    add rsi, 6
    mov byte [rsi], 0
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 4
LOOP_170:
    cmp byte [rsi], 0
    jz END_170
    sub byte [rsi], 1
    sub rsi, 4
    sub byte [rsi], 1
    add rsi, 4
    jmp LOOP_170
END_170:
    add byte [rsi], 1
    sub rsi, 4
LOOP_171:
    cmp byte [rsi], 0
    jz END_171
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    add rsi, 5
LOOP_172:
    cmp byte [rsi], 0
    jz END_172
    add rsi, 2
LOOP_173:
    cmp byte [rsi], 0
    jz END_173
    sub byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    add rsi, 2
    jmp LOOP_173
END_173:
    add byte [rsi], 1
    sub rsi, 2
LOOP_174:
    cmp byte [rsi], 0
    jz END_174
    sub byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    add rsi, 1
LOOP_175:
    cmp byte [rsi], 0
    jz END_175
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_175
END_175:
    sub rsi, 3
LOOP_176:
    cmp byte [rsi], 0
    jz END_176
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 12
LOOP_177:
    cmp byte [rsi], 0
    jz END_177
    sub rsi, 9
    jmp LOOP_177
END_177:
    add rsi, 3
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 6
LOOP_178:
    cmp byte [rsi], 0
    jz END_178
    add rsi, 9
    jmp LOOP_178
END_178:
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_176
END_176:
    jmp LOOP_174
END_174:
    add byte [rsi], 1
    add rsi, 3
LOOP_179:
    cmp byte [rsi], 0
    jz END_179
    sub byte [rsi], 1
    sub rsi, 3
    sub byte [rsi], 1
    add rsi, 3
    jmp LOOP_179
END_179:
    add byte [rsi], 1
    sub rsi, 3
LOOP_180:
    cmp byte [rsi], 0
    jz END_180
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 1
LOOP_181:
    cmp byte [rsi], 0
    jz END_181
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_181
END_181:
    sub rsi, 2
LOOP_182:
    cmp byte [rsi], 0
    jz END_182
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 11
LOOP_183:
    cmp byte [rsi], 0
    jz END_183
    sub rsi, 9
    jmp LOOP_183
END_183:
    add rsi, 4
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 5
LOOP_184:
    cmp byte [rsi], 0
    jz END_184
    add rsi, 9
    jmp LOOP_184
END_184:
    add rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_182
END_182:
    jmp LOOP_180
END_180:
    add byte [rsi], 1
    add rsi, 1
LOOP_185:
    cmp byte [rsi], 0
    jz END_185
    sub byte [rsi], 1
    sub rsi, 1
LOOP_186:
    cmp byte [rsi], 0
    jz END_186
    add rsi, 9
    jmp LOOP_186
END_186:
    sub rsi, 8
    jmp LOOP_185
END_185:
    add rsi, 8
    jmp LOOP_172
END_172:
    sub rsi, 9
LOOP_187:
    cmp byte [rsi], 0
    jz END_187
    sub rsi, 9
    jmp LOOP_187
END_187:
    add rsi, 4
LOOP_188:
    cmp byte [rsi], 0
    jz END_188
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_188
END_188:
    sub rsi, 4
LOOP_189:
    cmp byte [rsi], 0
    jz END_189
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    add rsi, 5
LOOP_190:
    cmp byte [rsi], 0
    jz END_190
    add rsi, 1
    add byte [rsi], 1
    add rsi, 2
LOOP_191:
    cmp byte [rsi], 0
    jz END_191
    sub byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    add rsi, 2
    jmp LOOP_191
END_191:
    sub rsi, 2
LOOP_192:
    cmp byte [rsi], 0
    jz END_192
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_192
END_192:
    add rsi, 8
    jmp LOOP_190
END_190:
    sub rsi, 8
    add byte [rsi], 1
    sub rsi, 1
LOOP_193:
    cmp byte [rsi], 0
    jz END_193
    add rsi, 1
LOOP_194:
    cmp byte [rsi], 0
    jz END_194
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 4
LOOP_195:
    cmp byte [rsi], 0
    jz END_195
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 11
LOOP_196:
    cmp byte [rsi], 0
    jz END_196
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_196
END_196:
    sub rsi, 1
    jmp LOOP_195
END_195:
    add rsi, 1
LOOP_197:
    cmp byte [rsi], 0
    jz END_197
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_197
END_197:
    sub rsi, 2
    jmp LOOP_194
END_194:
    add rsi, 1
LOOP_198:
    cmp byte [rsi], 0
    jz END_198
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 3
LOOP_199:
    cmp byte [rsi], 0
    jz END_199
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_199
END_199:
    sub rsi, 1
    jmp LOOP_198
END_198:
    add rsi, 1
LOOP_200:
    cmp byte [rsi], 0
    jz END_200
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_200
END_200:
    sub rsi, 12
    jmp LOOP_193
END_193:
    add rsi, 4
    mov byte [rsi], 0
    sub rsi, 4
    jmp LOOP_189
END_189:
    add rsi, 3
LOOP_201:
    cmp byte [rsi], 0
    jz END_201
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_201
END_201:
    sub rsi, 3
LOOP_202:
    cmp byte [rsi], 0
    jz END_202
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    add rsi, 6
LOOP_203:
    cmp byte [rsi], 0
    jz END_203
    add rsi, 1
    add byte [rsi], 1
    add rsi, 1
LOOP_204:
    cmp byte [rsi], 0
    jz END_204
    sub byte [rsi], 1
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    jmp LOOP_204
END_204:
    sub rsi, 1
LOOP_205:
    cmp byte [rsi], 0
    jz END_205
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_205
END_205:
    add rsi, 8
    jmp LOOP_203
END_203:
    sub rsi, 8
    add byte [rsi], 1
    sub rsi, 1
LOOP_206:
    cmp byte [rsi], 0
    jz END_206
    add rsi, 1
LOOP_207:
    cmp byte [rsi], 0
    jz END_207
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 3
LOOP_208:
    cmp byte [rsi], 0
    jz END_208
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 10
LOOP_209:
    cmp byte [rsi], 0
    jz END_209
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 4
    jmp LOOP_209
END_209:
    add rsi, 1
    jmp LOOP_208
END_208:
    sub rsi, 1
LOOP_210:
    cmp byte [rsi], 0
    jz END_210
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 10
    jmp LOOP_210
END_210:
    sub rsi, 1
    jmp LOOP_207
END_207:
    add rsi, 2
LOOP_211:
    cmp byte [rsi], 0
    jz END_211
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 4
LOOP_212:
    cmp byte [rsi], 0
    jz END_212
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 10
    jmp LOOP_212
END_212:
    add rsi, 1
    jmp LOOP_211
END_211:
    sub rsi, 1
LOOP_213:
    cmp byte [rsi], 0
    jz END_213
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 4
    jmp LOOP_213
END_213:
    sub rsi, 11
    jmp LOOP_206
END_206:
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 6
    jmp LOOP_202
END_202:
    jmp LOOP_171
END_171:
    add rsi, 4
LOOP_214:
    cmp byte [rsi], 0
    jz END_214
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_214
END_214:
    sub rsi, 4
LOOP_215:
    cmp byte [rsi], 0
    jz END_215
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    add rsi, 5
LOOP_216:
    cmp byte [rsi], 0
    jz END_216
    add rsi, 9
    jmp LOOP_216
END_216:
    sub rsi, 9
LOOP_217:
    cmp byte [rsi], 0
    jz END_217
    add rsi, 1
LOOP_218:
    cmp byte [rsi], 0
    jz END_218
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 4
LOOP_219:
    cmp byte [rsi], 0
    jz END_219
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 11
LOOP_220:
    cmp byte [rsi], 0
    jz END_220
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_220
END_220:
    sub rsi, 1
    jmp LOOP_219
END_219:
    add rsi, 1
LOOP_221:
    cmp byte [rsi], 0
    jz END_221
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_221
END_221:
    sub rsi, 2
    jmp LOOP_218
END_218:
    add rsi, 1
LOOP_222:
    cmp byte [rsi], 0
    jz END_222
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 3
LOOP_223:
    cmp byte [rsi], 0
    jz END_223
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 14
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_223
END_223:
    sub rsi, 1
    jmp LOOP_222
END_222:
    add rsi, 1
LOOP_224:
    cmp byte [rsi], 0
    jz END_224
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_224
END_224:
    sub rsi, 12
    jmp LOOP_217
END_217:
    jmp LOOP_215
END_215:
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 2
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 5
LOOP_225:
    cmp byte [rsi], 0
    jz END_225
    add rsi, 2
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 6
    jmp LOOP_225
END_225:
    sub rsi, 9
LOOP_226:
    cmp byte [rsi], 0
    jz END_226
    sub rsi, 9
    jmp LOOP_226
END_226:
    add rsi, 9
LOOP_227:
    cmp byte [rsi], 0
    jz END_227
    add rsi, 5
LOOP_228:
    cmp byte [rsi], 0
    jz END_228
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_228
END_228:
    sub rsi, 4
LOOP_229:
    cmp byte [rsi], 0
    jz END_229
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_229
END_229:
    add rsi, 8
    jmp LOOP_227
END_227:
    sub rsi, 9
LOOP_230:
    cmp byte [rsi], 0
    jz END_230
    sub rsi, 9
    jmp LOOP_230
END_230:
    add rsi, 9
    add byte [rsi], 15
LOOP_231:
    cmp byte [rsi], 0
    jz END_231
LOOP_232:
    cmp byte [rsi], 0
    jz END_232
    add rsi, 9
    jmp LOOP_232
END_232:
    add byte [rsi], 1
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
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 9
LOOP_233:
    cmp byte [rsi], 0
    jz END_233
    sub rsi, 9
    jmp LOOP_233
END_233:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_231
END_231:
    add byte [rsi], 1
LOOP_234:
    cmp byte [rsi], 0
    jz END_234
    add rsi, 1
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_234
END_234:
    sub rsi, 9
LOOP_235:
    cmp byte [rsi], 0
    jz END_235
    sub rsi, 9
    jmp LOOP_235
END_235:
    add rsi, 9
LOOP_236:
    cmp byte [rsi], 0
    jz END_236
    add rsi, 1
    sub byte [rsi], 1
    add rsi, 4
LOOP_237:
    cmp byte [rsi], 0
    jz END_237
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_237
END_237:
    sub rsi, 4
LOOP_238:
    cmp byte [rsi], 0
    jz END_238
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 5
LOOP_239:
    cmp byte [rsi], 0
    jz END_239
    sub byte [rsi], 1
    add rsi, 2
LOOP_240:
    cmp byte [rsi], 0
    jz END_240
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_240
END_240:
    sub rsi, 2
LOOP_241:
    cmp byte [rsi], 0
    jz END_241
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_241
END_241:
    add byte [rsi], 1
    add rsi, 9
    jmp LOOP_239
END_239:
    sub rsi, 8
LOOP_242:
    cmp byte [rsi], 0
    jz END_242
    sub rsi, 9
    jmp LOOP_242
END_242:
    jmp LOOP_238
END_238:
    add rsi, 9
LOOP_243:
    cmp byte [rsi], 0
    jz END_243
    add rsi, 9
    jmp LOOP_243
END_243:
    sub rsi, 9
LOOP_244:
    cmp byte [rsi], 0
    jz END_244
    add rsi, 1
LOOP_245:
    cmp byte [rsi], 0
    jz END_245
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_245
END_245:
    sub rsi, 10
    jmp LOOP_244
END_244:
    add rsi, 1
LOOP_246:
    cmp byte [rsi], 0
    jz END_246
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_246
END_246:
    call back_inc
    add rsi, 8
    jmp LOOP_236
END_236:
    sub rsi, 9
LOOP_247:
    cmp byte [rsi], 0
    jz END_247
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 3
LOOP_248:
    cmp byte [rsi], 0
    jz END_248
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 1
LOOP_249:
    cmp byte [rsi], 0
    jz END_249
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_249
END_249:
    sub rsi, 1
LOOP_250:
    cmp byte [rsi], 0
    jz END_250
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_250
END_250:
    add rsi, 3
    jmp LOOP_248
END_248:
    sub rsi, 2
LOOP_251:
    cmp byte [rsi], 0
    jz END_251
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_251
END_251:
    call back_inc
    sub rsi, 9
    jmp LOOP_247
END_247:
    add rsi, 9
LOOP_252:
    cmp byte [rsi], 0
    jz END_252
    add rsi, 3
LOOP_253:
    cmp byte [rsi], 0
    jz END_253
    sub byte [rsi], 1
    sub rsi, 36
    add byte [rsi], 1
    add rsi, 36
    jmp LOOP_253
END_253:
    add rsi, 6
    jmp LOOP_252
END_252:
    sub rsi, 9
LOOP_254:
    cmp byte [rsi], 0
    jz END_254
    sub rsi, 9
    jmp LOOP_254
END_254:
    add rsi, 5
    mov byte [rsi], 0
    add rsi, 4
    add byte [rsi], 15
LOOP_255:
    cmp byte [rsi], 0
    jz END_255
LOOP_256:
    cmp byte [rsi], 0
    jz END_256
    add rsi, 9
    jmp LOOP_256
END_256:
    sub rsi, 9
    sub byte [rsi], 1
    sub rsi, 9
LOOP_257:
    cmp byte [rsi], 0
    jz END_257
    sub rsi, 9
    jmp LOOP_257
END_257:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_255
END_255:
    add byte [rsi], 1
LOOP_258:
    cmp byte [rsi], 0
    jz END_258
    add rsi, 3
LOOP_259:
    cmp byte [rsi], 0
    jz END_259
    sub byte [rsi], 1
    sub rsi, 3
    sub byte [rsi], 1
    add rsi, 3
    jmp LOOP_259
END_259:
    add byte [rsi], 1
    sub rsi, 3
LOOP_260:
    cmp byte [rsi], 0
    jz END_260
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    add rsi, 1
LOOP_261:
    cmp byte [rsi], 0
    jz END_261
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_261
END_261:
    sub rsi, 4
LOOP_262:
    cmp byte [rsi], 0
    jz END_262
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 13
LOOP_263:
    cmp byte [rsi], 0
    jz END_263
    sub rsi, 9
    jmp LOOP_263
END_263:
    add rsi, 4
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 5
LOOP_264:
    cmp byte [rsi], 0
    jz END_264
    add rsi, 9
    jmp LOOP_264
END_264:
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_262
END_262:
    jmp LOOP_260
END_260:
    add byte [rsi], 1
    add rsi, 4
LOOP_265:
    cmp byte [rsi], 0
    jz END_265
    sub byte [rsi], 1
    sub rsi, 4
    sub byte [rsi], 1
    add rsi, 4
    jmp LOOP_265
END_265:
    add byte [rsi], 1
    sub rsi, 4
LOOP_266:
    cmp byte [rsi], 0
    jz END_266
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 1
LOOP_267:
    cmp byte [rsi], 0
    jz END_267
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_267
END_267:
    sub rsi, 3
LOOP_268:
    cmp byte [rsi], 0
    jz END_268
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 12
LOOP_269:
    cmp byte [rsi], 0
    jz END_269
    sub rsi, 9
    jmp LOOP_269
END_269:
    add rsi, 3
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 6
LOOP_270:
    cmp byte [rsi], 0
    jz END_270
    add rsi, 9
    jmp LOOP_270
END_270:
    add rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_268
END_268:
    jmp LOOP_266
END_266:
    add byte [rsi], 1
    add rsi, 1
LOOP_271:
    cmp byte [rsi], 0
    jz END_271
    sub byte [rsi], 1
    sub rsi, 1
LOOP_272:
    cmp byte [rsi], 0
    jz END_272
    add rsi, 9
    jmp LOOP_272
END_272:
    sub rsi, 8
    jmp LOOP_271
END_271:
    add rsi, 8
    jmp LOOP_258
END_258:
    sub rsi, 9
LOOP_273:
    cmp byte [rsi], 0
    jz END_273
    sub rsi, 9
    jmp LOOP_273
END_273:
    add rsi, 3
LOOP_274:
    cmp byte [rsi], 0
    jz END_274
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_274
END_274:
    sub rsi, 3
LOOP_275:
    cmp byte [rsi], 0
    jz END_275
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    add rsi, 6
LOOP_276:
    cmp byte [rsi], 0
    jz END_276
    add rsi, 1
    add byte [rsi], 1
    add rsi, 3
LOOP_277:
    cmp byte [rsi], 0
    jz END_277
    sub byte [rsi], 1
    sub rsi, 3
    sub byte [rsi], 1
    add rsi, 3
    jmp LOOP_277
END_277:
    sub rsi, 3
LOOP_278:
    cmp byte [rsi], 0
    jz END_278
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_278
END_278:
    add rsi, 8
    jmp LOOP_276
END_276:
    sub rsi, 8
    add byte [rsi], 1
    sub rsi, 1
LOOP_279:
    cmp byte [rsi], 0
    jz END_279
    add rsi, 1
LOOP_280:
    cmp byte [rsi], 0
    jz END_280
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    add rsi, 1
LOOP_281:
    cmp byte [rsi], 0
    jz END_281
    sub byte [rsi], 1
    sub rsi, 1
    sub byte [rsi], 1
    sub rsi, 10
    add byte [rsi], 1
    add rsi, 12
LOOP_282:
    cmp byte [rsi], 0
    jz END_282
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_282
END_282:
    sub rsi, 1
    jmp LOOP_281
END_281:
    add rsi, 1
LOOP_283:
    cmp byte [rsi], 0
    jz END_283
    sub byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    sub rsi, 10
    add byte [rsi], 1
    add rsi, 12
    jmp LOOP_283
END_283:
    sub rsi, 3
    jmp LOOP_280
END_280:
    add rsi, 2
LOOP_284:
    cmp byte [rsi], 0
    jz END_284
    sub byte [rsi], 1
    call back_inc
    add rsi, 2
LOOP_285:
    cmp byte [rsi], 0
    jz END_285
    sub byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    sub rsi, 10
    add byte [rsi], 1
    add rsi, 12
    jmp LOOP_285
END_285:
    sub rsi, 1
    jmp LOOP_284
END_284:
    add rsi, 1
LOOP_286:
    cmp byte [rsi], 0
    jz END_286
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_286
END_286:
    sub rsi, 13
    jmp LOOP_279
END_279:
    jmp LOOP_275
END_275:
    add rsi, 4
LOOP_287:
    cmp byte [rsi], 0
    jz END_287
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_287
END_287:
    sub rsi, 4
LOOP_288:
    cmp byte [rsi], 0
    jz END_288
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    add rsi, 5
LOOP_289:
    cmp byte [rsi], 0
    jz END_289
    add rsi, 1
    add byte [rsi], 1
    add rsi, 2
LOOP_290:
    cmp byte [rsi], 0
    jz END_290
    sub byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    add rsi, 2
    jmp LOOP_290
END_290:
    sub rsi, 2
LOOP_291:
    cmp byte [rsi], 0
    jz END_291
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_291
END_291:
    add rsi, 8
    jmp LOOP_289
END_289:
    sub rsi, 8
    add byte [rsi], 1
    sub rsi, 1
LOOP_292:
    cmp byte [rsi], 0
    jz END_292
    add rsi, 1
LOOP_293:
    cmp byte [rsi], 0
    jz END_293
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    add rsi, 2
LOOP_294:
    cmp byte [rsi], 0
    jz END_294
    sub byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    sub rsi, 10
    add byte [rsi], 1
    add rsi, 11
LOOP_295:
    cmp byte [rsi], 0
    jz END_295
    sub byte [rsi], 1
    call back_inc
    add rsi, 1
    jmp LOOP_295
END_295:
    add rsi, 1
    jmp LOOP_294
END_294:
    sub rsi, 1
LOOP_296:
    cmp byte [rsi], 0
    jz END_296
    sub byte [rsi], 1
    sub rsi, 1
    sub byte [rsi], 1
    sub rsi, 10
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_296
END_296:
    sub rsi, 2
    jmp LOOP_293
END_293:
    add rsi, 3
LOOP_297:
    cmp byte [rsi], 0
    jz END_297
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 1
LOOP_298:
    cmp byte [rsi], 0
    jz END_298
    sub byte [rsi], 1
    sub rsi, 1
    sub byte [rsi], 1
    sub rsi, 10
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_298
END_298:
    add rsi, 1
    jmp LOOP_297
END_297:
    sub rsi, 1
LOOP_299:
    cmp byte [rsi], 0
    jz END_299
    sub byte [rsi], 1
    call back_inc
    add rsi, 1
    jmp LOOP_299
END_299:
    sub rsi, 12
    jmp LOOP_292
END_292:
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 5
    jmp LOOP_288
END_288:
    add rsi, 9
LOOP_300:
    cmp byte [rsi], 0
    jz END_300
    add rsi, 3
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 4
    jmp LOOP_300
END_300:
    sub rsi, 9
LOOP_301:
    cmp byte [rsi], 0
    jz END_301
    sub rsi, 9
    jmp LOOP_301
END_301:
    add rsi, 3
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 5
LOOP_302:
    cmp byte [rsi], 0
    jz END_302
    add rsi, 7
LOOP_303:
    cmp byte [rsi], 0
    jz END_303
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_303
END_303:
    sub rsi, 6
LOOP_304:
    cmp byte [rsi], 0
    jz END_304
    sub byte [rsi], 1
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_304
END_304:
    add rsi, 8
    jmp LOOP_302
END_302:
    sub rsi, 9
LOOP_305:
    cmp byte [rsi], 0
    jz END_305
    sub rsi, 9
    jmp LOOP_305
END_305:
    add rsi, 4
    add byte [rsi], 1
    add rsi, 1
LOOP_306:
    cmp byte [rsi], 0
    jz END_306
    sub byte [rsi], 1
    sub rsi, 1
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_306
END_306:
    add rsi, 2
LOOP_307:
    cmp byte [rsi], 0
    jz END_307
    sub byte [rsi], 1
    sub rsi, 7
LOOP_308:
    cmp byte [rsi], 0
    jz END_308
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 1
    add byte [rsi], 2
    sub rsi, 4
    jmp LOOP_308
END_308:
    add rsi, 5
LOOP_309:
    cmp byte [rsi], 0
    jz END_309
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_309
END_309:
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_307
END_307:
    sub rsi, 2
LOOP_310:
    cmp byte [rsi], 0
    jz END_310
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_310
END_310:
    sub rsi, 5
LOOP_311:
    cmp byte [rsi], 0
    jz END_311
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 5
    jmp LOOP_311
END_311:
    add byte [rsi], 1
    add rsi, 4
LOOP_312:
    cmp byte [rsi], 0
    jz END_312
    sub byte [rsi], 1
    sub rsi, 4
    sub byte [rsi], 1
    add rsi, 4
    jmp LOOP_312
END_312:
    add byte [rsi], 1
    sub rsi, 4
LOOP_313:
    cmp byte [rsi], 0
    jz END_313
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    add rsi, 5
LOOP_314:
    cmp byte [rsi], 0
    jz END_314
    add rsi, 3
LOOP_315:
    cmp byte [rsi], 0
    jz END_315
    sub byte [rsi], 1
    sub rsi, 3
    sub byte [rsi], 1
    add rsi, 3
    jmp LOOP_315
END_315:
    add byte [rsi], 1
    sub rsi, 3
LOOP_316:
    cmp byte [rsi], 0
    jz END_316
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 1
LOOP_317:
    cmp byte [rsi], 0
    jz END_317
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_317
END_317:
    sub rsi, 2
LOOP_318:
    cmp byte [rsi], 0
    jz END_318
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 11
LOOP_319:
    cmp byte [rsi], 0
    jz END_319
    sub rsi, 9
    jmp LOOP_319
END_319:
    add rsi, 4
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 5
LOOP_320:
    cmp byte [rsi], 0
    jz END_320
    add rsi, 9
    jmp LOOP_320
END_320:
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_318
END_318:
    jmp LOOP_316
END_316:
    add byte [rsi], 1
    add rsi, 2
LOOP_321:
    cmp byte [rsi], 0
    jz END_321
    sub byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    add rsi, 2
    jmp LOOP_321
END_321:
    add byte [rsi], 1
    sub rsi, 2
LOOP_322:
    cmp byte [rsi], 0
    jz END_322
    sub byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    add rsi, 1
LOOP_323:
    cmp byte [rsi], 0
    jz END_323
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_323
END_323:
    sub rsi, 3
LOOP_324:
    cmp byte [rsi], 0
    jz END_324
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 12
LOOP_325:
    cmp byte [rsi], 0
    jz END_325
    sub rsi, 9
    jmp LOOP_325
END_325:
    add rsi, 3
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 6
LOOP_326:
    cmp byte [rsi], 0
    jz END_326
    add rsi, 9
    jmp LOOP_326
END_326:
    add rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_324
END_324:
    jmp LOOP_322
END_322:
    add byte [rsi], 1
    add rsi, 1
LOOP_327:
    cmp byte [rsi], 0
    jz END_327
    sub byte [rsi], 1
    sub rsi, 1
LOOP_328:
    cmp byte [rsi], 0
    jz END_328
    add rsi, 9
    jmp LOOP_328
END_328:
    sub rsi, 8
    jmp LOOP_327
END_327:
    add rsi, 8
    jmp LOOP_314
END_314:
    sub rsi, 9
LOOP_329:
    cmp byte [rsi], 0
    jz END_329
    sub rsi, 9
    jmp LOOP_329
END_329:
    add rsi, 3
LOOP_330:
    cmp byte [rsi], 0
    jz END_330
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_330
END_330:
    sub rsi, 3
LOOP_331:
    cmp byte [rsi], 0
    jz END_331
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    add rsi, 6
LOOP_332:
    cmp byte [rsi], 0
    jz END_332
    add rsi, 1
    add byte [rsi], 1
    add rsi, 1
LOOP_333:
    cmp byte [rsi], 0
    jz END_333
    sub byte [rsi], 1
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    jmp LOOP_333
END_333:
    sub rsi, 1
LOOP_334:
    cmp byte [rsi], 0
    jz END_334
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_334
END_334:
    add rsi, 8
    jmp LOOP_332
END_332:
    sub rsi, 8
    add byte [rsi], 1
    sub rsi, 1
LOOP_335:
    cmp byte [rsi], 0
    jz END_335
    add rsi, 1
LOOP_336:
    cmp byte [rsi], 0
    jz END_336
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 2
LOOP_337:
    cmp byte [rsi], 0
    jz END_337
    sub byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 10
LOOP_338:
    cmp byte [rsi], 0
    jz END_338
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_338
END_338:
    add rsi, 1
    jmp LOOP_337
END_337:
    sub rsi, 1
LOOP_339:
    cmp byte [rsi], 0
    jz END_339
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 10
    jmp LOOP_339
END_339:
    sub rsi, 1
    jmp LOOP_336
END_336:
    add rsi, 2
LOOP_340:
    cmp byte [rsi], 0
    jz END_340
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 3
LOOP_341:
    cmp byte [rsi], 0
    jz END_341
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 10
    jmp LOOP_341
END_341:
    add rsi, 1
    jmp LOOP_340
END_340:
    sub rsi, 1
LOOP_342:
    cmp byte [rsi], 0
    jz END_342
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_342
END_342:
    sub rsi, 11
    jmp LOOP_335
END_335:
    add rsi, 5
    mov byte [rsi], 0
    add rsi, 2
LOOP_343:
    cmp byte [rsi], 0
    jz END_343
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_343
END_343:
    sub rsi, 7
LOOP_344:
    cmp byte [rsi], 0
    jz END_344
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    sub rsi, 5
    jmp LOOP_344
END_344:
    jmp LOOP_331
END_331:
    add rsi, 4
LOOP_345:
    cmp byte [rsi], 0
    jz END_345
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_345
END_345:
    sub rsi, 4
LOOP_346:
    cmp byte [rsi], 0
    jz END_346
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    add rsi, 5
LOOP_347:
    cmp byte [rsi], 0
    jz END_347
    add rsi, 1
    add byte [rsi], 1
    add rsi, 2
LOOP_348:
    cmp byte [rsi], 0
    jz END_348
    sub byte [rsi], 1
    sub rsi, 2
    sub byte [rsi], 1
    add rsi, 2
    jmp LOOP_348
END_348:
    sub rsi, 2
LOOP_349:
    cmp byte [rsi], 0
    jz END_349
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_349
END_349:
    add rsi, 8
    jmp LOOP_347
END_347:
    sub rsi, 8
    add byte [rsi], 1
    sub rsi, 1
LOOP_350:
    cmp byte [rsi], 0
    jz END_350
    add rsi, 1
LOOP_351:
    cmp byte [rsi], 0
    jz END_351
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 3
LOOP_352:
    cmp byte [rsi], 0
    jz END_352
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 11
LOOP_353:
    cmp byte [rsi], 0
    jz END_353
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_353
END_353:
    sub rsi, 1
    jmp LOOP_352
END_352:
    add rsi, 1
LOOP_354:
    cmp byte [rsi], 0
    jz END_354
    sub byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_354
END_354:
    sub rsi, 2
    jmp LOOP_351
END_351:
    add rsi, 1
LOOP_355:
    cmp byte [rsi], 0
    jz END_355
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 2
LOOP_356:
    cmp byte [rsi], 0
    jz END_356
    sub byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_356
END_356:
    sub rsi, 1
    jmp LOOP_355
END_355:
    add rsi, 1
LOOP_357:
    cmp byte [rsi], 0
    jz END_357
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_357
END_357:
    sub rsi, 12
    jmp LOOP_350
END_350:
    jmp LOOP_346
END_346:
    add rsi, 4
    mov byte [rsi], 0
    sub rsi, 4
    jmp LOOP_313
END_313:
    add rsi, 4
LOOP_358:
    cmp byte [rsi], 0
    jz END_358
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_358
END_358:
    sub rsi, 4
LOOP_359:
    cmp byte [rsi], 0
    jz END_359
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 2
LOOP_360:
    cmp byte [rsi], 0
    jz END_360
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_360
END_360:
    sub rsi, 7
LOOP_361:
    cmp byte [rsi], 0
    jz END_361
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    sub rsi, 5
    jmp LOOP_361
END_361:
    add rsi, 9
LOOP_362:
    cmp byte [rsi], 0
    jz END_362
    add rsi, 9
    jmp LOOP_362
END_362:
    sub rsi, 9
LOOP_363:
    cmp byte [rsi], 0
    jz END_363
    add rsi, 1
LOOP_364:
    cmp byte [rsi], 0
    jz END_364
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 3
LOOP_365:
    cmp byte [rsi], 0
    jz END_365
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 11
LOOP_366:
    cmp byte [rsi], 0
    jz END_366
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_366
END_366:
    sub rsi, 1
    jmp LOOP_365
END_365:
    add rsi, 1
LOOP_367:
    cmp byte [rsi], 0
    jz END_367
    sub byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_367
END_367:
    sub rsi, 2
    jmp LOOP_364
END_364:
    add rsi, 1
LOOP_368:
    cmp byte [rsi], 0
    jz END_368
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 2
LOOP_369:
    cmp byte [rsi], 0
    jz END_369
    sub byte [rsi], 1
    add rsi, 2
    sub byte [rsi], 1
    sub rsi, 13
    add byte [rsi], 1
    add rsi, 11
    jmp LOOP_369
END_369:
    sub rsi, 1
    jmp LOOP_368
END_368:
    add rsi, 1
LOOP_370:
    cmp byte [rsi], 0
    jz END_370
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_370
END_370:
    sub rsi, 12
    jmp LOOP_363
END_363:
    jmp LOOP_359
END_359:
    add rsi, 9
LOOP_371:
    cmp byte [rsi], 0
    jz END_371
    add rsi, 2
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 6
    jmp LOOP_371
END_371:
    sub rsi, 9
LOOP_372:
    cmp byte [rsi], 0
    jz END_372
    sub rsi, 9
    jmp LOOP_372
END_372:
    add rsi, 3
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 5
LOOP_373:
    cmp byte [rsi], 0
    jz END_373
    add rsi, 5
LOOP_374:
    cmp byte [rsi], 0
    jz END_374
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_374
END_374:
    sub rsi, 4
LOOP_375:
    cmp byte [rsi], 0
    jz END_375
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_375
END_375:
    add rsi, 8
    jmp LOOP_373
END_373:
    sub rsi, 9
LOOP_376:
    cmp byte [rsi], 0
    jz END_376
    sub rsi, 9
    jmp LOOP_376
END_376:
    add rsi, 9
LOOP_377:
    cmp byte [rsi], 0
    jz END_377
    add rsi, 6
LOOP_378:
    cmp byte [rsi], 0
    jz END_378
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_378
END_378:
    sub rsi, 5
LOOP_379:
    cmp byte [rsi], 0
    jz END_379
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_379
END_379:
    add rsi, 8
    jmp LOOP_377
END_377:
    sub rsi, 9
LOOP_380:
    cmp byte [rsi], 0
    jz END_380
    sub rsi, 9
    jmp LOOP_380
END_380:
    add rsi, 9
    add byte [rsi], 15
LOOP_381:
    cmp byte [rsi], 0
    jz END_381
LOOP_382:
    cmp byte [rsi], 0
    jz END_382
    add rsi, 9
    jmp LOOP_382
END_382:
    add byte [rsi], 1
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
    add rsi, 1
    mov byte [rsi], 0
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 9
LOOP_383:
    cmp byte [rsi], 0
    jz END_383
    sub rsi, 9
    jmp LOOP_383
END_383:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_381
END_381:
    add byte [rsi], 1
LOOP_384:
    cmp byte [rsi], 0
    jz END_384
    add rsi, 1
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_384
END_384:
    sub rsi, 9
LOOP_385:
    cmp byte [rsi], 0
    jz END_385
    sub rsi, 9
    jmp LOOP_385
END_385:
    add rsi, 9
LOOP_386:
    cmp byte [rsi], 0
    jz END_386
    add rsi, 1
    sub byte [rsi], 1
    add rsi, 4
LOOP_387:
    cmp byte [rsi], 0
    jz END_387
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_387
END_387:
    sub rsi, 4
LOOP_388:
    cmp byte [rsi], 0
    jz END_388
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 5
LOOP_389:
    cmp byte [rsi], 0
    jz END_389
    sub byte [rsi], 1
    add rsi, 2
LOOP_390:
    cmp byte [rsi], 0
    jz END_390
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_390
END_390:
    sub rsi, 2
LOOP_391:
    cmp byte [rsi], 0
    jz END_391
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 4
    jmp LOOP_391
END_391:
    add byte [rsi], 1
    add rsi, 9
    jmp LOOP_389
END_389:
    sub rsi, 8
LOOP_392:
    cmp byte [rsi], 0
    jz END_392
    sub rsi, 9
    jmp LOOP_392
END_392:
    jmp LOOP_388
END_388:
    add rsi, 9
LOOP_393:
    cmp byte [rsi], 0
    jz END_393
    add rsi, 9
    jmp LOOP_393
END_393:
    sub rsi, 9
LOOP_394:
    cmp byte [rsi], 0
    jz END_394
    add rsi, 1
LOOP_395:
    cmp byte [rsi], 0
    jz END_395
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_395
END_395:
    sub rsi, 10
    jmp LOOP_394
END_394:
    add rsi, 1
LOOP_396:
    cmp byte [rsi], 0
    jz END_396
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_396
END_396:
    call back_inc
    add rsi, 8
    jmp LOOP_386
END_386:
    sub rsi, 9
LOOP_397:
    cmp byte [rsi], 0
    jz END_397
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 4
LOOP_398:
    cmp byte [rsi], 0
    jz END_398
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 1
LOOP_399:
    cmp byte [rsi], 0
    jz END_399
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_399
END_399:
    sub rsi, 1
LOOP_400:
    cmp byte [rsi], 0
    jz END_400
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_400
END_400:
    add rsi, 4
    jmp LOOP_398
END_398:
    sub rsi, 3
LOOP_401:
    cmp byte [rsi], 0
    jz END_401
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_401
END_401:
    call back_inc
    sub rsi, 9
    jmp LOOP_397
END_397:
    add rsi, 9
LOOP_402:
    cmp byte [rsi], 0
    jz END_402
    add rsi, 1
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_402
END_402:
    sub rsi, 9
LOOP_403:
    cmp byte [rsi], 0
    jz END_403
    sub rsi, 9
    jmp LOOP_403
END_403:
    add rsi, 9
LOOP_404:
    cmp byte [rsi], 0
    jz END_404
    add rsi, 1
    sub byte [rsi], 1
    add rsi, 5
LOOP_405:
    cmp byte [rsi], 0
    jz END_405
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_405
END_405:
    sub rsi, 5
LOOP_406:
    cmp byte [rsi], 0
    jz END_406
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 6
LOOP_407:
    cmp byte [rsi], 0
    jz END_407
    sub byte [rsi], 1
    add rsi, 3
LOOP_408:
    cmp byte [rsi], 0
    jz END_408
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_408
END_408:
    sub rsi, 3
LOOP_409:
    cmp byte [rsi], 0
    jz END_409
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 4
    jmp LOOP_409
END_409:
    add byte [rsi], 1
    add rsi, 9
    jmp LOOP_407
END_407:
    sub rsi, 8
LOOP_410:
    cmp byte [rsi], 0
    jz END_410
    sub rsi, 9
    jmp LOOP_410
END_410:
    jmp LOOP_406
END_406:
    add rsi, 9
LOOP_411:
    cmp byte [rsi], 0
    jz END_411
    add rsi, 9
    jmp LOOP_411
END_411:
    sub rsi, 9
LOOP_412:
    cmp byte [rsi], 0
    jz END_412
    add rsi, 2
LOOP_413:
    cmp byte [rsi], 0
    jz END_413
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_413
END_413:
    sub rsi, 11
    jmp LOOP_412
END_412:
    add rsi, 2
LOOP_414:
    cmp byte [rsi], 0
    jz END_414
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_414
END_414:
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_404
END_404:
    sub rsi, 9
LOOP_415:
    cmp byte [rsi], 0
    jz END_415
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 4
LOOP_416:
    cmp byte [rsi], 0
    jz END_416
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 1
LOOP_417:
    cmp byte [rsi], 0
    jz END_417
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_417
END_417:
    sub rsi, 1
LOOP_418:
    cmp byte [rsi], 0
    jz END_418
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_418
END_418:
    add rsi, 4
    jmp LOOP_416
END_416:
    sub rsi, 3
LOOP_419:
    cmp byte [rsi], 0
    jz END_419
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_419
END_419:
    call back_inc
    sub rsi, 9
    jmp LOOP_415
END_415:
    add rsi, 9
LOOP_420:
    cmp byte [rsi], 0
    jz END_420
    add rsi, 4
LOOP_421:
    cmp byte [rsi], 0
    jz END_421
    sub byte [rsi], 1
    sub rsi, 36
    add byte [rsi], 1
    add rsi, 36
    jmp LOOP_421
END_421:
    add rsi, 5
    jmp LOOP_420
END_420:
    sub rsi, 9
LOOP_422:
    cmp byte [rsi], 0
    jz END_422
    sub rsi, 9
    jmp LOOP_422
END_422:
    add rsi, 9
    add byte [rsi], 15
LOOP_423:
    cmp byte [rsi], 0
    jz END_423
LOOP_424:
    cmp byte [rsi], 0
    jz END_424
    add rsi, 9
    jmp LOOP_424
END_424:
    sub rsi, 9
    sub byte [rsi], 1
    sub rsi, 9
LOOP_425:
    cmp byte [rsi], 0
    jz END_425
    sub rsi, 9
    jmp LOOP_425
END_425:
    add rsi, 9
    sub byte [rsi], 1
    jmp LOOP_423
END_423:
    add byte [rsi], 1
    add rsi, 21
    add byte [rsi], 1
    sub rsi, 3
LOOP_426:
    cmp byte [rsi], 0
    jz END_426
    sub rsi, 9
    jmp LOOP_426
END_426:
    add rsi, 9
LOOP_427:
    cmp byte [rsi], 0
    jz END_427
    add rsi, 3
LOOP_428:
    cmp byte [rsi], 0
    jz END_428
    sub byte [rsi], 1
    sub rsi, 3
    sub byte [rsi], 1
    add rsi, 3
    jmp LOOP_428
END_428:
    add byte [rsi], 1
    sub rsi, 3
LOOP_429:
    cmp byte [rsi], 0
    jz END_429
    sub byte [rsi], 1
    add rsi, 3
    sub byte [rsi], 1
    add rsi, 1
LOOP_430:
    cmp byte [rsi], 0
    jz END_430
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_430
END_430:
    sub rsi, 4
LOOP_431:
    cmp byte [rsi], 0
    jz END_431
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 13
LOOP_432:
    cmp byte [rsi], 0
    jz END_432
    sub rsi, 9
    jmp LOOP_432
END_432:
    add rsi, 4
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 5
LOOP_433:
    cmp byte [rsi], 0
    jz END_433
    add rsi, 9
    jmp LOOP_433
END_433:
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_431
END_431:
    jmp LOOP_429
END_429:
    add byte [rsi], 1
    add rsi, 4
LOOP_434:
    cmp byte [rsi], 0
    jz END_434
    sub byte [rsi], 1
    sub rsi, 4
    sub byte [rsi], 1
    add rsi, 4
    jmp LOOP_434
END_434:
    add byte [rsi], 1
    sub rsi, 4
LOOP_435:
    cmp byte [rsi], 0
    jz END_435
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 1
LOOP_436:
    cmp byte [rsi], 0
    jz END_436
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_436
END_436:
    sub rsi, 3
LOOP_437:
    cmp byte [rsi], 0
    jz END_437
    sub byte [rsi], 1
    add rsi, 3
    add byte [rsi], 1
    sub rsi, 12
LOOP_438:
    cmp byte [rsi], 0
    jz END_438
    sub rsi, 9
    jmp LOOP_438
END_438:
    add rsi, 3
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 6
LOOP_439:
    cmp byte [rsi], 0
    jz END_439
    add rsi, 9
    jmp LOOP_439
END_439:
    add rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_437
END_437:
    jmp LOOP_435
END_435:
    add byte [rsi], 1
    add rsi, 1
LOOP_440:
    cmp byte [rsi], 0
    jz END_440
    sub byte [rsi], 1
    sub rsi, 1
LOOP_441:
    cmp byte [rsi], 0
    jz END_441
    add rsi, 9
    jmp LOOP_441
END_441:
    sub rsi, 8
    jmp LOOP_440
END_440:
    add rsi, 8
    jmp LOOP_427
END_427:
    sub rsi, 9
LOOP_442:
    cmp byte [rsi], 0
    jz END_442
    sub rsi, 9
    jmp LOOP_442
END_442:
    add rsi, 2
    sub byte [rsi], 1
    add rsi, 2
LOOP_443:
    cmp byte [rsi], 0
    jz END_443
    sub byte [rsi], 1
    sub rsi, 4
    add byte [rsi], 1
    add rsi, 4
    jmp LOOP_443
END_443:
    sub rsi, 4
LOOP_444:
    cmp byte [rsi], 0
    jz END_444
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 2
    mov byte [rsi], 0
    sub rsi, 2
    jmp LOOP_444
END_444:
    add rsi, 2
    jmp LOOP_93
END_93:
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 4
LOOP_445:
    cmp byte [rsi], 0
    jz END_445
    sub byte [rsi], 1
    sub rsi, 4
    sub byte [rsi], 1
    add rsi, 4
    jmp LOOP_445
END_445:
    add byte [rsi], 1
    sub rsi, 4
LOOP_446:
    cmp byte [rsi], 0
    jz END_446
    sub byte [rsi], 1
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 6
    call putc
    add rsi, 2
    jmp LOOP_446
END_446:
    add rsi, 4
LOOP_447:
    cmp byte [rsi], 0
    jz END_447
    sub byte [rsi], 1
    sub rsi, 7
    call putc
    add rsi, 7
    jmp LOOP_447
END_447:
    sub rsi, 3
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
    add rsi, 3
LOOP_448:
    cmp byte [rsi], 0
    jz END_448
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
    add rsi, 3
    jmp LOOP_448
END_448:
    sub rsi, 9
LOOP_449:
    cmp byte [rsi], 0
    jz END_449
    sub rsi, 9
    jmp LOOP_449
END_449:
    add rsi, 9
LOOP_450:
    cmp byte [rsi], 0
    jz END_450
    add rsi, 5
    mov byte [rsi], 0
    add rsi, 4
    jmp LOOP_450
END_450:
    sub rsi, 9
LOOP_451:
    cmp byte [rsi], 0
    jz END_451
    sub rsi, 9
    jmp LOOP_451
END_451:
    add rsi, 1
    add byte [rsi], 11
LOOP_452:
    cmp byte [rsi], 0
    jz END_452
    sub byte [rsi], 1
LOOP_453:
    cmp byte [rsi], 0
    jz END_453
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_453
END_453:
    add rsi, 9
    jmp LOOP_452
END_452:
    add rsi, 4
    add byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 14
LOOP_454:
    cmp byte [rsi], 0
    jz END_454
    sub rsi, 9
    jmp LOOP_454
END_454:
    add rsi, 7
LOOP_455:
    cmp byte [rsi], 0
    jz END_455
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_455
END_455:
    sub rsi, 7
LOOP_456:
    cmp byte [rsi], 0
    jz END_456
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    mov byte [rsi], 0
    add rsi, 2
LOOP_457:
    cmp byte [rsi], 0
    jz END_457
    add rsi, 9
    jmp LOOP_457
END_457:
    sub rsi, 9
LOOP_458:
    cmp byte [rsi], 0
    jz END_458
    add rsi, 7
LOOP_459:
    cmp byte [rsi], 0
    jz END_459
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_459
END_459:
    sub rsi, 6
LOOP_460:
    cmp byte [rsi], 0
    jz END_460
    sub byte [rsi], 1
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 7
LOOP_461:
    cmp byte [rsi], 0
    jz END_461
    sub rsi, 9
    jmp LOOP_461
END_461:
    add rsi, 7
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_460
END_460:
    sub rsi, 10
    jmp LOOP_458
END_458:
    jmp LOOP_456
END_456:
    add rsi, 7
LOOP_462:
    cmp byte [rsi], 0
    jz END_462
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_462
END_462:
    sub rsi, 7
LOOP_463:
    cmp byte [rsi], 0
    jz END_463
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    add rsi, 2
LOOP_464:
    cmp byte [rsi], 0
    jz END_464
    add rsi, 1
    add byte [rsi], 1
    add rsi, 4
LOOP_465:
    cmp byte [rsi], 0
    jz END_465
    sub byte [rsi], 1
    sub rsi, 4
    sub byte [rsi], 1
    add rsi, 4
    jmp LOOP_465
END_465:
    sub rsi, 4
LOOP_466:
    cmp byte [rsi], 0
    jz END_466
    sub byte [rsi], 1
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 4
    jmp LOOP_466
END_466:
    add rsi, 8
    jmp LOOP_464
END_464:
    sub rsi, 2
    add byte [rsi], 1
    sub rsi, 7
LOOP_467:
    cmp byte [rsi], 0
    jz END_467
    add rsi, 5
LOOP_468:
    cmp byte [rsi], 0
    jz END_468
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_468
END_468:
    sub rsi, 14
    jmp LOOP_467
END_467:
    add rsi, 9
LOOP_469:
    cmp byte [rsi], 0
    jz END_469
    add rsi, 9
    jmp LOOP_469
END_469:
    sub rsi, 9
LOOP_470:
    cmp byte [rsi], 0
    jz END_470
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 7
LOOP_471:
    cmp byte [rsi], 0
    jz END_471
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 1
LOOP_472:
    cmp byte [rsi], 0
    jz END_472
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_472
END_472:
    sub rsi, 1
LOOP_473:
    cmp byte [rsi], 0
    jz END_473
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_473
END_473:
    add rsi, 7
    jmp LOOP_471
END_471:
    sub rsi, 6
LOOP_474:
    cmp byte [rsi], 0
    jz END_474
    sub byte [rsi], 1
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 6
    jmp LOOP_474
END_474:
    call back_inc
    sub rsi, 9
    jmp LOOP_470
END_470:
    add rsi, 7
    sub byte [rsi], 1
    sub rsi, 4
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_463
END_463:
    add byte [rsi], 1
    add rsi, 7
LOOP_475:
    cmp byte [rsi], 0
    jz END_475
    sub byte [rsi], 1
    sub rsi, 7
    sub byte [rsi], 1
    add rsi, 7
    jmp LOOP_475
END_475:
    add byte [rsi], 1
    sub rsi, 7
LOOP_476:
    cmp byte [rsi], 0
    jz END_476
    sub byte [rsi], 1
    add rsi, 7
    sub byte [rsi], 1
    add rsi, 2
LOOP_477:
    cmp byte [rsi], 0
    jz END_477
    add rsi, 5
LOOP_478:
    cmp byte [rsi], 0
    jz END_478
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_478
END_478:
    add rsi, 4
    jmp LOOP_477
END_477:
    sub rsi, 9
LOOP_479:
    cmp byte [rsi], 0
    jz END_479
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 7
LOOP_480:
    cmp byte [rsi], 0
    jz END_480
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 1
LOOP_481:
    cmp byte [rsi], 0
    jz END_481
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 3
    add byte [rsi], 1
    add rsi, 3
    jmp LOOP_481
END_481:
    sub rsi, 1
LOOP_482:
    cmp byte [rsi], 0
    jz END_482
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_482
END_482:
    add rsi, 7
    jmp LOOP_480
END_480:
    sub rsi, 6
LOOP_483:
    cmp byte [rsi], 0
    jz END_483
    sub byte [rsi], 1
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 6
    jmp LOOP_483
END_483:
    call back_inc
    sub rsi, 9
    jmp LOOP_479
END_479:
    add rsi, 1
    add byte [rsi], 5
LOOP_484:
    cmp byte [rsi], 0
    jz END_484
    sub byte [rsi], 1
LOOP_485:
    cmp byte [rsi], 0
    jz END_485
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_485
END_485:
    add rsi, 9
    jmp LOOP_484
END_484:
    add rsi, 4
    add byte [rsi], 1
    sub rsi, 5
LOOP_486:
    cmp byte [rsi], 0
    jz END_486
    sub rsi, 9
    jmp LOOP_486
END_486:
    add rsi, 9
LOOP_487:
    cmp byte [rsi], 0
    jz END_487
    add rsi, 5
LOOP_488:
    cmp byte [rsi], 0
    jz END_488
    sub byte [rsi], 1
    sub rsi, 5
    sub byte [rsi], 1
    add rsi, 5
    jmp LOOP_488
END_488:
    add byte [rsi], 1
    sub rsi, 5
LOOP_489:
    cmp byte [rsi], 0
    jz END_489
    sub byte [rsi], 1
    add rsi, 5
    sub byte [rsi], 1
    add rsi, 2
LOOP_490:
    cmp byte [rsi], 0
    jz END_490
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_490
END_490:
    sub rsi, 7
LOOP_491:
    cmp byte [rsi], 0
    jz END_491
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 16
LOOP_492:
    cmp byte [rsi], 0
    jz END_492
    sub rsi, 9
    jmp LOOP_492
END_492:
    add rsi, 4
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 5
LOOP_493:
    cmp byte [rsi], 0
    jz END_493
    add rsi, 9
    jmp LOOP_493
END_493:
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_491
END_491:
    jmp LOOP_489
END_489:
    add byte [rsi], 1
    add rsi, 7
LOOP_494:
    cmp byte [rsi], 0
    jz END_494
    sub byte [rsi], 1
    sub rsi, 7
    sub byte [rsi], 1
    add rsi, 7
    jmp LOOP_494
END_494:
    add byte [rsi], 1
    sub rsi, 7
LOOP_495:
    cmp byte [rsi], 0
    jz END_495
    sub byte [rsi], 1
    add rsi, 7
    sub byte [rsi], 1
    sub rsi, 2
LOOP_496:
    cmp byte [rsi], 0
    jz END_496
    sub byte [rsi], 1
    sub rsi, 5
    add byte [rsi], 1
    add rsi, 5
    jmp LOOP_496
END_496:
    sub rsi, 5
LOOP_497:
    cmp byte [rsi], 0
    jz END_497
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 14
LOOP_498:
    cmp byte [rsi], 0
    jz END_498
    sub rsi, 9
    jmp LOOP_498
END_498:
    add rsi, 3
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 6
LOOP_499:
    cmp byte [rsi], 0
    jz END_499
    add rsi, 9
    jmp LOOP_499
END_499:
    add rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_497
END_497:
    jmp LOOP_495
END_495:
    add byte [rsi], 1
    add rsi, 1
LOOP_500:
    cmp byte [rsi], 0
    jz END_500
    sub byte [rsi], 1
    sub rsi, 1
LOOP_501:
    cmp byte [rsi], 0
    jz END_501
    add rsi, 9
    jmp LOOP_501
END_501:
    sub rsi, 8
    jmp LOOP_500
END_500:
    add rsi, 8
    jmp LOOP_487
END_487:
    sub rsi, 9
LOOP_502:
    cmp byte [rsi], 0
    jz END_502
    sub rsi, 9
    jmp LOOP_502
END_502:
    add rsi, 4
    mov byte [rsi], 0
    sub rsi, 3
    add byte [rsi], 5
LOOP_503:
    cmp byte [rsi], 0
    jz END_503
    sub byte [rsi], 1
LOOP_504:
    cmp byte [rsi], 0
    jz END_504
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_504
END_504:
    add rsi, 9
    jmp LOOP_503
END_503:
    add rsi, 4
    sub byte [rsi], 1
    sub rsi, 5
LOOP_505:
    cmp byte [rsi], 0
    jz END_505
    sub rsi, 9
    jmp LOOP_505
END_505:
    jmp LOOP_476
END_476:
    add rsi, 3
    jmp LOOP_17
END_17:
    sub rsi, 4
    call putc
    add rsi, 10
LOOP_506:
    cmp byte [rsi], 0
    jz END_506
    add rsi, 6
    mov byte [rsi], 0
    add rsi, 3
    jmp LOOP_506
END_506:
    sub rsi, 9
LOOP_507:
    cmp byte [rsi], 0
    jz END_507
    sub rsi, 9
    jmp LOOP_507
END_507:
    add rsi, 1
    add byte [rsi], 10
LOOP_508:
    cmp byte [rsi], 0
    jz END_508
    sub byte [rsi], 1
LOOP_509:
    cmp byte [rsi], 0
    jz END_509
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_509
END_509:
    add rsi, 9
    jmp LOOP_508
END_508:
    add rsi, 5
    add byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 15
LOOP_510:
    cmp byte [rsi], 0
    jz END_510
    sub rsi, 9
    jmp LOOP_510
END_510:
    add rsi, 8
LOOP_511:
    cmp byte [rsi], 0
    jz END_511
    sub byte [rsi], 1
    sub rsi, 8
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_511
END_511:
    sub rsi, 8
LOOP_512:
    cmp byte [rsi], 0
    jz END_512
    sub byte [rsi], 1
    add rsi, 8
    add byte [rsi], 1
    mov byte [rsi], 0
    add rsi, 1
LOOP_513:
    cmp byte [rsi], 0
    jz END_513
    add rsi, 9
    jmp LOOP_513
END_513:
    sub rsi, 9
LOOP_514:
    cmp byte [rsi], 0
    jz END_514
    add rsi, 8
LOOP_515:
    cmp byte [rsi], 0
    jz END_515
    sub byte [rsi], 1
    sub rsi, 7
    add byte [rsi], 1
    add rsi, 7
    jmp LOOP_515
END_515:
    sub rsi, 7
LOOP_516:
    cmp byte [rsi], 0
    jz END_516
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 8
LOOP_517:
    cmp byte [rsi], 0
    jz END_517
    sub rsi, 9
    jmp LOOP_517
END_517:
    add rsi, 8
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_516
END_516:
    sub rsi, 10
    jmp LOOP_514
END_514:
    jmp LOOP_512
END_512:
    add rsi, 8
LOOP_518:
    cmp byte [rsi], 0
    jz END_518
    sub byte [rsi], 1
    sub rsi, 8
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_518
END_518:
    sub rsi, 8
LOOP_519:
    cmp byte [rsi], 0
    jz END_519
    sub byte [rsi], 1
    add rsi, 8
    add byte [rsi], 1
    add rsi, 1
LOOP_520:
    cmp byte [rsi], 0
    jz END_520
    add rsi, 1
    add byte [rsi], 1
    add rsi, 5
LOOP_521:
    cmp byte [rsi], 0
    jz END_521
    sub byte [rsi], 1
    sub rsi, 5
    sub byte [rsi], 1
    add rsi, 5
    jmp LOOP_521
END_521:
    sub rsi, 5
LOOP_522:
    cmp byte [rsi], 0
    jz END_522
    sub byte [rsi], 1
    add rsi, 5
    add byte [rsi], 1
    sub rsi, 5
    jmp LOOP_522
END_522:
    add rsi, 8
    jmp LOOP_520
END_520:
    call back_inc
    sub rsi, 8
LOOP_523:
    cmp byte [rsi], 0
    jz END_523
    add rsi, 6
LOOP_524:
    cmp byte [rsi], 0
    jz END_524
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_524
END_524:
    sub rsi, 15
    jmp LOOP_523
END_523:
    add rsi, 9
LOOP_525:
    cmp byte [rsi], 0
    jz END_525
    add rsi, 9
    jmp LOOP_525
END_525:
    sub rsi, 9
LOOP_526:
    cmp byte [rsi], 0
    jz END_526
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 8
LOOP_527:
    cmp byte [rsi], 0
    jz END_527
    sub byte [rsi], 1
    sub rsi, 8
    add byte [rsi], 1
    add rsi, 1
LOOP_528:
    cmp byte [rsi], 0
    jz END_528
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_528
END_528:
    sub rsi, 1
LOOP_529:
    cmp byte [rsi], 0
    jz END_529
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_529
END_529:
    add rsi, 8
    jmp LOOP_527
END_527:
    sub rsi, 7
LOOP_530:
    cmp byte [rsi], 0
    jz END_530
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 7
    jmp LOOP_530
END_530:
    call back_inc
    sub rsi, 9
    jmp LOOP_526
END_526:
    add rsi, 8
    sub byte [rsi], 1
    sub rsi, 5
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 3
    jmp LOOP_519
END_519:
    add byte [rsi], 1
    add rsi, 8
LOOP_531:
    cmp byte [rsi], 0
    jz END_531
    sub byte [rsi], 1
    sub rsi, 8
    sub byte [rsi], 1
    add rsi, 8
    jmp LOOP_531
END_531:
    add byte [rsi], 1
    sub rsi, 8
LOOP_532:
    cmp byte [rsi], 0
    jz END_532
    sub byte [rsi], 1
    add rsi, 8
    sub byte [rsi], 1
    add rsi, 1
LOOP_533:
    cmp byte [rsi], 0
    jz END_533
    add rsi, 6
LOOP_534:
    cmp byte [rsi], 0
    jz END_534
    sub byte [rsi], 1
    add rsi, 2
    add byte [rsi], 1
    sub rsi, 2
    jmp LOOP_534
END_534:
    add rsi, 3
    jmp LOOP_533
END_533:
    sub rsi, 9
LOOP_535:
    cmp byte [rsi], 0
    jz END_535
    add rsi, 1
    mov byte [rsi], 0
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 8
LOOP_536:
    cmp byte [rsi], 0
    jz END_536
    sub byte [rsi], 1
    sub rsi, 8
    add byte [rsi], 1
    add rsi, 1
LOOP_537:
    cmp byte [rsi], 0
    jz END_537
    sub rsi, 1
    sub byte [rsi], 1
    add rsi, 1
    sub byte [rsi], 1
    sub rsi, 2
    add byte [rsi], 1
    add rsi, 2
    jmp LOOP_537
END_537:
    sub rsi, 1
LOOP_538:
    cmp byte [rsi], 0
    jz END_538
    sub byte [rsi], 1
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_538
END_538:
    add rsi, 8
    jmp LOOP_536
END_536:
    sub rsi, 7
LOOP_539:
    cmp byte [rsi], 0
    jz END_539
    sub byte [rsi], 1
    add rsi, 7
    add byte [rsi], 1
    sub rsi, 7
    jmp LOOP_539
END_539:
    call back_inc
    sub rsi, 9
    jmp LOOP_535
END_535:
    add rsi, 1
    add byte [rsi], 5
LOOP_540:
    cmp byte [rsi], 0
    jz END_540
    sub byte [rsi], 1
LOOP_541:
    cmp byte [rsi], 0
    jz END_541
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_541
END_541:
    add rsi, 9
    jmp LOOP_540
END_540:
    add rsi, 5
    add byte [rsi], 1
    add rsi, 27
    add byte [rsi], 1
    sub rsi, 6
LOOP_542:
    cmp byte [rsi], 0
    jz END_542
    sub rsi, 9
    jmp LOOP_542
END_542:
    add rsi, 9
LOOP_543:
    cmp byte [rsi], 0
    jz END_543
    add rsi, 6
LOOP_544:
    cmp byte [rsi], 0
    jz END_544
    sub byte [rsi], 1
    sub rsi, 6
    sub byte [rsi], 1
    add rsi, 6
    jmp LOOP_544
END_544:
    add byte [rsi], 1
    sub rsi, 6
LOOP_545:
    cmp byte [rsi], 0
    jz END_545
    sub byte [rsi], 1
    add rsi, 6
    sub byte [rsi], 1
    add rsi, 2
LOOP_546:
    cmp byte [rsi], 0
    jz END_546
    sub byte [rsi], 1
    sub rsi, 8
    add byte [rsi], 1
    add rsi, 8
    jmp LOOP_546
END_546:
    sub rsi, 8
LOOP_547:
    cmp byte [rsi], 0
    jz END_547
    sub byte [rsi], 1
    add rsi, 8
    add byte [rsi], 1
    sub rsi, 17
LOOP_548:
    cmp byte [rsi], 0
    jz END_548
    sub rsi, 9
    jmp LOOP_548
END_548:
    add rsi, 4
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 5
LOOP_549:
    cmp byte [rsi], 0
    jz END_549
    add rsi, 9
    jmp LOOP_549
END_549:
    add rsi, 1
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_547
END_547:
    jmp LOOP_545
END_545:
    add byte [rsi], 1
    add rsi, 8
LOOP_550:
    cmp byte [rsi], 0
    jz END_550
    sub byte [rsi], 1
    sub rsi, 8
    sub byte [rsi], 1
    add rsi, 8
    jmp LOOP_550
END_550:
    add byte [rsi], 1
    sub rsi, 8
LOOP_551:
    cmp byte [rsi], 0
    jz END_551
    sub byte [rsi], 1
    add rsi, 8
    sub byte [rsi], 1
    sub rsi, 2
LOOP_552:
    cmp byte [rsi], 0
    jz END_552
    sub byte [rsi], 1
    sub rsi, 6
    add byte [rsi], 1
    add rsi, 6
    jmp LOOP_552
END_552:
    sub rsi, 6
LOOP_553:
    cmp byte [rsi], 0
    jz END_553
    sub byte [rsi], 1
    add rsi, 6
    add byte [rsi], 1
    sub rsi, 15
LOOP_554:
    cmp byte [rsi], 0
    jz END_554
    sub rsi, 9
    jmp LOOP_554
END_554:
    add rsi, 3
    mov byte [rsi], 0
    add byte [rsi], 1
    add rsi, 6
LOOP_555:
    cmp byte [rsi], 0
    jz END_555
    add rsi, 9
    jmp LOOP_555
END_555:
    add rsi, 1
    mov byte [rsi], 0
    add byte [rsi], 1
    sub rsi, 1
    jmp LOOP_553
END_553:
    jmp LOOP_551
END_551:
    add byte [rsi], 1
    add rsi, 1
LOOP_556:
    cmp byte [rsi], 0
    jz END_556
    sub byte [rsi], 1
    sub rsi, 1
LOOP_557:
    cmp byte [rsi], 0
    jz END_557
    add rsi, 9
    jmp LOOP_557
END_557:
    sub rsi, 8
    jmp LOOP_556
END_556:
    add rsi, 8
    jmp LOOP_543
END_543:
    sub rsi, 9
LOOP_558:
    cmp byte [rsi], 0
    jz END_558
    sub rsi, 9
    jmp LOOP_558
END_558:
    add rsi, 4
    mov byte [rsi], 0
    sub rsi, 3
    add byte [rsi], 5
LOOP_559:
    cmp byte [rsi], 0
    jz END_559
    sub byte [rsi], 1
LOOP_560:
    cmp byte [rsi], 0
    jz END_560
    sub byte [rsi], 1
    add rsi, 9
    add byte [rsi], 1
    sub rsi, 9
    jmp LOOP_560
END_560:
    add rsi, 9
    jmp LOOP_559
END_559:
    add rsi, 5
    sub byte [rsi], 1
    add rsi, 27
    sub byte [rsi], 1
    sub rsi, 6
LOOP_561:
    cmp byte [rsi], 0
    jz END_561
    sub rsi, 9
    jmp LOOP_561
END_561:
    jmp LOOP_532
END_532:
    add rsi, 3
    jmp LOOP_9
END_9:
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

