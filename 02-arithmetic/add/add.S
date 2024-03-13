/* 
    add rd, rs1, rs2
*/
/*
    rd = rs1 + rs2
 */
/* 
    compress: c.add rd, rs2 
*/
/* 
    lui rd, imm 
*/
.globl my_start
my_start:
    lui x1, 0x20
    lui x2, 0x03
    # add x1, x2, x1
    c.add x1, x2
    c.nop
    c.nop
