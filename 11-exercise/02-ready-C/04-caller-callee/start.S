/*
    about caller and callee see <Compilation Principle>,
    at Chapter 7 Run-Time Environment.
    in directory 05-frame i will do some exercises.
*/

/*
* this exercise is help me to understand the relationship between caller and callee.
* subconsciously, i think function call like this:
* the my_caller push register(Caller) to stack
* the my_callee push register(Callee) to stack
* in fact, GNU C generates assembly codes is that:
* the my_caller just mv arguments to a0~a5,instead of push register(Caller) to stack,
* then my_callee push registers(Callee) and arguments(a0~a5) to stack.
* which means arguments is my_caller's Caller register.
*/

/*
    maybe the attribute of caller and callee is not explicitly.optimize level will
    affect this.
*/
.globl my_caller
.type my_caller, @function
my_caller:
    /* call foo */
    /* push caller register to stack */
    sw t0, 0(sp) # 
    sw t1, -4(sp) # 
    sw a0, -8(sp) # 
    sw a1, -12(sp) # 
    sw a2, -16(sp) # 
    sw a3, -20(sp) # 
    sw a4, -24(sp) # 
    sw a5, -28(sp) #

    addi sp, sp, -32; # sp = sp + -32
    
    call foo
    mv  t0, a0 # t0 =a0  save foo return value in t0
    /* pop caller register from stack */
    // ... ... 
    addi sp, sp, 32; # sp = sp + 32
    


.globl my_callee
my_callee:
    /* push callee register to stack */
    sw ra, 0(sp) # 
    sw s0, -4(sp) #
    sw s1, -8(sp) # 
    
    addi sp, sp, -12; # sp = sp + -12
    
    // ... ... 


    /* pop callee register from stack*/
    // ... ...
    addi sp, sp, 12; # sp = sp + 12
    
