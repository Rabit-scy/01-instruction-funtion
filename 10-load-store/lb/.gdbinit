set pagination off
set disassemble-next-line on

target extended-remote localhost:3333
display/x $x0
display/x $x1
display/x $x2
display/x $x3
display/x $x4
display/x $x5
display/x $x6
display/x $x7
display/x $x8
display/x $x9
display/x $x10
display/x $x11
display/x $x12
display/x $x13
display/x $x14
display/x $x15

b my_start

monitor reset halt
load
continue