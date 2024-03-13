/*
    bge rs1, rs2, imm
    if(sext(rs1) >= sext(rs2))
        pc += imm
*/

.globl my_start
my_start:
    li x1, 0 # x1 = 0
    li x2, 0 # x2 = 0
    li x3, 0 # x3 = 0
    li x4, 0 # x4 = 0
    li x5, 0 # x5 = 0
    li x6, 0 # x6 = 0
    li x7, 0 # x7 = 0
    li x8, 0 # x8 = 0
    li x9, 0 # x9 = 0
    li x10, 0 # x10 = 0
    li x11, 0 # x11 = 0
    li x12, 0 # x12 = 0
    li x13, 0 # x13 = 0
    li x14, 0 # x14 = 0
    li x15, 0 # x15 = 0
    /*
        do{
            x3 = x2 + 2
            x2 += 1;
        }while(x1>=x2)
    */
    li x2, -10 # x2 = -10
    
target1:
    c.addi x3, 2; # x3 = x3 + 2
    c.addi x2, 1;
    bge x1, x2, target1 # if x1 >= x2 then target1


    c.nop


