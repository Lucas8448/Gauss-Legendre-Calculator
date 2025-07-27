    .section __TEXT,__text,regular,pure_instructions
    .globl _main
    .p2align 2
_main:
    SUB     SP, SP, #32
    STP     X29, X30, [SP, #16]
    ADD     X29, SP, #16
    
    FMOV    D0, #1.0
    FMOV    D1, #2.0
    FSQRT   D1, D1
    FDIV    D1, D0, D1
    FMOV    D2, #0.25
    FMOV    D3, #1.0
    
    MOV     W19, #1

iteration_loop:
    CMP     W19, #10
    B.GT    end_program

    FADD    D4, D0, D1
    FMOV    D5, #2.0
    FDIV    D4, D4, D5
    FMUL    D5, D0, D1
    FSQRT   D5, D5
    FSUB    D6, D0, D4
    FMUL    D6, D6, D6
    FMUL    D6, D6, D3
    FSUB    D8, D2, D6
    FADD    D9, D3, D3

    FADD    D7, D4, D5
    FMUL    D7, D7, D7
    FMOV    D10, #4.0
    FMUL    D10, D10, D8
    FDIV    D7, D7, D10

    STR     W19, [SP]
    MOV     X8, SP
    ADD     X8, X8, #8
    STR     D7, [X8]
    ADRP    X0, fmt@PAGE
    ADD     X0, X0, fmt@PAGEOFF
    BL      _printf

    FMOV    D0, D4
    FMOV    D1, D5
    FMOV    D2, D8
    FMOV    D3, D9
    ADD     W19, W19, #1
    B       iteration_loop

end_program:

    LDP     X29, X30, [SP, #16]
    ADD     SP, SP, #32
    MOV     W0, #0
    RET

    .section __DATA,__data
fmt:
    .asciz "Iteration %d: pi = %.15f\n"