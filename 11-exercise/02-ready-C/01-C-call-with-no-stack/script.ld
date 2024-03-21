ENTRY(main)

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
    .rodata :{
      . = ALIGN(4);
      *(.rodata*)
      . = ALIGN(4);
    } >FLASH AT>FLASH

    /*
      see 01-load-data code.
    */
    .data_start_in_vma :{
      . = ALIGN(4) ;
      PROVIDE(_data_section_vma_start = .);
    } >SRAM AT>FLASH

    /*
      see 01-load-data code.
    */
    .data_start_in_lma :{
      . = ALIGN(4) ;
      PROVIDE(_data_section_lma_start = .);
    } >FLASH AT>FLASH


    /*initialized data*/
    .data : {
      . = ALIGN(4) ;
      *(.data*)
      . = ALIGN(4) ;
      PROVIDE(_data_section_end = .);
    } >SRAM AT>FLASH
    /* uninitialized data*/
    .bss : {
      . = ALIGN(4) ;
      *(.bss*)
      . = ALIGN(4) ;
    } >SRAM AT>FLASH

}