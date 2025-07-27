    .section __TEXT,__text,regular,pure_instructions
    .globl _main
    .p2align 2
_main:
    SUB     SP, SP, #16
    STP     X29, X30, [SP]
    MOV     X29, SP
    
    FMOV    D0, #1.0
    FMOV    D1, #2.0
    FSQRT   D1, D1
    FDIV    D1, D0, D1
    FMOV    D2, #0.25
    FMOV    D3, #1.0

    FADD    D4, D0, D1
    FMOV    D5, #2.0
    FDIV    D4, D4, D5
    FMUL    D5, D0, D1
    FSQRT   D5, D5
    FSUB    D6, D0, D4
    FMUL    D6, D6, D6
    FMUL    D6, D6, D3
    FSUB    D2, D2, D6

    FADD    D7, D4, D5
    FMUL    D7, D7, D7
    FMOV    D8, #4.0
    FMUL    D8, D8, D2
    FDIV    D7, D7, D8

    MOV     X8, SP
    STR     D7, [X8]
    ADRP    X0, fmt@PAGE
    ADD     X0, X0, fmt@PAGEOFF
    BL      _printf

    LDP     X29, X30, [SP]
    ADD     SP, SP, #16
    MOV     W0, #0
    RET

    .section __DATA,__data
fmt:
    .asciz "pi = %.12f\n"