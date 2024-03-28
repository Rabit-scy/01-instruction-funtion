/*
    firstly, i won't add this asm file,and turn on MIE.
    i just want to know what will happen when there are
    no interrupt vector/ exception handler function.

    ok, i find that nothing happened and the code is running normally.
    but mcause=3. that means the core has an Hardfault execption.

    can't write 0x1804 to mstatus, i don't know why.
    mstatus = 0x1804

    exceptions and interrupts 

*/

.data
.globl systick_count
systick_count:
    .word 0x00

.equiv __STK_SR, 0xE000F004
/*
    I didn't find out how to put the interrupt table at the specified address with assembly code.
    because mtvec requirs 1KB alignment, i can't move interrupt table to another address, or
    linker default assign address
*/
# .section .isr_vector, "ax", @progbits
.section .isr_vector
# .text
.globl unified_entry
.type unified_entry, @function
unified_entry:
    # addi sp, sp, -4*15; # sp = sp + -4*16 15+1
    # sw x1, 4*14(sp) # 
    # sw x2, 4*13(s1) # 
    # sw x3, 4*12(s1) # 
    # sw x4, 4*11(sp) # 
    # sw x5, 4*10(s1) # 
    # sw x6, 4*9(s1) # 
    # sw x7, 4*8(sp) # 
    # sw x8, 4*7(s1) # 
    # sw x9, 4*6(s1) # 
    # sw x10, 4*5(sp) # 
    # sw x11, 4*4(s1) # 
    # sw x12, 4*3(s1) # 
    # sw x13, 4*2(sp) # 
    # sw x14, 4*1(s1) # 
    # sw x15, 4*0(s1) # 
    csrr  t0, mcause # t0 = mcause
    /* bit31 */
    li t1, 0x80000000 # t1 = 0x80000000
    
    and t1, t0, t1 # t1 = t0 & t1
    beq t1, zero, 3f # if t1 == zero then 2f
    bne t1, zero, 4f # if t1 != zero then 4f
    
3:  /* exception */
    # csrr  t0, mcause # t0 = mcause
    li t1, 0x7FFFFFFF # t1 = 0x7FFFFFFF
    and s0, t1, t0; # s0 = t1 & t0  exception number
    li t1, 0xE000E020 # t1 = 0xE000E020
    lw s1, 0(t1) # 
    beq zero, zero, 3b # if zero == zero then 3f
4:  /* interrupt */
    li t1, 0x7FFFFFFF # t1 = 0x7FFFFFFF
    and s0, t1, t0; # s0 = t1 & t0  interrupt number
    li t1, 12 # t1 = 12     System timer interrupt
    bne s0, t1, 5f # if s0 != t1 then 5f
    
    la t0, systick_count #
    lw t1, 0(t0) # 
    addi t1, t1, 1 # t1 = t1 + 1
    sw t1, 0(t0) #

    li t2, 0x8000 # t2 = 0x1000
    and t1, t1, t2; # t1 = t1 & t2
    # andi t1, t1, 0x4000 # t1 = t1 & imm
    beq t1, zero, 1f # if t1 == zero then 1f
    li a0, 0 # a0 = 0   /* turn off */
    beq zero, zero, 2f # if zero == zero then 2f
1:   
    li a0, 1 # a0 = 1   /* turn on */
2:
    /* pass argument, a0=1, let led on*/
    jal led_ctrl  # jump to led_ctrl and save position to ra
    
    /* clear */ 
    li t0, __STK_SR # t0 = __STK_SR
    li t1, 1 # t1 = 1
    sw t1, 0(t0) # 
5:
    mret

