


.set __STK_CTRL, 0xE000F000

.equiv __STK_SR, 0xE000F004
/* .equiv equals to follows */
.ifdef __STK_CNTR
.err "__STK_CNTR, 0xE000F008"
.endif
.equ __STK_CNTR, 0xE000F008
/* .equ end */


.set __STK_CMPR, 0xE000F010


.data
.align 4
.globl systick_struct
.type systick_struct, @object
systick_struct:
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0



.text
.globl systick_cfg
.type systick_cfg, @function
systick_cfg:
    addi sp, sp, -4; # sp = sp + -4
    sw ra, 0(sp) # 
    
    /*maybe i should push a4, a5 to stack*/
    li  a5, __STK_CTRL #   a5 =__STK_CTRL 
    lw a4, 0(a5) #
    ori a4, a4, 0x01; # a4 = a4 | 0x01
    sw a4, 0(a5) # start systick

    lw ra, 0(sp) # 
    addi sp, sp, 4; # sp = sp + 4
    /*maybe i should pop a4 a5 form stack*/
    ret
    /*
        systick peripheral config
    */
.globl watch_systick_reg
.type watch_systick_reg, @function
watch_systick_reg:
    /*prologue*/
    addi sp, sp, -8; # sp = sp + imm
    sw s0, 0(sp) # save s0
    sw ra, 4(sp) # save ra
    addi s0, sp, 8; # s0 = sp + 8
    /* main function code   */
    /* 1. push arguments to stack---no argument */
    /* 2. local variable -- no variable */
    /* 3. use global variable */
    la a5, systick_struct # a5 = systick_struct
    li a4, __STK_CTRL
    lw a3, 0(a4) # 
    sw a3, 0(a5) # 
    li a4, __STK_SR
    lw a3, 0(a4) # 
    sw a3, 4(a5) # 
    li a4, __STK_CNTR
    lw a3, 0(a4) # 
    sw a3, 8(a5) # 
    li a4, __STK_CMPR
    lw a3, 0(a4) # 
    sw a3, 12(a5) # 
    /* 4. return value save to a0---no return value */
    /*epilogue*/
    lw s0, 0(sp) # restore s0
    lw ra, 4(sp) # restore ra
    addi sp, sp, 8; # sp = sp + 8   free stack

    ret

