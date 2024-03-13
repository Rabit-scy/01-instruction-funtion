/*
    xor rd, rs1, rs2
        rd = rs1 ^ rs2
*/

.globl my_start

my_start:
    li x1, 0
    li x2, 0
    li x3, 0
    li x4, 0
    li x5, 0
    li x6, 0
    li x7, 0
    li x8, 0
    li x9, 0
    li x10, 0
    li x11, 0
    li x12, 0
    li x13, 0
    li x14, 0
    li x15, 0

    li x1, 0x03; # x1 = 0x03
    li x2, 0x0a; # x2 = 0x0a
    
    xor x3, x1, x2; # x3 = x1 ^ x2
    
    c.nop

