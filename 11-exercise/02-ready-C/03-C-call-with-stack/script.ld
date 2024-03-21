ENTRY(my_start)
__sram_size = 0x700;
__stack_size = 0x100;
MEMORY
{
    /* 16KB LMA*/
    FLASH(rx) : ORIGIN = 0x00000000, LENGTH = 0x4000 
    /* 2KB VMA*/
    SRAM(rw)  : ORIGIN = 0x20000000, LENGTH = __sram_size
    /* 256Bytes VMA-for-stack*/
    STACK(rw) : ORIGIN = 0x20000000+__sram_size, LENGTH = __stack_size
    /* STACK(rw) : ORIGIN = 0x20000700, LENGTH = __stack_size */
}


SECTIONS
{
    .text : {
      . = ALIGN(4) ;
      start.S.o(.text*)
      *(.text*)
      . = ALIGN(4) ;
    } >FLASH AT>FLASH
    
    .rodata :{
      . = ALIGN(4);
      *(.rodata*)
      . = ALIGN(4);
      PROVIDE(_data_section_lma_start = .);
    } >FLASH AT>FLASH

    /*initialized data*/
    .data : {
      PROVIDE(_data_section_vma_start = .);
      *(.data*)
      . = ALIGN(4) ;
      PROVIDE(_data_section_vma_end = .);
    } >SRAM AT>FLASH

    /* uninitialized data*/
    .bss : {
      . = ALIGN(4) ;
      PROVIDE(_bss_data_start = .);
      *(.bss*)
      . = ALIGN(4);
      PROVIDE(_bss_data_end = .);
    } >SRAM AT>FLASH

    .my_stack :{
        . = ALIGN(4);
        PROVIDE(_my_stack_end = .);
        . = . + __stack_size;
        PROVIDE(_my_stack_start = .);
    } >STACK


    .program_size :{
      . = ALIGN(4);
      PROVIDE(_program_size = .);
    } >FLASH AT>FLASH
}