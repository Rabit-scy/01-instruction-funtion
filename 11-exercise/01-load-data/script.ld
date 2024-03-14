ENTRY(my_start)

MEMORY
{
    /* 16KB LMA*/
    FLASH : ORIGIN = 0x00000000, LENGTH = 0x4000 
    /* 2KB VMA*/
    SRAM(x)  : ORIGIN = 0x20000000, LENGTH = 0x800
}


SECTIONS
{
    .text : {
      . = ALIGN(4) ;
      *(.text*)
      . = ALIGN(4) ;
    } >FLASH AT>FLASH
    

    /*
      _data_section_vma_start has two funcitons.
      1: .data section start address is saved in FLASH. here is SRAM start address(0x2000 0000)
      2: _data_section_vma_start symbol can be accessed in SRAM
      eg: execute 
        la _data_section_vma_start
        will let
        ra = 0x20000000
     */
     /*
      why?  la instruction will compute symbol's address and load it in ra register
     */
    .data_start_in_vma :{
      . = ALIGN(4) ;
      PROVIDE(_data_section_vma_start = .);
    } >SRAM AT>FLASH

    /*
      _data_section_end has one function.
      1: .data section 
    */
    .data_start_in_lma :{
      . = ALIGN(4) ;
      PROVIDE(_data_section_lma_start = .);
    } >FLASH AT>FLASH
    
    .data : {
      . = ALIGN(4) ;
      *(.data*)
      . = ALIGN(4) ;
      PROVIDE(_data_section_end = .);
    } >SRAM AT>FLASH


    /* .bss : {
      . = ALIGN(4) ;
      *(.bss*)
      . = ALIGN(4) ;
    } >FLASH */
}