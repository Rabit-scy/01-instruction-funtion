/*
    slt rd, rs1, rs2
        if rs1<rs2
            rd = 1
        else
            rd = 0
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

    li x3, 0x03; # x3 = 0x03
    li x4, -0x0a; # x4 = -0x0a
    
    slt x5, x3, x4;
    
    c.nop

