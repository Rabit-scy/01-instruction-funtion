ENTRY(my_start)

MEMORY
{
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 16K
	RAM (xrw)  : ORIGIN = 0x20000000, LENGTH = 2K
}

SECTIONS
{
    .text : {
		. = ALIGN(4) ;
		*(.text*)
		. = ALIGN(4) ;
	} >FLASH AT>FLASH
	/* >VMA AT>LMA */

	.data : {
		. = ALIGN(4) ;
		*(.data*)
		. = ALIGN(4) ;
	} >RAM AT>FLASH

}