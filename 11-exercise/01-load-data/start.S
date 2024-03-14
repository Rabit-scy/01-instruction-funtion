/*
    
*/

# i don't declare section 
# linker default behavior
.data
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
# ..if i don't declare my_start with .globl
# linker will give warning 
.text
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

    la x2, _data_section_vma_start # non-PIC

    # non-PIC: postion absolute,  which means the symbol value in symbol table is an address,
    # needn't to use register addressing. like :
    #                                       addi ra, ra, symbol
    # PIC: postion relative, which means the symbol value is an imm. 
    # to access symbol, need to use register addressing. like:
    #                                       l[w|d] ra, rs1, symbol
    la x1, _data_section_lma_start # ra := x1
    lbu x3, 0(x1) #
    lbu x4, 1(x1) #
    lbu x5, 2(x1)
    lbu x6, 3(x1)

    lhu x7, 4(x1)
    lhu x8, 6(x1)

    lw x9, 8(x1) # 
    
    # you have seen load data from flash to ram is work.
    # then try to initial them
    la x15, _data_section_end #
copy_data:
    lw x10, 0(x1) # 
    sw x10, 0(x2) # 
    addi x1, x1, 4; # x1 = x1 + 4
    addi x2, x2, 4; # x2 = x2 + 4
    # bgeu x15, x2, copy_data # if x15 >= x2 then copy_data
    blt x2, x15, copy_data # if x2 < x15 then copy_data
    
    # see data in sram
    la x14, my_data # 
    lw x11, 0(x14) # 
    lw x12, 4(x14) # 
    lw x13, 8(x14) # 
    
    
    c.nop

