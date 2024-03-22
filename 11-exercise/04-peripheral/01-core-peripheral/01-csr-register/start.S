/*
* learn core register (not all), like debug register,i
* won't learn,at least not yet.
*/

/*
* maybe this experiment is not useful, so just for fun.
*/

/*
    speed up!
    i strongly suggest you that use gdb command (eg, p/x {int}0x0xE000E04C) to see peripheral value.
    in order to make you understand what the mcu core status are.
    in next exercise, i will use systick timer. 
*/

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

    /*read some csr register, suppose i don't know what the csr register used for.*/
    csrr  t0, marchid # t0 = marchid
    csrr  t0, mimpid # t0 = mimpid
    csrr  t0, mstatus # t0 = mstatus
    csrr  t0, misa # t0 = misa
    csrr  t0, mtvec # t0 = mtvec
    csrr  t0, mscratch # t0 = mscratch
    csrr  t0, mepc # t0 = mepc
    csrr  t0, mcause # t0 = mcause
    csrr  t0, dcsr # t0 = dcsr
    csrr  t0, dpc # t0 = dpc
    # csrr  t0, dscratch0 # t0 = dscratch0
    # csrr  t0, dscratch1 # t0 = dscratch1
    csrr  t0, 0x804 # t0 = 0x804    WCH add intsyscr

    /*if i change mtvec, what will happen to reset_handle? */
    li t0, 0x400 # t0 = 0x400 = 1KB
    csrw  mtvec, t0 # mtvec = t0    mtvec = 0x22 this directive is not in effect. probably because of 1kb alignment.



    c.nop
    ret


