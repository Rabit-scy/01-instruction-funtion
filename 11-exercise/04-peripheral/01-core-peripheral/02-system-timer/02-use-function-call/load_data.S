/*
* when mcu power on, i need to load data from flash to ram every times.
* so i intend to modular load data procedures.
*/

.text
.globl load_data
.type load_data, @function
load_data:
    
    # load data from flash to ram
    # flash data start address is saved in symbol _data_section_lma_start
    # ram data start address is saved in symbol _data_section_vma_start
    # ram data end address is saved in symbol _data_section_end
    # so, data that need to be initialized length is _data_section_end - _data_section_vma_start

    la a5, _data_section_lma_start # 
    la a4, _data_section_vma_start # 
    la a3, _data_section_vma_end # 
    
    /*
        if(a4 == a3)    data length != 0
        {

        }
    */
    beq a4, a3, 2f # if a4 == a3 then 1f
    
1:
    /*
        t0 = int* (a5)[0]
        int* (a4)[0] = t0
    */
    lw t0, 0(a5) #
    sw t0, 0(a4) #
    addi a4, a4, 4; # a4 = a4 + 4
    addi a5, a5, 4; # a5 = a5 + 4
    blt a4, a3, 1b # if a4 < a3 then 1b
2:  
    ret

     
    