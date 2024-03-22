/*
*     the simplest peripheral is systick.
*/


.set __STK_CTRL, 0xE000F000

.equiv __STK_SR, 0xE000F004

.ifdef __STK_CNTR
.err "__STK_CNTR, 0xE000F008"
.endif
.equ __STK_CNTR, 0xE000F008

.set __STK_CMPR, 0xE000F010

.text
.globl my_start
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

    # # initialize stack point
    # la sp, _my_stack_start # sp = _my_stack_start
    
    # # load data from flash to sram
    # call load_data  # load data from flash to sram
    # jal init_bss  # jump to init_bss and save position to ra


    /*if i change mtvec, what will happen to reset_handle? */
    li t0, 0x400 # t0 = 0x400 = 1KB
    csrw  mtvec, t0 # mtvec = t0    mtvec = 0x22 this derective is not in effect. probably because of 1kb alignment.

    csrr  t1, mtvec # t1 = mtvec

    /*watch cntr, sr, ...*/
    li t2, __STK_SR   # t2 = __STK_SR
    lw a1, 0(t2) # 
    li t2, __STK_CNTR   # t2 = __STK_CNTR
    lw a2, 0(t2) # 
    li t2, __STK_CMPR # t2 = __STK_CMPR
    lw a3, 0(t2) # 
    li t2, __STK_CTRL # t2 = __STK_CTRL
    lw a0, 0(t2) # 
    /*call systick_cfg*/
    jal systick_cfg  # jump to target and save position to ra
    
    /*watch cntr, sr, ...*/
    li t2, __STK_SR   # t2 = __STK_SR
    lw a1, 0(t2) # 
    li t2, __STK_CNTR   # t2 = __STK_CNTR
    lw a2, 0(t2) # 
    li t2, __STK_CMPR # t2 = __STK_CMPR
    lw a3, 0(t2) # 
    li t2, __STK_CTRL # t2 = __STK_CTRL
    lw a0, 0(t2) # 

    c.nop
    ret
.globl systick_cfg
systick_cfg:

    /*maybe i should push a4, a5 to stack*/
    li  a5, __STK_CTRL #   a5 =__STK_CTRL 
    lw a4, 0(a5) #
    ori a4, a4, 0x01; # a4 = a4 | 0x01
    sw a4, 0(a5) # start systick
    /*maybe i should pop a4 a5 form stack*/
    ret
    /*
        systick peripheral config
    */
