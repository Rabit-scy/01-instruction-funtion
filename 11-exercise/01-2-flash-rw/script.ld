ENTRY(my_start)

MEMORY
{
    /* 16KB LMA*/
    /*
      1.FLASH memory address's attribute [r|x] is required, w is optional.
      because linker default behavior.
      i think you'd better delete it, and try to build.
      then, maybe you will get my point.
    */
    /*
      1.this sript is used to test for load .text section
      and .data section into FLASH.
      there is also a side effect that cause code run to unexpect address.
      you maybe need to use gdb force pc point to 0x12.
      because .text section start here.
      you'd better to read .bin and .map that will help you understand why.
      good luck!
      perhaps executing make debug again is work too.
    */
    FLASH(r) : ORIGIN = 0x00000000, LENGTH = 0x4000 
    /* 2KB VMA*/
    SRAM  : ORIGIN = 0x20000000, LENGTH = 0x800
}


SECTIONS
{
  /*
    1.linker has own default behavior, here they are.
    i think when you eat code, you'd better read target.map, 
    and compare with 01-1-ram-rw.
  */
  /*
    2.when you know linker default behavior,
      first, restore this code. make sure they are original
      second, try to uncomment .text section and .data section,
              build and read target.map, target.bin
      
      third, base above work, try to swap > and AT>, and 
      uncomment .data and .text in start.S
      like:
      ************script.ld****************
      .data :{
          ...
        } >FLASH AT>SRAM
      *************start.S*****************
      .data
        ...
      .text
        ...
      
              build and read target.map, target.bin
      finally, compare .map and .bin and see what you find.

      OK, to be honest, i just want you know what's the meaning of LMA and VMA
  */
    /* .text : {
      . = ALIGN(4) ;
      *(.text*)
      . = ALIGN(4) ;
    } >FLASH AT>FLASH */
    
    /* .data : {
      . = ALIGN(4) ;
      *(.data*)
      . = ALIGN(4) ;
      PROVIDE(_data_section_end = .);
    } >SRAM AT>FLASH */


    /* .bss : {
      . = ALIGN(4) ;
      *(.bss*)
      . = ALIGN(4) ;
    } >FLASH */
}