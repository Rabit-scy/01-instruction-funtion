/*
* use abi to write function, and use C-like function call which means use stack. 
* 
*/


.text
.globl my_start
.type my_start, @function
my_start:
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


    csrr  t0, 0x804 # t0 = 0x804    WCH add intsyscr

    /*if i change mtvec, what will happen to reset_handle? */
    li t0, 0x400 # t0 = 0x400 = 1KB
    csrw  mtvec, t0 # mtvec = t0    mtvec = 0x22 this directive is not in effect. probably because of 1kb alignment.

    csrr  t1, mtvec # t1 = mtvec

    /* save systick reg value to ram */
    jal watch_systick_reg  # jump to watch_systick_reg and save position to ra
    /* call systick_cfg */
    jal systick_cfg  # jump to target and save position to ra
    /* save systick reg new value to ram */
    jal watch_systick_reg  # jump to watch_systick_reg and save position to ra


    jal led_cfg

    li a0, 1 # a0 = 1   led on
    jal led_ctrl  # jump to led_ctrl and save position to ra
    
    li a0, 0 # a0 = 0   led off
    jal led_ctrl  # jump to led_ctrl and save position to ra
    

    c.nop
    ret
