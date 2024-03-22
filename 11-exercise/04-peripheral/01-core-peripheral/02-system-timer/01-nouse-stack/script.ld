ENTRY(my_start)
__sram_size = 0x700;
__stack_size = 0x100;
OUTPUT_FORMAT("elf32-littleriscv", "elf32-littleriscv","elf32-littleriscv")
MEMORY
{
    /* 16KB LMA*/
    FLASH(rx) : ORIGIN = 0x00000000, LENGTH = 0x4000 
    /* 2KB VMA*/
    SRAM(rw)  : ORIGIN = 0x20000000, LENGTH = __sram_size
    /* 256Bytes VMA-for-stack, --print-memory-usage option will calculate this in ram, so I split the ram into two parts */
    STACK(rw) : ORIGIN = 0x20000000+__sram_size, LENGTH = __stack_size
    /* STACK(rw) : ORIGIN = 0x20000700, LENGTH = __stack_size */
}

/*
* gcc has its own linker script file without MEMORY.
* in the linker file there are many gnu c extended and implement.
* like startfile which maybe hidden in gcc.
* linker script file describe the structure of the system in some way.
* to support GNU C, some section are in need.
* but now, i'm not already to add them,unless i will use them.
* 
 */
SECTIONS
{
    .text : {
      . = ALIGN(4) ;
      /*two ways to make entry point at 0x00000000, here is one of them.*/
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