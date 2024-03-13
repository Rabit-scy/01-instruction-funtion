/*
    lhu rd, rs1, imm (can't use)
    
    lhu rd, imm(rs1)

    rd = *((unsigned short *)(rs1 + imm))
*/

.globl my_start
my_start:
    li x1, 0 # x1 = 0
    li x2, 0 # x2 = 0
    li x3, 0 # x3 = 0
    li x4, 0 # x4 = 0
    li x5, 0 # x5 = 0
    li x6, 0 # x6 = 0
    li x7, 0 # x7 = 0
    li x8, 0 # x8 = 0
    li x9, 0 # x9 = 0
    li x10, 0 # x10 = 0
    li x11, 0 # x11 = 0
    li x12, 0 # x12 = 0
    li x13, 0 # x13 = 0
    li x14, 0 # x14 = 0
    li x15, 0 # x15 = 0

    # ram's data are irregular before i initial them
    # so i need save data to ram first


    # i can read any address 0~0xffff ffff, except some special register address 
    # eg. core register need special instructions
    # to avoid access unwriteable address, which are usually no use.
    # i tell linker by using script(script.ld).
    # in script, i define ram memory where .data section will use.
    # here i define a symbol my_ram_data in .data section through Assembler Directives(.data)

    # now, get an address from symbol.
    la x1, my_ram_data
    
    # save a data to this address(ram)
    li x2, 0xaabb # x2 = 0xaabb
    
    sh x2, 0(x1) # save two byte where the data in x2 to ram where the address in x1+0
    
    # then, i can read it from ram where the address in x1+0
    # and i'm ready store this one byte to register x3
    lhu x3, 0(x1)   # read it.  x3 = *((unsigned short *)(x1+0))

    # do more 
    li x2, -0x1122 # x2 = 0xffffeede
    sh x2, 2(x1) # *((signed short *)(x1+1)) = x2
    lhu x4, 2(x1) # read it.  x4 = *((unsigned short *)(x1+1)) = eede



    # ..if you want save data to flash.
    # s[b,h,w] are also work.
    # but, flash can't erase data, it need a special way.
    # i will show this code in future, perhaps.
.data
.globl my_ram_data
my_ram_data:
# maybe harmful. because machine don't know size
# linker emmm.
