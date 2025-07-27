    .section __TEXT,__text,regular,pure_instructions
    .globl _main
    .p2align 2
_main:
    MOV     W0, #0
    RET

    .section __DATA,__data
fmt:
    .asciz "pi = %.12f\n"

const_one:
    .double 1.0
const_two:
    .double 2.0
const_quarter:
    .double 0.25
const_four:
    .double 4.0