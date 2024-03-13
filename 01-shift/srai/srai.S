/*
    sra rd, r1, shamt
        rd = r1 >> shamt
        shamt: shift value
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
    c.addi x11, -0x10; # x11 = x11 - 0x10
    srai x12, x11, 0x04
    c.nop
