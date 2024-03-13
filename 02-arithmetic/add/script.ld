ENTRY(my_start)

MEMORY
{
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 16K
	RAM (xrw)  : ORIGIN = 0x20000000, LENGTH = 2K
}

SECTIONS
{
	/* . = 0x08000000; */
    .text : {
		. = ALIGN(2) ;
		*(.text*)
		. = ALIGN(2) ;
	} >FLASH AT>FLASH
	

	.data : {
		. = ALIGN(4) ;
		*(.data*)
		. = ALIGN(4) ;
	} >RAM AT>FLASH

    .bss :
    {
      . = ALIGN(4);
      *(.bss*)
      . = ALIGN(4);
    } >RAM AT>FLASH
}