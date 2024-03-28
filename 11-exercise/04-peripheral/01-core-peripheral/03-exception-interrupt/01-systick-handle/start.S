/*
* enbale System timer interrupt and PFIC .
* let led blink by using systick interrupt.
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

    /* program start at 0x00, reset_handler is not an exception/interrupt */
    la t0, unified_entry #
    # ori t0, t0, 0x02; # t0 = t0 | 0x02
    csrw  mtvec, t0 # mtvec = t0    MODE1 = 1 has problems. but MODE1=0 is work

    csrr  t1, mtvec # t1 = mtvec

    /* config led */
    jal led_cfg

    /* call systick_cfg */
    jal systick_cfg  # jump to target and save position to ra


    li t0, 0x1880 # t0 = 0x1804
    csrrw  t0, mstatus, t0 # t0 = mstatus, mstatus = x0

    /* 
    * MIE can't set 1 directly, i don't know why 
    * i find mret can move MPIE to MIE.
    * so, have a try.
    * */
    /*
    * before call mret, i need change mepc.
    * */
    la t0, my_main # 
    csrw  mepc, t0 # mepc = t0
    mret


.globl my_main
.type my_main, @function
my_main:
    /* save systick reg new value to ram */
    jal watch_systick_reg  # jump to watch_systick_reg and save position to ra
    csrr  s0, 0x804 # t0 = 0x804    WCH add intsyscr
    csrr  s1, mcause # t0 = mcause
    c.nop
    beq zero, zero, my_main; # if zero == zero then 1b
    








