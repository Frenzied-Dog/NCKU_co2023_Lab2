# .section .text
# .global _start

## define macro
.macro putc ascii_numb
    li a0, 1
    li a1, \ascii_numb
    ecall
.endm

.macro exit
    li a0, 0
    ecall
.endm

## begin of the program
_start:
    putc 72 # H
    putc 101 # e
    putc 108 # l
    putc 108 # l
    putc 111 # o
    putc 44 # ,
    putc 32 # space
    putc 87 # W
    putc 111 # o
    putc 114 # r
    putc 108 # l
    putc 100 # d
    putc 33 # !
    putc 10 # \n
    exit
