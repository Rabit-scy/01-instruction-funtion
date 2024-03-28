/**
    implement stack, load data, init bss module.
    
    
*/
# .extern load_data
# .extern my_push
# .extern my_pop
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
    call load_data  # load data from flash to sram
    jal init_bss  # jump to init_bss and save position to ra
    j main  # jump to main
    

    nop



