/*
* GPIOD Pin0 link to LED.
* driver it!
*/

/*
    start gpio clock by RCC...
    ok, maybe i need to watch RCC register first.
    so i know the status of SYSCLK, HCLK and PCLK.
*/


/* 
    bug1:take care of ret Pseudo-directives
    when use jal or call, if subroutine also use jal or others 
    i should push ra into stack.
*/

/*
    bug2:.align 4
    if .data section don't use this Pseudo-directives, some symbol
    maybe not align 4 bytes, which will be cause Hardfault exception

*/

/*
    bug3:__GPIOD_BSHR is Write Only
    li a4, __GPIOD_BSHR
    # lhu a3, 0(a4)   set
    # lhu a2, 2(a4)   reset
    above two directive are invalid, and no exception
*/

/*
    __GPIOD_BSHR half word access is invalid, and no exception
    li a4, __GPIOD_BSHR
    li a3, 0x01
    # sh a3, 0(a4)
    # addi a4, a4, 2
    # sh a3, 0(a4)
    above two sh directive are invalid ,and no exception
*/

.equiv __RCC_CTLR, 0x40021000
.equiv __RCC_CFGR0, 0x40021004
.equiv __RCC_INTR, 0x40021008
.equiv __RCC_APB2PRSTR, 0x4002100C
.equiv __RCC_APB1PRSTR, 0x40021010
.equiv __RCC_AHBPCENR, 0x40021014
.equiv __RCC_APB2PCENR, 0x40021018
.equiv __RCC_APB1PCENR, 0x4002101C
.equiv __RCC_RSTSCKR, 0x40021024

.equiv __GPIOD_CFGLR, 0x40011400
.equiv __GPIOD_OUTDR, 0x4001140C
.equiv __GPIOD_BSHR, 0x40011410

.equiv _MODE_OUT_SPEED_2M_PP, 0b0010

.data
.align 4
.global rcc_struct
.type rcc_struct, @object
rcc_struct:
    .word 0x00
    .word 0x00
    .word 0x00
    .word 0x00
    .word 0x00
    .word 0x00
    .word 0x00
    .word 0x00
    .word 0x00


.global gpiod_struct
.type gpiod_struct, @object
gpiod_struct:
    .word 0x00
    .half 0x00
    .half 0x00
    .half 0x00

.text
.hidden watch_rcc_reg
.type watch_rcc_reg, @function
watch_rcc_reg:
    addi sp, sp, -4; # sp = sp + -4
    sw ra, 0(sp) # 
    
    la a5, rcc_struct # 
    
    li a4, __RCC_CTLR # a4 = __RCC_CTLR
    lw a3, 0(a4) # 
    sw a3, 0(a5) # 
    li a4, __RCC_CFGR0 # a4 = __RCC_CFGR0
    lw a3, 0(a4) # 
    sw a3, 4(a5) # 
    li a4, __RCC_INTR # a4 = __RCC_INTR
    lw a3, 0(a4) # 
    sw a3, 8(a5) # 
    li a4, __RCC_APB2PRSTR # a4 = __RCC_APB2PRSTR
    lw a3, 0(a4) # 
    sw a3, 12(a5) # 
    li a4, __RCC_APB1PRSTR # a4 = __RCC_APB1PRSTR
    lw a3, 0(a4) # 
    sw a3, 16(a5) # 
    li a4, __RCC_AHBPCENR # a4 = __RCC_AHBPCENR
    lw a3, 0(a4) # 
    sw a3, 20(a5) # 
    li a4, __RCC_APB2PCENR # a4 = __RCC_APB2PCENR
    lw a3, 0(a4) # 
    sw a3, 24(a5) # 
    li a4, __RCC_APB1PCENR # a4 = __RCC_APB1PCENR
    lw a3, 0(a4) # 
    sw a3, 28(a5) # 
    li a4, __RCC_RSTSCKR # a4 = __RCC_RSTSCKR
    lw a3, 0(a4) # 
    sw a3, 32(a5) # 

    lw ra, 0(sp) # 
    addi sp, sp, 4; # sp = sp + 4
    ret


.local watch_gpiod_reg
.type watch_gpiod_reg, @function
watch_gpiod_reg:
    addi sp, sp, -4; # sp = sp + -4
    sw ra, 0(sp) # 

    la a5, gpiod_struct # 
    
    li a4, __GPIOD_CFGLR # a4 = __GPIOD_CFGLR
    lw a3, 0(a4) # 
    sw a3, 0(a5) #

    li a4, __GPIOD_OUTDR # a4 = __GPIOD_OUTDR
    lhu a3, 0(a4) #
    sh a3, 4(a5)

    li a4, __GPIOD_BSHR # a4 = __GPIOD_BSHR
    lhu a3, 0(a4)
    sh a3, 6(a5)

    lhu a3, 2(a4)
    sh a3, 8(a5)
    lw ra, 0(sp) # 
    addi sp, sp, 4; # sp = sp + 4
    ret

.globl led_cfg
.type led_cfg, @function
led_cfg:
    addi sp, sp, -4; # sp = sp + -4
    sw ra, 0(sp) # 
    /* 1. watch rcc register */
    jal watch_rcc_reg
    /* 2. control rcc register */
    jal led_rcc_cfg
    /* 3. watch rcc register status*/
    jal watch_rcc_reg


    /* 1. watch gpiod register */
    jal watch_gpiod_reg
    /* 2. control gpiod register */
    jal led_gpio_cfg
    /* 3. watch gpiod register status*/
    jal watch_gpiod_reg
    
    /* watch out! i forget push ra to stack*/
    lw ra, 0(sp) # 
    addi sp, sp, 4; # sp = sp + 4
    ret


.globl led_ctrl
.type led_ctrl, @function
led_ctrl:
    /* push , use a0 */
    addi sp, sp, -12; # sp = sp + -12
    sw ra, 8(sp) # 
    sw s0, 4(sp) # 
    addi s0, sp, 12; # s0 = sp + 12
    sw a0, -12(s0)

    lw a5, -12(s0) # 

    li a4, __GPIOD_BSHR # a4 = __GPIOD_BSHR
    # lhu a3, 0(a4)   /*set*/
    # lhu a2, 2(a4)   /*reset*/
    
    /*write 1 effect */
    li a3, 0x01 # a2 = 0x01

    beq a5, zero, 1f; # if a5 == zero then 1f
    
    /* led on */
    slli a3, a3, 1*16  /* pin0 1bit*/
    # addi a4, a4, 0; # a4 = a4 + 0
    /* write register */
    sw a3, 0(a4)

    beq zero, zero, 2f; # if zero == zero then 2f
    
1:
    /*led off*/
    slli a3, a3, 1*0  /* pin0 1bit*/
    # addi a4, a4, 2; # a4 = a4 + 2
    sw a3, 0(a4)
2: 
    /* pop */
    addi sp, s0, -12; # sp = s0 + -12
    sw s0, 4(sp) # 
    sw ra, 8(sp) # 
    addi sp, sp, 12; # sp = sp + 12

    ret


.globl led_gpio_cfg
.type led_gpio_cfg, @function
led_gpio_cfg:
    addi sp, sp, -4; # sp = sp + -4
    sw ra, 0(sp) # 

    li a5, __GPIOD_CFGLR # a5 = __GPIOD_CFGLR
    lw a4, 0(a5) # 

    /* 1.clear pin0 cfgr */
    li a3, 0b1111 # a3 = 0b1111
    slli a3, a3, 0*4    
    not a3, a3
    and a4, a4, a3; # a4 = a4 & a3  clear pin0 cfgr

    /* 2.set pin0 cfgr */
    li a3, _MODE_OUT_SPEED_2M_PP # a3 = _MODE_OUT_SPEED_2M_PP
    slli a3, a3, 0*4  # pin0 = 0*4bit
    /* set pin0 Mode:out Speed:2Mhz Level:PushPull */
    or a4, a3, a4; # a4 = a3 | a4  set pin0 cfgr

    /* 3.write to register */
    sw a4, 0(a5) # write,
    

    li a5, __GPIOD_OUTDR # a5 = __GPIOD_OUTDR
    lw a4, 0(a5) # load __GPIOD_OUTDR value

    /* 1.clear pin0 bit */
    li a3, 0x01 # a3 = 1
    slli a3, a3, 0*1  
    not a3, a3  # 
    and a4, a4, a3; # a4 = a4 & a3    bit0 clear

    /* 2.set pin0=1 bit0=1*/
    li a3, 0x01 # a3 = 1
    slli a3, a3, 0*1
    /* set pin0 level to high */
    or a4, a4, a3; # a4 = a4 | a3
    
    /* 3.write to register */
    sh a4, 0(a5)    # write (16bit access) , led off
    
    lw ra, 0(sp) # 
    addi sp, sp, 4; # sp = sp + 4
    ret


.globl led_rcc_cfg
.type led_rcc_cfg, @function
led_rcc_cfg:
    addi sp, sp, -4; # sp = sp + -4
    sw ra, 0(sp) # 

    li a5, __RCC_APB2PCENR # t0 = __RCC_APB2PCENR
    lw a4, 0(a5) # 

    /* 1.clear Port D enable bit */
    li a3, 0x01 # a3 = 0x01
    slli a3, a3, 5  # bit5
    not a3, a3
    and a4, a3, a4; # a4 = a3 & a4
    
    /* 2.set Port D enable bit=1*/
    li a3, 0x01 # a3 = 0x01
    slli a3, a3, 5  # bit5
    or a4, a4, a3; # a4 = a4 | a3

    /* 3.write register */
    sw a4, 0(a5) # 

    lw ra, 0(sp) # 
    addi sp, sp, 4; # sp = sp + 4
    ret



