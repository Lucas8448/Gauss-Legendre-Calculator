    .section __TEXT,__text,regular,pure_instructions
    .globl _main
    .p2align 2
_main:
    LDR     D0, =const_one
    FSQRT   D1, D1
    FDIV    D1, D0, D1
    LDR     D2, =const_quarter
    LDR     D3, =const_one
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