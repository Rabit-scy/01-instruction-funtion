/**
    implement stack modular.
    from now on, i'm ready to learn function call
    first, modular stack
*/

.extern my_push
.extern my_pop

.data
my_data:
    .word 0x11223344
    .word 0x88776655
    .word 0xccbbaa99


.text
.globl my_start
.type my_start, @function

my_start:
/*
    from now on, i will use abi specific for register name.
*/
    li ra, 0 # x1 = 0
    li sp, 0 # x2 = 0
    li gp, 0 # x3 = 0
    li tp, 0 # x4 = 0
    li t0, 0 # x5 = 0
    li t1, 0 # x6 = 0
    li t2, 0 # x7 = 0
    li s0, 0 # x8 = 0  s0/fp := x8
    li s1, 0 # x9 = 0
    li a0, 0 # x10 = 0
    li a1, 0 # x11 = 0
    li a2, 0 # x12 = 0
    li a3, 0 # x13 = 0
    li a4, 0 # x14 = 0
    li a5, 0 # x15 = 0

    # initialize stack point
    la sp, _my_stack_start # sp = _my_stack_start
    
    # load data from flash to sram
    la a0, _data_section_vma_start # 
    la a1, _data_section_lma_start # 
    la a2, _data_section_end # 
    beq a1, a2, 2f; # if a1 == a2 then 2f
    
1:  
    lw t0, 0(a1) #
    sw t0, 0(a0) # 
    addi a0, a0, 4; # a0 = a0 + 4
    addi a1, a1, 4; # a1 = a1 + 4

    blt a0, a2, 1b # if a0 < a2 then 1b
    
2:

    # pass argument
    la a0, my_data # 
    li a1, 3 # a1 = 3
    
    # push my_data to stack
    jal my_push
    
    jal my_pop  # jump to my_pop and save position to ra
    jal my_pop  # jump to my_pop and save position to ra
    jal my_pop  # jump to my_pop and save position to ra
    jal my_pop  # jump to my_pop and save position to ra
    

    nop



