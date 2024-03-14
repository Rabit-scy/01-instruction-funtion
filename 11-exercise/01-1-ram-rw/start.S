/*
    
*/

# i don't declare section.
# linker has default behavior.
# .data
.globl my_data
my_data:
    .byte 0xaa
    .byte 0xbb
    .byte 0xcc
    .byte 0xdd
    .half 0x1122
    .half 0x3344
    .word 0x99887766
.globl my_array
my_array:
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0

.text
# ..if i don't declare my_start with .globl
# linker will give warning 
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

    la x1, my_data #

    lbu x2, 0(x1) #
    lbu x3, 1(x1) #
    lbu x4, 2(x1)
    lbu x5, 3(x1)

    lhu x6, 4(x1)
    lhu x7, 6(x1)

    lw x8, 8(x1) # 
    
    
    c.nop

