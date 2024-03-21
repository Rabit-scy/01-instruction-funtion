/*
 in order to make my_push more ability.
 like push more than one word once.
*/

.text
.globl my_push
.type my_push, @function
.globl my_pop
.type my_pop, @function
/* a0 is saved data, a1 is saved data len*/
my_push:
    /*
        do{
            if(a1 != 0){
                a1 -= 1;

                sp -= 4;
                *sp = a0[t0];
                a0[t0] += 1;
            }
            else
            {
                break;
            }
        }while(1)
    
    */
    /*uint32_t t0 = 0*/
    mv  t0, zero # t0 = zero
2:  
    /*check a1 is zero or not */
    beq t0, a1, 1f; # if t0 == a1 then 1f

    addi sp, sp, -4; # sp = sp + -4
    lw t1, 0(a0) #
    sw t1, 0(sp) #
    
    addi a0, a0, 4; # a0 = a0 + 4
    addi t0, t0, 1; # t0 = t0 + 1
    
    /* back to my_push */
    beq zero, zero, 2b; # if zero == zero then 2b
    
1:    
    jr ra   # jump to ra

my_pop:
    lw a0, 0(sp) # 
    addi sp, sp, 4; # sp = sp + 4
    jr ra   # jump to ra
    
