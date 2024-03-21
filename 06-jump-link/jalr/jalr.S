
/*
   jalr rd, rs1, offset
   rd = pc + 4
   pc += (rs1 + sext(offset)) & (~1)

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

   jal x1, my_add  # x1 = pc + 4, pc = my_add

 

   li x3, 0x1111 # x3 = 0x1111

   c.nop

.globl my_add
my_add:
   li x2, 0x2222 # x2 = 0x2222
   
   jalr x0, 0(x1)  # x0 = pc +4, pc = ( (x1 + (signed-extend )(0) ) & (~1) )
   
   c.nop



