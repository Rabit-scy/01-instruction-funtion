/*
    same to load_data.S
    modular initialize bss data.
    bss data usually are initialized zero.
*/

.text
.globl init_bss
.type init_bss, @function
init_bss:
    # bss data are non-initialized data.
    # but people are usually initialize them as zero.
    la a5, _bss_data_start # 
    la a4, _bss_data_end # 
    beq a4, a5, 2f; # if a4 == a5 then 2f
    
1:
    sw zero, 0(a5) # 
    addi a5, a5, 4; # a5 = a5 + 4
    blt a5, a4, 1b # if a5 < a4 then 1b

2:
    ret
     
    