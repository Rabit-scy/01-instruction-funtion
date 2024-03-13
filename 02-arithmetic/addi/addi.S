/*
.S can use preprosessor...  

    addi rd, rs1, imm
        rd = rs1 + imm
    pseudo instruction
    mv rd, rs
        addi rd, rs, 0
    nop
        c.addi x0, x0, 0
        addi x0, x0, 0

*/

.globl my_start
my_start:
    lui x0, 0
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
    lui x12, 1
    lui x13, 0
    lui x14, 0
    lui x15, 0
    lui x3, 0x10
    lui x4, 0x20
    lui x5, 0x30
    addi x6, x3, 0x1
    mv x7, x4
    c.nop


    