    .section __TEXT,__text,regular,pure_instructions
    .globl _main
    .p2align 2
_main:
    LDR     D0, =const_one
    LDR     D1, =const_two
    FSQRT   D1, D1
    FDIV    D1, D0, D1
    LDR     D2, =const_quarter
    LDR     D3, =const_one

    FADD    D4, D0, D1
    LDR     D5, =const_two
    FDIV    D4, D4, D5
    FMUL    D5, D0, D1
    FSQRT   D5, D5
    FSUB    D6, D0, D4
    FMUL    D6, D6, D6
    FMUL    D6, D6, D3
    FSUB    D2, D2, D6
    FMUL    D3, D3, D5

    FADD    D7, D4, D5
    FMUL    D7, D7, D7
    LDR     D8, =const_four
    FMUL    D8, D8, D2
    FDIV    D7, D7, D8

    ADRP    X0, fmt@PAGE
    ADD     X0, X0, fmt@PAGEOFF
    FMOV    V0, D7
    BL      _printf

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