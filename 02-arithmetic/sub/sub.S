/*
    sub rd, rs1, rs2
        rd = rs1 - rs2
    pseudo instruction
    neg rd, rs
        sub rd, x0, rs
        
*/
.globl my_start
my_start:
    lui x1, 0
    lui x2, 0
    lui x3, 0
    lui x4, 0
    lui x5, 0
    lui x6, 0
    lui x7, 0
    lui x8, 0
    lui x9, 0
    lui x10, 0
    lui x11, 0
    lui x12, 0
    lui x13, 0
    lui x14, 0
    lui x15, 0
    lui x6, 0x1
    lui x7, 0x10
    sub x8, x7, x6
    neg x9, x6
    neg x9, x7
    neg x8, x8
    nop











