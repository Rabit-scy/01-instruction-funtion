
target.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <my_start>:

my_start:
/*
    from now on, i will use abi specific for register name.
*/
    li ra, 0 # x1 = 0
   0:	4081                	li	ra,0
    li sp, 0 # x2 = 0
   2:	4101                	li	sp,0
    li gp, 0 # x3 = 0
   4:	4181                	li	gp,0
    li tp, 0 # x4 = 0
   6:	4201                	li	tp,0
    li t0, 0 # x5 = 0
   8:	4281                	li	t0,0
    li t1, 0 # x6 = 0
   a:	4301                	li	t1,0
    li t2, 0 # x7 = 0
   c:	4381                	li	t2,0
    li s0, 0 # x8 = 0  s0/fp := x8
   e:	4401                	li	s0,0
    li s1, 0 # x9 = 0
  10:	4481                	li	s1,0
    li a0, 0 # x10 = 0
  12:	4501                	li	a0,0
    li a1, 0 # x11 = 0
  14:	4581                	li	a1,0
    li a2, 0 # x12 = 0
  16:	4601                	li	a2,0
    li a3, 0 # x13 = 0
  18:	4681                	li	a3,0
    li a4, 0 # x14 = 0
  1a:	4701                	li	a4,0
    li a5, 0 # x15 = 0
  1c:	4781                	li	a5,0

    # initialize stack point
    la sp, _my_stack_start # sp = _my_stack_start
  1e:	20000117          	auipc	sp,0x20000
  22:	7e210113          	addi	sp,sp,2018 # 20000800 <_my_stack_start>
    
    # load data from flash to sram
    call load_data  # load data from flash to sram
  26:	2861                	jal	be <load_data>
    jal init_bss  # jump to init_bss and save position to ra
  28:	076000ef          	jal	ra,9e <init_bss>
    j main  # jump to main
  2c:	0500006f          	j	7c <main>
    

    nop
  30:	0001                	nop

00000032 <fibonacci>:


int fibonacci(int n) {
  32:	1121                	addi	sp,sp,-24
  34:	ca06                	sw	ra,20(sp)
  36:	c822                	sw	s0,16(sp)
  38:	0820                	addi	s0,sp,24
  3a:	fea42423          	sw	a0,-24(s0)
  int t, s;
  if (n < 2) {
  3e:	fe842703          	lw	a4,-24(s0)
  42:	4785                	li	a5,1
  44:	00e7c463          	blt	a5,a4,4c <fibonacci+0x1a>
    return 1;
  48:	4785                	li	a5,1
  4a:	a025                	j	72 <fibonacci+0x40>
  }
  s = fibonacci(n - 1);
  4c:	fe842783          	lw	a5,-24(s0)
  50:	17fd                	addi	a5,a5,-1
  52:	853e                	mv	a0,a5
  54:	3ff9                	jal	32 <fibonacci>
  56:	fea42823          	sw	a0,-16(s0)
  t = fibonacci(n - 2);
  5a:	fe842783          	lw	a5,-24(s0)
  5e:	17f9                	addi	a5,a5,-2
  60:	853e                	mv	a0,a5
  62:	3fc1                	jal	32 <fibonacci>
  64:	fea42623          	sw	a0,-20(s0)
  return s + t;
  68:	ff042703          	lw	a4,-16(s0)
  6c:	fec42783          	lw	a5,-20(s0)
  70:	97ba                	add	a5,a5,a4
}
  72:	853e                	mv	a0,a5
  74:	40d2                	lw	ra,20(sp)
  76:	4442                	lw	s0,16(sp)
  78:	0161                	addi	sp,sp,24
  7a:	8082                	ret

0000007c <main>:
int main(void) {
  7c:	1141                	addi	sp,sp,-16
  7e:	c606                	sw	ra,12(sp)
  80:	c422                	sw	s0,8(sp)
  82:	0800                	addi	s0,sp,16
  // int n = 10;
  int result = 0;
  84:	fe042823          	sw	zero,-16(s0)

  result = fibonacci(10);
  88:	4529                	li	a0,10
  8a:	3765                	jal	32 <fibonacci>
  8c:	fea42823          	sw	a0,-16(s0)

  return result;
  90:	ff042783          	lw	a5,-16(s0)
  94:	853e                	mv	a0,a5
  96:	40b2                	lw	ra,12(sp)
  98:	4422                	lw	s0,8(sp)
  9a:	0141                	addi	sp,sp,16
  9c:	8082                	ret

0000009e <init_bss>:
.globl init_bss
.type init_bss, @function
init_bss:
    # bss data are non-initialized data.
    # but people are usually initialize them as zero.
    la a5, _bss_data_start # 
  9e:	20000797          	auipc	a5,0x20000
  a2:	f6278793          	addi	a5,a5,-158 # 20000000 <_data_section_vma_end>
    la a4, _bss_data_end # 
  a6:	20000717          	auipc	a4,0x20000
  aa:	f5a70713          	addi	a4,a4,-166 # 20000000 <_data_section_vma_end>
    beq a4, a5, 2f; # if a4 == a5 then 2f
  ae:	00f70763          	beq	a4,a5,bc <init_bss+0x1e>
    
1:
    sw zero, 0(a5) # 
  b2:	0007a023          	sw	zero,0(a5)
    addi a5, a5, 4; # a5 = a5 + 4
  b6:	0791                	addi	a5,a5,4
    blt a5, a4, 1b # if a5 < a4 then 1b
  b8:	fee7cde3          	blt	a5,a4,b2 <init_bss+0x14>

2:
    ret
  bc:	8082                	ret

000000be <load_data>:
    # flash data start address is saved in symbol _data_section_lma_start
    # ram data start address is saved in symbol _data_section_vma_start
    # ram data end address is saved in symbol _data_section_end
    # so, data that need to be initialized length is _data_section_end - _data_section_vma_start

    la a5, _data_section_lma_start # 
  be:	0e800793          	li	a5,232
    la a4, _data_section_vma_start # 
  c2:	20000717          	auipc	a4,0x20000
  c6:	f3e70713          	addi	a4,a4,-194 # 20000000 <_data_section_vma_end>
    la a3, _data_section_vma_end # 
  ca:	20000697          	auipc	a3,0x20000
  ce:	f3668693          	addi	a3,a3,-202 # 20000000 <_data_section_vma_end>
        if(a4 == a3)    data length != 0
        {

        }
    */
    beq a4, a3, 2f # if a4 == a3 then 1f
  d2:	00d70a63          	beq	a4,a3,e6 <load_data+0x28>
1:
    /*
        t0 = int* (a5)[0]
        int* (a4)[0] = t0
    */
    lw t0, 0(a5) #
  d6:	0007a283          	lw	t0,0(a5)
    sw t0, 0(a4) #
  da:	00572023          	sw	t0,0(a4)
    addi a4, a4, 4; # a4 = a4 + 4
  de:	0711                	addi	a4,a4,4
    addi a5, a5, 4; # a5 = a5 + 4
  e0:	0791                	addi	a5,a5,4
    blt a4, a3, 1b # if a4 < a3 then 1b
  e2:	fed74ae3          	blt	a4,a3,d6 <load_data+0x18>
2:  
    ret
  e6:	8082                	ret

Disassembly of section .my_stack:

20000700 <_my_stack_start-0x100>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
    li ra, 0 # x1 = 0
   0:	0091                	addi	ra,ra,4
    li sp, 0 # x2 = 0
   2:	0000                	unimp
    li gp, 0 # x3 = 0
   4:	0004                	0x4
    li tp, 0 # x4 = 0
   6:	0000                	unimp
    li t0, 0 # x5 = 0
   8:	0000                	unimp
    li t1, 0 # x6 = 0
   a:	0104                	addi	s1,sp,128
    li t2, 0 # x7 = 0
   c:	0070                	addi	a2,sp,12
    li s0, 0 # x8 = 0  s0/fp := x8
   e:	0000                	unimp
    li s1, 0 # x9 = 0
  10:	690c                	flw	fa1,16(a0)
	...
    la sp, _my_stack_start # sp = _my_stack_start
  22:	0000                	unimp
  24:	0200                	addi	s0,sp,256
    call load_data  # load data from flash to sram
  26:	0105                	addi	sp,sp,1
    jal init_bss  # jump to init_bss and save position to ra
  28:	0000                	unimp
  2a:	0c01                	addi	s8,s8,0
    j main  # jump to main
  2c:	4f05                	li	t5,1
  2e:	0000                	unimp
    nop
  30:	7c00                	flw	fs0,56(s0)
int fibonacci(int n) {
  32:	0000                	unimp
  34:	2200                	fld	fs0,0(a2)
  36:	0000                	unimp
  38:	0100                	addi	s0,sp,128
  3a:	4f9c                	lw	a5,24(a5)
  3c:	0000                	unimp
  if (n < 2) {
  3e:	0300                	addi	s0,sp,384
  40:	0062                	c.slli	zero,0x18
  42:	0000                	unimp
  44:	0e01                	addi	t3,t3,0
  46:	00004f07          	flq	ft10,0(zero) # 0 <my_start>
    return 1;
  4a:	0200                	addi	s0,sp,256
  s = fibonacci(n - 1);
  4c:	7091                	lui	ra,0xfffe4
  4e:	0400                	addi	s0,sp,512
  50:	0504                	addi	s1,sp,640
  52:	6e69                	lui	t3,0x1a
  54:	0074                	addi	a3,sp,12
  56:	5805                	li	a6,-31
  58:	0000                	unimp
  t = fibonacci(n - 2);
  5a:	0100                	addi	s0,sp,128
  5c:	004f0503          	lb	a0,4(t5)
  60:	0000                	unimp
  62:	0032                	c.slli	zero,0xc
  64:	0000                	unimp
  66:	004a                	c.slli	zero,0x12
  return s + t;
  68:	0000                	unimp
  6a:	9c01                	0x9c01
  6c:	6e06                	flw	ft8,64(sp)
  6e:	0100                	addi	s0,sp,128
  70:	004f1303          	lh	t1,4(t5)
}
  74:	0000                	unimp
  76:	9102                	jalr	sp
  78:	0768                	addi	a0,sp,908
  7a:	0074                	addi	a3,sp,12
int main(void) {
  7c:	0401                	addi	s0,s0,0
  7e:	00004f07          	flq	ft10,0(zero) # 0 <my_start>
  82:	0200                	addi	s0,sp,256
  int result = 0;
  84:	6c91                	lui	s9,0x4
  86:	01007307          	0x1007307
  result = fibonacci(10);
  8a:	0a04                	addi	s1,sp,272
  8c:	0000004f          	fnmadd.s	ft0,ft0,ft0,ft0,rne
  return result;
  90:	9102                	jalr	sp
  92:	0070                	addi	a2,sp,12
  94:	2200                	fld	fs0,0(a2)
  96:	0000                	unimp
  98:	0200                	addi	s0,sp,256
  9a:	8c00                	0x8c00
  9c:	0000                	unimp
    la a5, _bss_data_start # 
  9e:	0400                	addi	s0,sp,512
  a0:	9701                	srai	a4,a4,0x20
  a2:	0000                	unimp
  a4:	9e00                	0x9e00
    la a4, _bss_data_end # 
  a6:	0000                	unimp
  a8:	be00                	fsd	fs0,56(a2)
  aa:	0000                	unimp
  ac:	0a00                	addi	s0,sp,272
    beq a4, a5, 2f; # if a4 == a5 then 2f
  ae:	0001                	nop
  b0:	0000                	unimp
    sw zero, 0(a5) # 
  b2:	0000                	unimp
  b4:	1500                	addi	s0,sp,672
    addi a5, a5, 4; # a5 = a5 + 4
  b6:	0001                	nop
    blt a5, a4, 1b # if a5 < a4 then 1b
  b8:	0100                	addi	s0,sp,128
  ba:	2280                	fld	fs0,0(a3)
    ret
  bc:	0000                	unimp
    la a5, _data_section_lma_start # 
  be:	0200                	addi	s0,sp,256
  c0:	a000                	fsd	fs0,0(s0)
    la a4, _data_section_vma_start # 
  c2:	0000                	unimp
  c4:	0400                	addi	s0,sp,512
  c6:	f601                	bnez	a2,ffffffce <_my_stack_start+0xdffff7ce>
  c8:	0000                	unimp
    la a3, _data_section_vma_end # 
  ca:	be00                	fsd	fs0,56(a2)
  cc:	0000                	unimp
  ce:	e800                	fsw	fs0,16(s0)
  d0:	0000                	unimp
    beq a4, a3, 2f # if a4 == a3 then 1f
  d2:	2100                	fld	fs0,0(a0)
  d4:	0001                	nop
    lw t0, 0(a5) #
  d6:	0000                	unimp
  d8:	0000                	unimp
    sw t0, 0(a4) #
  da:	1500                	addi	s0,sp,672
  dc:	0001                	nop
    addi a4, a4, 4; # a4 = a4 + 4
  de:	0100                	addi	s0,sp,128
    addi a5, a5, 4; # a5 = a5 + 4
  e0:	2280                	fld	fs0,0(a3)
    blt a4, a3, 1b # if a4 < a3 then 1b
  e2:	0000                	unimp
  e4:	0200                	addi	s0,sp,256
    ret
  e6:	b400                	fsd	fs0,40(s0)
  e8:	0000                	unimp
  ea:	0400                	addi	s0,sp,512
  ec:	6801                	0x6801
  ee:	0001                	nop
  f0:	0000                	unimp
  f2:	0000                	unimp
  f4:	3200                	fld	fs0,32(a2)
  f6:	0000                	unimp
  f8:	2d00                	fld	fs0,24(a0)
  fa:	0001                	nop
  fc:	0000                	unimp
  fe:	0000                	unimp
 100:	1500                	addi	s0,sp,672
 102:	0001                	nop
 104:	0100                	addi	s0,sp,128
 106:	80              	Address 0x0000000000000106 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
    li ra, 0 # x1 = 0
   0:	1101                	addi	sp,sp,-32
    li sp, 0 # x2 = 0
   2:	2501                	jal	602 <__stack_size+0x502>
    li gp, 0 # x3 = 0
   4:	130e                	slli	t1,t1,0x23
    li tp, 0 # x4 = 0
   6:	1b0e030b          	0x1b0e030b
    li t1, 0 # x6 = 0
   a:	550e                	lw	a0,224(sp)
    li t2, 0 # x7 = 0
   c:	10011117          	auipc	sp,0x10011
    li s1, 0 # x9 = 0
  10:	02000017          	auipc	zero,0x2000
    li a1, 0 # x11 = 0
  14:	012e                	slli	sp,sp,0xb
    li a2, 0 # x12 = 0
  16:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
    la sp, _my_stack_start # sp = _my_stack_start
  1e:	0b39                	addi	s6,s6,14
  20:	13491927          	0x13491927
  24:	0111                	addi	sp,sp,4
    call load_data  # load data from flash to sram
  26:	0612                	slli	a2,a2,0x4
    jal init_bss  # jump to init_bss and save position to ra
  28:	1840                	addi	s0,sp,52
  2a:	4296                	lw	t0,68(sp)
    j main  # jump to main
  2c:	0119                	addi	sp,sp,6
  2e:	03000013          	li	zero,48
int fibonacci(int n) {
  32:	0034                	addi	a3,sp,8
  34:	0b3a0e03          	lb	t3,179(s4)
  38:	0b390b3b          	0xb390b3b
  3c:	1349                	addi	t1,t1,-14
  if (n < 2) {
  3e:	1802                	slli	a6,a6,0x20
  40:	0000                	unimp
  42:	2404                	fld	fs1,8(s0)
  44:	0b00                	addi	s0,sp,400
  46:	030b3e0b          	0x30b3e0b
    return 1;
  4a:	0008                	0x8
  s = fibonacci(n - 1);
  4c:	0500                	addi	s0,sp,640
  4e:	012e                	slli	sp,sp,0xb
  50:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
  58:	0b39                	addi	s6,s6,14
  t = fibonacci(n - 2);
  5a:	13491927          	0x13491927
  5e:	0111                	addi	sp,sp,4
  60:	0612                	slli	a2,a2,0x4
  62:	1840                	addi	s0,sp,52
  64:	4296                	lw	t0,68(sp)
  66:	0019                	c.nop	6
  return s + t;
  68:	0600                	addi	s0,sp,768
  6a:	0005                	c.nop	1
  6c:	0b3a0803          	lb	a6,179(s4)
  70:	0b390b3b          	0xb390b3b
}
  74:	1349                	addi	t1,t1,-14
  76:	1802                	slli	a6,a6,0x20
  78:	0000                	unimp
  7a:	03003407          	fld	fs0,48(zero) # 30 <my_start+0x30>
int main(void) {
  7e:	3a08                	fld	fa0,48(a2)
  80:	390b3b0b          	0x390b3b0b
  int result = 0;
  84:	0213490b          	0x213490b
  result = fibonacci(10);
  88:	0018                	0x18
  8a:	0000                	unimp
  8c:	1101                	addi	sp,sp,-32
  8e:	1000                	addi	s0,sp,32
  return result;
  90:	1106                	slli	sp,sp,0x21
  92:	1201                	addi	tp,tp,-32
  94:	0301                	addi	t1,t1,0
  96:	1b0e                	slli	s6,s6,0x23
  98:	250e                	fld	fa0,192(sp)
  9a:	130e                	slli	t1,t1,0x23
  9c:	0005                	c.nop	1
    la a5, _bss_data_start # 
  9e:	0000                	unimp
  a0:	1101                	addi	sp,sp,-32
  a2:	1000                	addi	s0,sp,32
  a4:	1106                	slli	sp,sp,0x21
    la a4, _bss_data_end # 
  a6:	1201                	addi	tp,tp,-32
  a8:	0301                	addi	t1,t1,0
  aa:	1b0e                	slli	s6,s6,0x23
  ac:	250e                	fld	fa0,192(sp)
    beq a4, a5, 2f; # if a4 == a5 then 2f
  ae:	130e                	slli	t1,t1,0x23
  b0:	0005                	c.nop	1
    sw zero, 0(a5) # 
  b2:	0000                	unimp
  b4:	1101                	addi	sp,sp,-32
    addi a5, a5, 4; # a5 = a5 + 4
  b6:	1000                	addi	s0,sp,32
    blt a5, a4, 1b # if a5 < a4 then 1b
  b8:	1106                	slli	sp,sp,0x21
  ba:	1201                	addi	tp,tp,-32
    ret
  bc:	0301                	addi	t1,t1,0
    la a5, _data_section_lma_start # 
  be:	1b0e                	slli	s6,s6,0x23
  c0:	250e                	fld	fa0,192(sp)
    la a4, _data_section_vma_start # 
  c2:	130e                	slli	t1,t1,0x23
  c4:	0005                	c.nop	1
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
    li ra, 0 # x1 = 0
   0:	0024                	addi	s1,sp,8
    li sp, 0 # x2 = 0
   2:	0000                	unimp
    li gp, 0 # x3 = 0
   4:	0002                	c.slli64	zero
    li tp, 0 # x4 = 0
   6:	0000                	unimp
    li t0, 0 # x5 = 0
   8:	0000                	unimp
    li t1, 0 # x6 = 0
   a:	0004                	0x4
    li t2, 0 # x7 = 0
   c:	0000                	unimp
    li s0, 0 # x8 = 0  s0/fp := x8
   e:	0000                	unimp
    li s1, 0 # x9 = 0
  10:	0032                	c.slli	zero,0xc
    li a0, 0 # x10 = 0
  12:	0000                	unimp
    li a1, 0 # x11 = 0
  14:	004a                	c.slli	zero,0x12
    li a2, 0 # x12 = 0
  16:	0000                	unimp
    li a3, 0 # x13 = 0
  18:	007c                	addi	a5,sp,12
    li a4, 0 # x14 = 0
  1a:	0000                	unimp
    li a5, 0 # x15 = 0
  1c:	0022                	c.slli	zero,0x8
	...
    call load_data  # load data from flash to sram
  26:	0000                	unimp
    jal init_bss  # jump to init_bss and save position to ra
  28:	001c                	0x1c
  2a:	0000                	unimp
    j main  # jump to main
  2c:	0002                	c.slli64	zero
  2e:	0095                	addi	ra,ra,5
    nop
  30:	0000                	unimp
int fibonacci(int n) {
  32:	0004                	0x4
  34:	0000                	unimp
  36:	0000                	unimp
  38:	009e                	slli	ra,ra,0x7
  3a:	0000                	unimp
  3c:	0020                	addi	s0,sp,8
	...
  if (n < 2) {
  46:	0000                	unimp
    return 1;
  48:	001c                	0x1c
  4a:	0000                	unimp
  s = fibonacci(n - 1);
  4c:	0002                	c.slli64	zero
  4e:	000000bb          	0xbb
  52:	0004                	0x4
  54:	0000                	unimp
  56:	0000                	unimp
  58:	00be                	slli	ra,ra,0xf
  t = fibonacci(n - 2);
  5a:	0000                	unimp
  5c:	002a                	c.slli	zero,0xa
	...
  66:	0000                	unimp
  return s + t;
  68:	001c                	0x1c
  6a:	0000                	unimp
  6c:	0002                	c.slli64	zero
  6e:	00e1                	addi	ra,ra,24
  70:	0000                	unimp
}
  72:	0004                	0x4
	...
int main(void) {
  7c:	0032                	c.slli	zero,0xc
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
    li ra, 0 # x1 = 0
   0:	0032                	c.slli	zero,0xc
    li sp, 0 # x2 = 0
   2:	0000                	unimp
    li gp, 0 # x3 = 0
   4:	007c                	addi	a5,sp,12
    li tp, 0 # x4 = 0
   6:	0000                	unimp
    li t0, 0 # x5 = 0
   8:	007c                	addi	a5,sp,12
    li t1, 0 # x6 = 0
   a:	0000                	unimp
    li t2, 0 # x7 = 0
   c:	009e                	slli	ra,ra,0x7
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
    li ra, 0 # x1 = 0
   0:	00000093          	li	ra,0
    li gp, 0 # x3 = 0
   4:	001d0003          	lb	zero,1(s10)
    li t0, 0 # x5 = 0
   8:	0000                	unimp
    li t1, 0 # x6 = 0
   a:	0101                	addi	sp,sp,0
    li t2, 0 # x7 = 0
   c:	000d0efb          	0xd0efb
    li s1, 0 # x9 = 0
  10:	0101                	addi	sp,sp,0
    li a0, 0 # x10 = 0
  12:	0101                	addi	sp,sp,0
    li a1, 0 # x11 = 0
  14:	0000                	unimp
    li a2, 0 # x12 = 0
  16:	0100                	addi	s0,sp,128
    li a3, 0 # x13 = 0
  18:	0000                	unimp
    li a4, 0 # x14 = 0
  1a:	0001                	nop
    li a5, 0 # x15 = 0
  1c:	616d                	addi	sp,sp,240
    la sp, _my_stack_start # sp = _my_stack_start
  1e:	6e69                	lui	t3,0x1a
  20:	632e                	flw	ft6,200(sp)
  22:	0000                	unimp
  24:	0000                	unimp
    call load_data  # load data from flash to sram
  26:	0500                	addi	s0,sp,640
    jal init_bss  # jump to init_bss and save position to ra
  28:	0016                	c.slli	zero,0x5
  2a:	0205                	addi	tp,tp,1
    j main  # jump to main
  2c:	0032                	c.slli	zero,0xc
  2e:	0000                	unimp
    nop
  30:	0514                	addi	a3,sp,640
int fibonacci(int n) {
  32:	0306                	slli	t1,t1,0x1
  34:	0902                	c.slli64	s2
  36:	000c                	0xc
  38:	0501                	addi	a0,a0,0
  3a:	030c                	addi	a1,sp,384
  3c:	0901                	addi	s2,s2,0
  if (n < 2) {
  3e:	000a                	c.slli	zero,0x2
  40:	0501                	addi	a0,a0,0
  42:	09020307          	0x9020307
  46:	0004                	0x4
    return 1;
  48:	0301                	addi	t1,t1,0
  4a:	0901                	addi	s2,s2,0
  s = fibonacci(n - 1);
  4c:	000e                	c.slli	zero,0x3
  4e:	0501                	addi	a0,a0,0
  50:	030c                	addi	a1,sp,384
  52:	0901                	addi	s2,s2,0
  54:	000e                	c.slli	zero,0x3
  56:	0501                	addi	a0,a0,0
  58:	0301                	addi	t1,t1,0
  t = fibonacci(n - 2);
  5a:	0901                	addi	s2,s2,0
  5c:	000a                	c.slli	zero,0x2
  5e:	0901                	addi	s2,s2,0
  60:	000a                	c.slli	zero,0x2
  62:	0100                	addi	s0,sp,128
  64:	0501                	addi	a0,a0,0
  66:	0010                	0x10
  return s + t;
  68:	0205                	addi	tp,tp,1
  6a:	007c                	addi	a5,sp,12
  6c:	0000                	unimp
  6e:	05010b03          	lb	s6,80(sp) # 1001105c <__sram_size+0x1001095c>
}
  72:	09020307          	0x9020307
  76:	0008                	0x8
  78:	0501                	addi	a0,a0,0
  7a:	030c                	addi	a1,sp,384
int main(void) {
  7c:	0902                	c.slli64	s2
  7e:	0004                	0x4
  80:	0501                	addi	a0,a0,0
  82:	030a                	slli	t1,t1,0x2
  int result = 0;
  84:	0902                	c.slli64	s2
  86:	0008                	0x8
  result = fibonacci(10);
  88:	0501                	addi	a0,a0,0
  8a:	0301                	addi	t1,t1,0
  8c:	0901                	addi	s2,s2,0
  8e:	0004                	0x4
  return result;
  90:	0901                	addi	s2,s2,0
  92:	000a                	c.slli	zero,0x2
  94:	0100                	addi	s0,sp,128
  96:	5b01                	li	s6,-32
  98:	0000                	unimp
  9a:	0300                	addi	s0,sp,384
  9c:	2100                	fld	fs0,0(a0)
    la a5, _bss_data_start # 
  9e:	0000                	unimp
  a0:	0100                	addi	s0,sp,128
  a2:	fb01                	bnez	a4,ffffffb2 <_my_stack_start+0xdffff7b2>
  a4:	0d0e                	slli	s10,s10,0x3
    la a4, _bss_data_end # 
  a6:	0100                	addi	s0,sp,128
  a8:	0101                	addi	sp,sp,0
  aa:	0001                	nop
  ac:	0000                	unimp
    beq a4, a5, 2f; # if a4 == a5 then 2f
  ae:	0001                	nop
  b0:	0100                	addi	s0,sp,128
    sw zero, 0(a5) # 
  b2:	6900                	flw	fs0,16(a0)
  b4:	696e                	flw	fs2,216(sp)
    addi a5, a5, 4; # a5 = a5 + 4
  b6:	5f74                	lw	a3,124(a4)
    blt a5, a4, 1b # if a5 < a4 then 1b
  b8:	7362                	flw	ft6,56(sp)
  ba:	00532e73          	csrrs	t3,utvec,t1
    la a5, _data_section_lma_start # 
  be:	0000                	unimp
  c0:	0000                	unimp
    la a4, _data_section_vma_start # 
  c2:	0500                	addi	s0,sp,640
  c4:	9e02                	jalr	t3
  c6:	0000                	unimp
  c8:	0300                	addi	s0,sp,384
    la a3, _data_section_vma_end # 
  ca:	010c                	addi	a1,sp,128
  cc:	08090103          	lb	sp,128(s2)
  d0:	0100                	addi	s0,sp,128
    beq a4, a3, 2f # if a4 == a3 then 1f
  d2:	08090103          	lb	sp,128(s2)
    lw t0, 0(a5) #
  d6:	0100                	addi	s0,sp,128
  d8:	04090303          	lb	t1,64(s2)
    sw t0, 0(a4) #
  dc:	0100                	addi	s0,sp,128
    addi a4, a4, 4; # a4 = a4 + 4
  de:	04090103          	lb	sp,64(s2)
    blt a4, a3, 1b # if a4 < a3 then 1b
  e2:	0100                	addi	s0,sp,128
  e4:	02090103          	lb	sp,32(s2)
  e8:	0100                	addi	s0,sp,128
  ea:	04090303          	lb	t1,64(s2)
  ee:	0100                	addi	s0,sp,128
  f0:	0209                	addi	tp,tp,2
  f2:	0000                	unimp
  f4:	0101                	addi	sp,sp,0
  f6:	006e                	c.slli	zero,0x1b
  f8:	0000                	unimp
  fa:	00220003          	lb	zero,2(tp) # 2 <my_start+0x2>
  fe:	0000                	unimp
 100:	0101                	addi	sp,sp,0
 102:	000d0efb          	0xd0efb
 106:	0101                	addi	sp,sp,0
 108:	0101                	addi	sp,sp,0
 10a:	0000                	unimp
 10c:	0100                	addi	s0,sp,128
 10e:	0000                	unimp
 110:	0001                	nop
 112:	6f6c                	flw	fa1,92(a4)
 114:	6461                	lui	s0,0x18
 116:	645f 7461 2e61      	0x2e617461645f
 11c:	00000053          	fadd.s	ft0,ft0,ft0,rne
 120:	0000                	unimp
 122:	0500                	addi	s0,sp,640
 124:	be02                	fsd	ft0,312(sp)
 126:	0000                	unimp
 128:	0300                	addi	s0,sp,384
 12a:	0110                	addi	a2,sp,128
 12c:	04090103          	lb	sp,64(s2)
 130:	0100                	addi	s0,sp,128
 132:	08090103          	lb	sp,128(s2)
 136:	0100                	addi	s0,sp,128
 138:	08090803          	lb	a6,128(s2)
 13c:	0100                	addi	s0,sp,128
 13e:	04090703          	lb	a4,64(s2)
 142:	0100                	addi	s0,sp,128
 144:	04090103          	lb	sp,64(s2)
 148:	0100                	addi	s0,sp,128
 14a:	04090103          	lb	sp,64(s2)
 14e:	0100                	addi	s0,sp,128
 150:	02090103          	lb	sp,32(s2)
 154:	0100                	addi	s0,sp,128
 156:	02090103          	lb	sp,32(s2)
 15a:	0100                	addi	s0,sp,128
 15c:	04090203          	lb	tp,64(s2)
 160:	0100                	addi	s0,sp,128
 162:	0209                	addi	tp,tp,2
 164:	0000                	unimp
 166:	0101                	addi	sp,sp,0
 168:	00a6                	slli	ra,ra,0x9
 16a:	0000                	unimp
 16c:	001e0003          	lb	zero,1(t3) # 1a001 <__sram_size+0x19901>
 170:	0000                	unimp
 172:	0101                	addi	sp,sp,0
 174:	000d0efb          	0xd0efb
 178:	0101                	addi	sp,sp,0
 17a:	0101                	addi	sp,sp,0
 17c:	0000                	unimp
 17e:	0100                	addi	s0,sp,128
 180:	0000                	unimp
 182:	0001                	nop
 184:	72617473          	csrrci	s0,0x726,2
 188:	2e74                	fld	fa3,216(a2)
 18a:	00000053          	fadd.s	ft0,ft0,ft0,rne
 18e:	0000                	unimp
 190:	0500                	addi	s0,sp,640
 192:	0002                	c.slli64	zero
 194:	0000                	unimp
 196:	0300                	addi	s0,sp,384
 198:	0110                	addi	a2,sp,128
 19a:	02090103          	lb	sp,32(s2)
 19e:	0100                	addi	s0,sp,128
 1a0:	02090103          	lb	sp,32(s2)
 1a4:	0100                	addi	s0,sp,128
 1a6:	02090103          	lb	sp,32(s2)
 1aa:	0100                	addi	s0,sp,128
 1ac:	02090103          	lb	sp,32(s2)
 1b0:	0100                	addi	s0,sp,128
 1b2:	02090103          	lb	sp,32(s2)
 1b6:	0100                	addi	s0,sp,128
 1b8:	02090103          	lb	sp,32(s2)
 1bc:	0100                	addi	s0,sp,128
 1be:	02090103          	lb	sp,32(s2)
 1c2:	0100                	addi	s0,sp,128
 1c4:	02090103          	lb	sp,32(s2)
 1c8:	0100                	addi	s0,sp,128
 1ca:	02090103          	lb	sp,32(s2)
 1ce:	0100                	addi	s0,sp,128
 1d0:	02090103          	lb	sp,32(s2)
 1d4:	0100                	addi	s0,sp,128
 1d6:	02090103          	lb	sp,32(s2)
 1da:	0100                	addi	s0,sp,128
 1dc:	02090103          	lb	sp,32(s2)
 1e0:	0100                	addi	s0,sp,128
 1e2:	02090103          	lb	sp,32(s2)
 1e6:	0100                	addi	s0,sp,128
 1e8:	02090103          	lb	sp,32(s2)
 1ec:	0100                	addi	s0,sp,128
 1ee:	02090303          	lb	t1,32(s2)
 1f2:	0100                	addi	s0,sp,128
 1f4:	08090303          	lb	t1,128(s2)
 1f8:	0100                	addi	s0,sp,128
 1fa:	02090103          	lb	sp,32(s2)
 1fe:	0100                	addi	s0,sp,128
 200:	04090103          	lb	sp,64(s2)
 204:	0100                	addi	s0,sp,128
 206:	04090303          	lb	t1,64(s2)
 20a:	0100                	addi	s0,sp,128
 20c:	0209                	addi	tp,tp,2
 20e:	0000                	unimp
 210:	0101                	addi	sp,sp,0

Disassembly of section .debug_str:

00000000 <.debug_str>:
    li ra, 0 # x1 = 0
   0:	6d6f682f          	0x6d6f682f
    li gp, 0 # x3 = 0
   4:	2f65                	jal	7bc <__sram_size+0xbc>
    li tp, 0 # x4 = 0
   6:	6272                	flw	ft4,28(sp)
    li t0, 0 # x5 = 0
   8:	2f74                	fld	fa3,216(a4)
    li t1, 0 # x6 = 0
   a:	6168                	flw	fa0,68(a0)
    li t2, 0 # x7 = 0
   c:	7070                	flw	fa2,100(s0)
    li s0, 0 # x8 = 0  s0/fp := x8
   e:	7779                	lui	a4,0xffffe
    li s1, 0 # x9 = 0
  10:	2f6b726f          	jal	tp,b7306 <__sram_size+0xb6c06>
    li a1, 0 # x11 = 0
  14:	3530                	fld	fa2,104(a0)
    li a2, 0 # x12 = 0
  16:	722d                	lui	tp,0xfffeb
    li a3, 0 # x13 = 0
  18:	7369                	lui	t1,0xffffa
    li a4, 0 # x14 = 0
  1a:	612d7663          	bgeu	s10,s2,626 <__stack_size+0x526>
    la sp, _my_stack_start # sp = _my_stack_start
  1e:	302f6d73          	csrrsi	s10,medeleg,30
  22:	2d31                	jal	63e <__stack_size+0x53e>
  24:	6e69                	lui	t3,0x1a
    call load_data  # load data from flash to sram
  26:	75727473          	csrrci	s0,0x757,4
    jal init_bss  # jump to init_bss and save position to ra
  2a:	6f697463          	bgeu	s2,s6,712 <__sram_size+0x12>
    j main  # jump to main
  2e:	2d6e                	fld	fs10,216(sp)
    nop
  30:	7566                	flw	fa0,120(sp)
int fibonacci(int n) {
  32:	746e                	flw	fs0,248(sp)
  34:	6f69                	lui	t5,0x1a
  36:	2f6e                	fld	ft10,216(sp)
  38:	3131                	jal	fffffc44 <_my_stack_start+0xdffff444>
  3a:	652d                	lui	a0,0xb
  3c:	6578                	flw	fa4,76(a0)
  if (n < 2) {
  3e:	6372                	flw	ft6,28(sp)
  40:	7369                	lui	t1,0xffffa
  42:	2f65                	jal	7fa <__sram_size+0xfa>
  44:	3230                	fld	fa2,96(a2)
  46:	722d                	lui	tp,0xfffeb
    return 1;
  48:	6165                	addi	sp,sp,112
  4a:	7964                	flw	fs1,116(a0)
  s = fibonacci(n - 1);
  4c:	432d                	li	t1,11
  4e:	2d35302f          	0x2d35302f
  52:	7266                	flw	ft4,120(sp)
  54:	6d61                	lui	s10,0x18
  56:	0065                	c.nop	25
  58:	6966                	flw	fs2,88(sp)
  t = fibonacci(n - 2);
  5a:	6f62                	flw	ft10,24(sp)
  5c:	616e                	flw	ft2,216(sp)
  5e:	00696363          	bltu	s2,t1,64 <fibonacci+0x32>
  62:	6572                	flw	fa0,28(sp)
  64:	746c7573          	csrrci	a0,0x746,24
  return s + t;
  68:	6d00                	flw	fs0,24(a0)
  6a:	6961                	lui	s2,0x18
  6c:	2e6e                	fld	ft8,216(sp)
  6e:	4e470063          	beq	a4,tp,54e <__stack_size+0x44e>
}
  72:	2055                	jal	116 <__stack_size+0x16>
  74:	20393943          	fmadd.s	fs2,fs2,ft3,ft4,rup
  78:	2e38                	fld	fa4,88(a2)
  7a:	2e32                	fld	ft8,264(sp)
int main(void) {
  7c:	2030                	fld	fa2,64(s0)
  7e:	6d2d                	lui	s10,0xb
  80:	7261                	lui	tp,0xffff8
  82:	723d6863          	bltu	s10,gp,7b2 <__sram_size+0xb2>
  int result = 0;
  86:	3376                	fld	ft6,376(sp)
  result = fibonacci(10);
  88:	6532                	flw	fa0,12(sp)
  8a:	6d2d2063          	0x6d2d2063
  8e:	6261                	lui	tp,0x18
  return result;
  90:	3d69                	jal	ffffff2a <_my_stack_start+0xdffff72a>
  92:	6c69                	lui	s8,0x1a
  94:	3370                	fld	fa2,224(a4)
  96:	6532                	flw	fa0,12(sp)
  98:	2d20                	fld	fs0,88(a0)
  9a:	4f2d2067          	0x4f2d2067
    la a5, _bss_data_start # 
  9e:	2030                	fld	fa2,64(s0)
  a0:	732d                	lui	t1,0xfffeb
  a2:	6474                	flw	fa3,76(s0)
  a4:	673d                	lui	a4,0xf
    la a4, _bss_data_end # 
  a6:	756e                	flw	fa0,248(sp)
  a8:	3939                	jal	fffffcc6 <_my_stack_start+0xdffff4c6>
  aa:	2d20                	fld	fs0,88(a0)
  ac:	6e66                	flw	ft8,88(sp)
    beq a4, a5, 2f; # if a4 == a5 then 2f
  ae:	75622d6f          	jal	s10,22804 <__sram_size+0x22104>
    sw zero, 0(a5) # 
  b2:	6c69                	lui	s8,0x1a
  b4:	6974                	flw	fa3,84(a0)
    addi a5, a5, 4; # a5 = a5 + 4
  b6:	206e                	fld	ft0,216(sp)
    blt a5, a4, 1b # if a5 < a4 then 1b
  b8:	662d                	lui	a2,0xb
  ba:	6f6e                	flw	ft10,216(sp)
    ret
  bc:	622d                	lui	tp,0xb
    la a5, _data_section_lma_start # 
  be:	6975                	lui	s2,0x1d
  c0:	746c                	flw	fa1,108(s0)
    la a4, _data_section_vma_start # 
  c2:	6e69                	lui	t3,0x1a
  c4:	2a2d                	jal	1fe <__stack_size+0xfe>
  c6:	2d20                	fld	fs0,88(a0)
  c8:	7366                	flw	ft6,120(sp)
    la a3, _data_section_vma_end # 
  ca:	6769                	lui	a4,0x1a
  cc:	656e                	flw	fa0,216(sp)
  ce:	2d64                	fld	fs1,216(a0)
  d0:	72616863          	bltu	sp,t1,800 <__sram_size+0x100>
    beq a4, a3, 2f # if a4 == a3 then 1f
  d4:	2d20                	fld	fs0,88(a0)
    lw t0, 0(a5) #
  d6:	6666                	flw	fa2,88(sp)
  d8:	6e75                	lui	t3,0x1d
    sw t0, 0(a4) #
  da:	6f697463          	bgeu	s2,s6,7c2 <__sram_size+0xc2>
    addi a4, a4, 4; # a4 = a4 + 4
  de:	2d6e                	fld	fs10,216(sp)
    addi a5, a5, 4; # a5 = a5 + 4
  e0:	74636573          	csrrsi	a0,0x746,6
    blt a4, a3, 1b # if a4 < a3 then 1b
  e4:	6f69                	lui	t5,0x1a
    ret
  e6:	736e                	flw	ft6,248(sp)
  e8:	2d20                	fld	fs0,88(a0)
  ea:	6466                	flw	fs0,88(sp)
  ec:	7461                	lui	s0,0xffff8
  ee:	2d61                	jal	786 <__sram_size+0x86>
  f0:	74636573          	csrrsi	a0,0x746,6
  f4:	6f69                	lui	t5,0x1a
  f6:	736e                	flw	ft6,248(sp)
  f8:	2d20                	fld	fs0,88(a0)
  fa:	6e66                	flw	ft8,88(sp)
  fc:	6f632d6f          	jal	s10,327f2 <__sram_size+0x320f2>
 100:	6d6d                	lui	s10,0x1b
 102:	6d006e6f          	jal	t3,67d2 <__sram_size+0x60d2>
 106:	6961                	lui	s2,0x18
 108:	006e                	c.slli	zero,0x1b
 10a:	6e69                	lui	t3,0x1a
 10c:	7469                	lui	s0,0xffffa
 10e:	625f 7373 532e      	0x532e7373625f
 114:	4700                	lw	s0,8(a4)
 116:	554e                	lw	a0,240(sp)
 118:	4120                	lw	s0,64(a0)
 11a:	2e322053          	0x2e322053
 11e:	6c003233          	0x6c003233
 122:	5f64616f          	jal	sp,46718 <__sram_size+0x46018>
 126:	6164                	flw	fs1,68(a0)
 128:	6174                	flw	fa3,68(a0)
 12a:	532e                	lw	t1,232(sp)
 12c:	7300                	flw	fs0,32(a4)
 12e:	6174                	flw	fa3,68(a0)
 130:	7472                	flw	fs0,60(sp)
 132:	532e                	lw	t1,232(sp)
	...

Disassembly of section .comment:

00000000 <.comment>:
    li ra, 0 # x1 = 0
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
    li gp, 0 # x3 = 0
   4:	2820                	fld	fs0,80(s0)
    li tp, 0 # x4 = 0
   6:	5078                	lw	a4,100(s0)
    li t0, 0 # x5 = 0
   8:	6361                	lui	t1,0x18
    li t1, 0 # x6 = 0
   a:	4e47206b          	0x4e47206b
    li s0, 0 # x8 = 0  s0/fp := x8
   e:	2055                	jal	b2 <init_bss+0x14>
    li s1, 0 # x9 = 0
  10:	4952                	lw	s2,20(sp)
    li a0, 0 # x10 = 0
  12:	562d4353          	0x562d4353
    li a2, 0 # x12 = 0
  16:	4520                	lw	s0,72(a0)
    li a3, 0 # x13 = 0
  18:	626d                	lui	tp,0x1b
    li a4, 0 # x14 = 0
  1a:	6465                	lui	s0,0x19
    li a5, 0 # x15 = 0
  1c:	6564                	flw	fs1,76(a0)
    la sp, _my_stack_start # sp = _my_stack_start
  1e:	2064                	fld	fs1,192(s0)
  20:	2c434347          	0x2c434347
  24:	3620                	fld	fs0,104(a2)
    call load_data  # load data from flash to sram
  26:	2d34                	fld	fa3,88(a0)
    jal init_bss  # jump to init_bss and save position to ra
  28:	6962                	flw	fs2,24(sp)
  2a:	2974                	fld	fa3,208(a0)
    j main  # jump to main
  2c:	3820                	fld	fs0,112(s0)
  2e:	322e                	fld	ft4,232(sp)
    nop
  30:	302e                	fld	ft0,232(sp)
	...

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
    li ra, 0 # x1 = 0
   0:	000c                	0xc
    li sp, 0 # x2 = 0
   2:	0000                	unimp
    li gp, 0 # x3 = 0
   4:	ffff                	0xffff
    li tp, 0 # x4 = 0
   6:	ffff                	0xffff
    li t0, 0 # x5 = 0
   8:	0001                	nop
    li t1, 0 # x6 = 0
   a:	7c01                	lui	s8,0xfffe0
    li t2, 0 # x7 = 0
   c:	0d01                	addi	s10,s10,0
    li s0, 0 # x8 = 0  s0/fp := x8
   e:	0002                	c.slli64	zero
    li s1, 0 # x9 = 0
  10:	0020                	addi	s0,sp,8
    li a0, 0 # x10 = 0
  12:	0000                	unimp
    li a1, 0 # x11 = 0
  14:	0000                	unimp
    li a2, 0 # x12 = 0
  16:	0000                	unimp
    li a3, 0 # x13 = 0
  18:	0032                	c.slli	zero,0xc
    li a4, 0 # x14 = 0
  1a:	0000                	unimp
    li a5, 0 # x15 = 0
  1c:	004a                	c.slli	zero,0x12
    la sp, _my_stack_start # sp = _my_stack_start
  1e:	0000                	unimp
  20:	0e42                	slli	t3,t3,0x10
  22:	4418                	lw	a4,8(s0)
  24:	0181                	addi	gp,gp,0
    call load_data  # load data from flash to sram
  26:	0288                	addi	a0,sp,320
    jal init_bss  # jump to init_bss and save position to ra
  28:	0c42                	slli	s8,s8,0x10
  2a:	0008                	0x8
    j main  # jump to main
  2c:	3c02                	fld	fs8,32(sp)
  2e:	42c1                	li	t0,16
    nop
  30:	42c8                	lw	a0,4(a3)
int fibonacci(int n) {
  32:	020d                	addi	tp,tp,3
  34:	0020                	addi	s0,sp,8
  36:	0000                	unimp
  38:	0000                	unimp
  3a:	0000                	unimp
  3c:	007c                	addi	a5,sp,12
  if (n < 2) {
  3e:	0000                	unimp
  40:	0022                	c.slli	zero,0x8
  42:	0000                	unimp
  44:	0e42                	slli	t3,t3,0x10
  46:	4410                	lw	a2,8(s0)
    return 1;
  48:	0181                	addi	gp,gp,0
  4a:	0288                	addi	a0,sp,320
  s = fibonacci(n - 1);
  4c:	0c42                	slli	s8,s8,0x10
  4e:	0008                	0x8
  50:	c154                	sw	a3,4(a0)
  52:	c842                	sw	a6,16(sp)
  54:	0d42                	slli	s10,s10,0x10
  56:	0002                	c.slli64	zero
