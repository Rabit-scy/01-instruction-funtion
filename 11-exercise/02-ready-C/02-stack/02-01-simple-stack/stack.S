/**
    when i kown C call function need a data strcuture -- stack
    what is stack, how to implement?
    stack is in ram
    so, i will use lw and sw
    1. initialize stack point
        li sp, _stacksize
    2. push data
        li t0, <data>
        sw t0, 0(sp)
        addi sp, 4
    3. pop data
        addi sp, -4
        lw t1, 0(sp)
*/


.globl my_start
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
    la sp, _data_section_end # sp = _data_section_end
    

    li t0, 0x01 # t0 = 0x01

    # push t0 and t1 into stack
    jal my_push  # jump to my_push and save position to ra
    li t0, 0x02# t0 = 0x02
    jal my_push  # jump to my_push and save position to ra
    li t0, 0x03 # t0 = 0x03
    jal my_push  # jump to my_push and save position to ra
    
    jal my_pop  # jump to my_pop and save position to ra
    jal my_pop  # jump to my_pop and save position to ra
    jal my_pop  # jump to my_pop and save position to ra
    jal my_pop  # jump to my_pop and save position to ra
    

    nop

/* t0 is saved data*/
my_push:
    sw t0, 0(sp) #
    addi sp, sp, 4; # sp = sp + 4
    jr ra   # jump to ra

my_pop:
    addi sp, sp, -4; # sp = sp + -4
    lw a0, 0(sp) # 
    jr ra   # jump to ra
    
