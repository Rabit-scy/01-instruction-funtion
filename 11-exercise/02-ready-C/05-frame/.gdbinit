set pagination off
set disassemble-next-line on

target extended-remote localhost:3333
display/x $ra
display/x $sp
display/x $gp
display/x $tp
display/x $t0
display/x $t1
display/x $t2
display/x $s0
display/x $s1
display/x $a0
display/x $a1
display/x $a2
display/x $a3
display/x $a4
display/x $a5
display/x {int}0xE000F000
display/x {int}0xE000F004
display/x {int}0xE000F008
display/x {int}0xE000E000
display/x {int}0xE000E020
display/x {int}0xE000E04C
display/x {int}0xE000E300
b my_start
# b unified_entry
monitor reset halt
load
continue