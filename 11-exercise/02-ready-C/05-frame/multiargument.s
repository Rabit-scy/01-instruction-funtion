
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
  26:	2a29                	jal	140 <load_data>
    jal init_bss  # jump to init_bss and save position to ra
  28:	0f8000ef          	jal	ra,120 <init_bss>
    j main  # jump to main
  2c:	0920006f          	j	be <main>
    

    nop
  30:	0001                	nop

00000032 <foo>:
int foo(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j,
        int k, int l, int m) {
  32:	fd810113          	addi	sp,sp,-40
  36:	d206                	sw	ra,36(sp)
  38:	d022                	sw	s0,32(sp)
  3a:	1020                	addi	s0,sp,40
  3c:	fea42623          	sw	a0,-20(s0)
  40:	feb42423          	sw	a1,-24(s0)
  44:	fec42223          	sw	a2,-28(s0)
  48:	fed42023          	sw	a3,-32(s0)
  4c:	fce42e23          	sw	a4,-36(s0)
  50:	fcf42c23          	sw	a5,-40(s0)

  int sum;

  sum = (a + b + c + d + e + f - g - h - i) * j * k;
  54:	fec42703          	lw	a4,-20(s0)
  58:	fe842783          	lw	a5,-24(s0)
  5c:	973e                	add	a4,a4,a5
  5e:	fe442783          	lw	a5,-28(s0)
  62:	973e                	add	a4,a4,a5
  64:	fe042783          	lw	a5,-32(s0)
  68:	973e                	add	a4,a4,a5
  6a:	fdc42783          	lw	a5,-36(s0)
  6e:	973e                	add	a4,a4,a5
  70:	fd842783          	lw	a5,-40(s0)
  74:	973e                	add	a4,a4,a5
  76:	401c                	lw	a5,0(s0)    /* g */
  78:	8f1d                	sub	a4,a4,a5
  7a:	405c                	lw	a5,4(s0)    /* h */
  7c:	8f1d                	sub	a4,a4,a5
  7e:	441c                	lw	a5,8(s0)    /* i */
  80:	40f707b3          	sub	a5,a4,a5
  84:	444c                	lw	a1,12(s0)   /* j */
  86:	853e                	mv	a0,a5
  88:	20d5                	jal	16c <__mulsi3>
  8a:	87aa                	mv	a5,a0
  8c:	85be                	mv	a1,a5
  8e:	4808                	lw	a0,16(s0)   /* k */
  90:	28f1                	jal	16c <__mulsi3>
  92:	87aa                	mv	a5,a0
  94:	fef42823          	sw	a5,-16(s0)
  sum = sum * m / l;
  98:	4c0c                	lw	a1,24(s0)   /* m */
  9a:	ff042503          	lw	a0,-16(s0)    /* sum */
  9e:	20f9                	jal	16c <__mulsi3>
  a0:	87aa                	mv	a5,a0
  a2:	484c                	lw	a1,20(s0)   /* l */
  a4:	853e                	mv	a0,a5
  a6:	28f9                	jal	184 <__divsi3>
  a8:	87aa                	mv	a5,a0
  aa:	fef42823          	sw	a5,-16(s0)    /* sum = [s0-16]*/

  return sum;
  ae:	ff042783          	lw	a5,-16(s0)
}
  b2:	853e                	mv	a0,a5
  b4:	5092                	lw	ra,36(sp)
  b6:	5402                	lw	s0,32(sp)
  b8:	02810113          	addi	sp,sp,40
  bc:	8082                	ret

000000be <main>:

int main(void) {
  be:	fc810113          	addi	sp,sp,-56
  c2:	da06                	sw	ra,52(sp)
  c4:	d822                	sw	s0,48(sp)
  c6:	1820                	addi	s0,sp,56
  int e, g, l, result;
  e = 3, g = 21, l = 5;
  c8:	478d                	li	a5,3
  ca:	fef42823          	sw	a5,-16(s0)
  ce:	47d5                	li	a5,21
  d0:	fef42623          	sw	a5,-20(s0)
  d4:	4795                	li	a5,5
  d6:	fef42423          	sw	a5,-24(s0)
  result = foo(10, 9, 8, 15, e, 20, g, 0, -13, 41, 29, l, 51);
  da:	03300793          	li	a5,51
  de:	cc3e                	sw	a5,24(sp)
  e0:	fe842783          	lw	a5,-24(s0)
  e4:	ca3e                	sw	a5,20(sp)
  e6:	47f5                	li	a5,29
  e8:	c83e                	sw	a5,16(sp)
  ea:	02900793          	li	a5,41
  ee:	c63e                	sw	a5,12(sp)
  f0:	57cd                	li	a5,-13
  f2:	c43e                	sw	a5,8(sp)
  f4:	c202                	sw	zero,4(sp)
  f6:	fec42783          	lw	a5,-20(s0)
  fa:	c03e                	sw	a5,0(sp)
  fc:	47d1                	li	a5,20
  fe:	ff042703          	lw	a4,-16(s0)
 102:	46bd                	li	a3,15
 104:	4621                	li	a2,8
 106:	45a5                	li	a1,9
 108:	4529                	li	a0,10
 10a:	3725                	jal	32 <foo>
 10c:	fea42223          	sw	a0,-28(s0)

  return result;
 110:	fe442783          	lw	a5,-28(s0)
 114:	853e                	mv	a0,a5
 116:	50d2                	lw	ra,52(sp)
 118:	5442                	lw	s0,48(sp)
 11a:	03810113          	addi	sp,sp,56
 11e:	8082                	ret

00000120 <init_bss>:
.globl init_bss
.type init_bss, @function
init_bss:
    # bss data are non-initialized data.
    # but people are usually initialize them as zero.
    la a5, _bss_data_start # 
 120:	20000797          	auipc	a5,0x20000
 124:	ee078793          	addi	a5,a5,-288 # 20000000 <_data_section_vma_end>
    la a4, _bss_data_end # 
 128:	20000717          	auipc	a4,0x20000
 12c:	ed870713          	addi	a4,a4,-296 # 20000000 <_data_section_vma_end>
    beq a4, a5, 2f; # if a4 == a5 then 2f
 130:	00f70763          	beq	a4,a5,13e <init_bss+0x1e>
    
1:
    sw zero, 0(a5) # 
 134:	0007a023          	sw	zero,0(a5)
    addi a5, a5, 4; # a5 = a5 + 4
 138:	0791                	addi	a5,a5,4
    blt a5, a4, 1b # if a5 < a4 then 1b
 13a:	fee7cde3          	blt	a5,a4,134 <init_bss+0x14>

2:
    ret
 13e:	8082                	ret

00000140 <load_data>:
    # flash data start address is saved in symbol _data_section_lma_start
    # ram data start address is saved in symbol _data_section_vma_start
    # ram data end address is saved in symbol _data_section_end
    # so, data that need to be initialized length is _data_section_end - _data_section_vma_start

    la a5, _data_section_lma_start # 
 140:	20400793          	li	a5,516
    la a4, _data_section_vma_start # 
 144:	20000717          	auipc	a4,0x20000
 148:	ebc70713          	addi	a4,a4,-324 # 20000000 <_data_section_vma_end>
    la a3, _data_section_vma_end # 
 14c:	20000697          	auipc	a3,0x20000
 150:	eb468693          	addi	a3,a3,-332 # 20000000 <_data_section_vma_end>
        if(a4 == a3)    data length != 0
        {

        }
    */
    beq a4, a3, 2f # if a4 == a3 then 1f
 154:	00d70a63          	beq	a4,a3,168 <load_data+0x28>
1:
    /*
        t0 = int* (a5)[0]
        int* (a4)[0] = t0
    */
    lw t0, 0(a5) #
 158:	0007a283          	lw	t0,0(a5)
    sw t0, 0(a4) #
 15c:	00572023          	sw	t0,0(a4)
    addi a4, a4, 4; # a4 = a4 + 4
 160:	0711                	addi	a4,a4,4
    addi a5, a5, 4; # a5 = a5 + 4
 162:	0791                	addi	a5,a5,4
    blt a4, a3, 1b # if a4 < a3 then 1b
 164:	fed74ae3          	blt	a4,a3,158 <load_data+0x18>
2:  
    ret
 168:	8082                	ret
	...

0000016c <__mulsi3>:
 16c:	862a                	mv	a2,a0
 16e:	4501                	li	a0,0
 170:	0015f693          	andi	a3,a1,1
 174:	c291                	beqz	a3,178 <__mulsi3+0xc>
 176:	9532                	add	a0,a0,a2
 178:	8185                	srli	a1,a1,0x1
 17a:	0606                	slli	a2,a2,0x1
 17c:	f9f5                	bnez	a1,170 <__mulsi3+0x4>
 17e:	8082                	ret
 180:	0000                	unimp
	...

00000184 <__divsi3>:
 184:	02054e63          	bltz	a0,1c0 <__umodsi3+0x8>
 188:	0405c363          	bltz	a1,1ce <__umodsi3+0x16>

0000018c <__udivsi3>:
 18c:	862e                	mv	a2,a1
 18e:	85aa                	mv	a1,a0
 190:	557d                	li	a0,-1
 192:	c215                	beqz	a2,1b6 <__udivsi3+0x2a>
 194:	4685                	li	a3,1
 196:	00b67863          	bgeu	a2,a1,1a6 <__udivsi3+0x1a>
 19a:	00c05663          	blez	a2,1a6 <__udivsi3+0x1a>
 19e:	0606                	slli	a2,a2,0x1
 1a0:	0686                	slli	a3,a3,0x1
 1a2:	feb66ce3          	bltu	a2,a1,19a <__udivsi3+0xe>
 1a6:	4501                	li	a0,0
 1a8:	00c5e463          	bltu	a1,a2,1b0 <__udivsi3+0x24>
 1ac:	8d91                	sub	a1,a1,a2
 1ae:	8d55                	or	a0,a0,a3
 1b0:	8285                	srli	a3,a3,0x1
 1b2:	8205                	srli	a2,a2,0x1
 1b4:	faf5                	bnez	a3,1a8 <__udivsi3+0x1c>
 1b6:	8082                	ret

000001b8 <__umodsi3>:
 1b8:	8286                	mv	t0,ra
 1ba:	3fc9                	jal	18c <__udivsi3>
 1bc:	852e                	mv	a0,a1
 1be:	8282                	jr	t0
 1c0:	40a00533          	neg	a0,a0
 1c4:	0005d763          	bgez	a1,1d2 <__umodsi3+0x1a>
 1c8:	40b005b3          	neg	a1,a1
 1cc:	b7c1                	j	18c <__udivsi3>
 1ce:	40b005b3          	neg	a1,a1
 1d2:	8286                	mv	t0,ra
 1d4:	3f65                	jal	18c <__udivsi3>
 1d6:	40a00533          	neg	a0,a0
 1da:	8282                	jr	t0

000001dc <__modsi3>:
 1dc:	8286                	mv	t0,ra
 1de:	0005c763          	bltz	a1,1ec <__modsi3+0x10>
 1e2:	00054963          	bltz	a0,1f4 <__modsi3+0x18>
 1e6:	375d                	jal	18c <__udivsi3>
 1e8:	852e                	mv	a0,a1
 1ea:	8282                	jr	t0
 1ec:	40b005b3          	neg	a1,a1
 1f0:	fe055be3          	bgez	a0,1e6 <__modsi3+0xa>
 1f4:	40a00533          	neg	a0,a0
 1f8:	3f51                	jal	18c <__udivsi3>
 1fa:	40b00533          	neg	a0,a1
 1fe:	8282                	jr	t0
 200:	0000                	unimp
	...

Disassembly of section .my_stack:

20000700 <_my_stack_start-0x100>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
    li ra, 0 # x1 = 0
   0:	0149                	addi	sp,sp,18
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
   c:	0066                	c.slli	zero,0x19
    li s0, 0 # x8 = 0  s0/fp := x8
   e:	0000                	unimp
    li s1, 0 # x9 = 0
  10:	5f0c                	lw	a1,56(a4)
	...
    la sp, _my_stack_start # sp = _my_stack_start
  22:	0000                	unimp
  24:	0200                	addi	s0,sp,256
    call load_data  # load data from flash to sram
  26:	000000fb          	0xfb
    jal init_bss  # jump to init_bss and save position to ra
  2a:	0c01                	addi	s8,s8,0
    j main  # jump to main
  2c:	7605                	lui	a2,0xfffe1
  2e:	0000                	unimp
    nop
  30:	be00                	fsd	fs0,56(a2)
        int k, int l, int m) {
  32:	0000                	unimp
  34:	6200                	flw	fs0,0(a2)
  36:	0000                	unimp
  38:	0100                	addi	s0,sp,128
  3a:	769c                	flw	fa5,40(a3)
  3c:	0000                	unimp
  3e:	0300                	addi	s0,sp,384
  40:	0065                	c.nop	25
  42:	0d01                	addi	s10,s10,0
  44:	00007607          	0x7607
  48:	0200                	addi	s0,sp,256
  4a:	7091                	lui	ra,0xfffe4
  4c:	01006703          	0x1006703
  50:	0a0d                	addi	s4,s4,3
  52:	0076                	c.slli	zero,0x1d
  sum = (a + b + c + d + e + f - g - h - i) * j * k;
  54:	0000                	unimp
  56:	9102                	jalr	sp
  58:	036c                	addi	a1,sp,396
  5a:	006c                	addi	a1,sp,12
  5c:	0d01                	addi	s10,s10,0
  5e:	760d                	lui	a2,0xfffe3
  60:	0000                	unimp
  62:	0200                	addi	s0,sp,256
  64:	6891                	lui	a7,0x4
  66:	5804                	lw	s1,48(s0)
  68:	0000                	unimp
  6a:	0100                	addi	s0,sp,128
  6c:	100d                	c.nop	-29
  6e:	0076                	c.slli	zero,0x1d
  70:	0000                	unimp
  72:	9102                	jalr	sp
  74:	0064                	addi	s1,sp,12
  76:	0405                	addi	s0,s0,1
  78:	6905                	lui	s2,0x1
  7a:	746e                	flw	fs0,248(sp)
  7c:	0600                	addi	s0,sp,768
  7e:	6f66                	flw	ft10,88(sp)
  80:	0101006f          	j	10090 <__sram_size+0xf990>
  84:	7605                	lui	a2,0xfffe1
  86:	0000                	unimp
  88:	3200                	fld	fs0,32(a2)
  8a:	0000                	unimp
  8c:	8c00                	0x8c00
  8e:	0000                	unimp
  90:	0100                	addi	s0,sp,128
  92:	079c                	addi	a5,sp,960
  94:	0061                	c.nop	24
  96:	0101                	addi	sp,sp,0
  sum = sum * m / l;
  98:	760d                	lui	a2,0xfffe3
  9a:	0000                	unimp
  9c:	0200                	addi	s0,sp,256
  9e:	6c91                	lui	s9,0x4
  a0:	01006207          	0x1006207
  a4:	1401                	addi	s0,s0,-32
  a6:	0076                	c.slli	zero,0x1d
  a8:	0000                	unimp
  aa:	9102                	jalr	sp
  ac:	0768                	addi	a0,sp,908
  return sum;
  ae:	01010063          	beq	sp,a6,ae <foo+0x7c>
}
  b2:	0000761b          	0x761b
  b6:	0200                	addi	s0,sp,256
  b8:	6491                	lui	s1,0x4
  ba:	01006407          	0x1006407
int main(void) {
  be:	2201                	jal	1be <__umodsi3+0x6>
  c0:	0076                	c.slli	zero,0x1d
  c2:	0000                	unimp
  c4:	9102                	jalr	sp
  c6:	0760                	addi	s0,sp,908
  e = 3, g = 21, l = 5;
  c8:	0065                	c.nop	25
  ca:	0101                	addi	sp,sp,0
  cc:	7629                	lui	a2,0xfffea
  ce:	0000                	unimp
  d0:	0200                	addi	s0,sp,256
  d2:	5c91                	li	s9,-28
  d4:	01006607          	0x1006607
  d8:	3001                	jal	fffff8d8 <_my_stack_start+0xdffff0d8>
  result = foo(10, 9, 8, 15, e, 20, g, 0, -13, 41, 29, l, 51);
  da:	0076                	c.slli	zero,0x1d
  dc:	0000                	unimp
  de:	9102                	jalr	sp
  e0:	0758                	addi	a4,sp,900
  e2:	01010067          	jr	16(sp)
  e6:	00007637          	lui	a2,0x7
  ea:	0200                	addi	s0,sp,256
  ec:	0091                	addi	ra,ra,4
  ee:	01006807          	0x1006807
  f2:	3e01                	jal	fffffc02 <_my_stack_start+0xdffff402>
  f4:	0076                	c.slli	zero,0x1d
  f6:	0000                	unimp
  f8:	9102                	jalr	sp
  fa:	0704                	addi	s1,sp,896
  fc:	0069                	c.nop	26
  fe:	0101                	addi	sp,sp,0
 100:	7645                	lui	a2,0xffff1
 102:	0000                	unimp
 104:	0200                	addi	s0,sp,256
 106:	0891                	addi	a7,a7,4
 108:	01006a07          	0x1006a07
 10c:	4c01                	li	s8,0
 10e:	0076                	c.slli	zero,0x1d
  return result;
 110:	0000                	unimp
 112:	9102                	jalr	sp
 114:	070c                	addi	a1,sp,896
 116:	0201006b          	0x201006b
 11a:	760d                	lui	a2,0xfffe3
 11c:	0000                	unimp
 11e:	0200                	addi	s0,sp,256
    la a5, _bss_data_start # 
 120:	1091                	addi	ra,ra,-28
 122:	01006c07          	0x1006c07
 126:	1402                	slli	s0,s0,0x20
    la a4, _bss_data_end # 
 128:	0076                	c.slli	zero,0x1d
 12a:	0000                	unimp
 12c:	9102                	jalr	sp
 12e:	0714                	addi	a3,sp,896
    beq a4, a5, 2f; # if a4 == a5 then 2f
 130:	006d                	c.nop	27
 132:	0201                	addi	tp,tp,0
    sw zero, 0(a5) # 
 134:	0000761b          	0x761b
    addi a5, a5, 4; # a5 = a5 + 4
 138:	0200                	addi	s0,sp,256
    blt a5, a4, 1b # if a5 < a4 then 1b
 13a:	1891                	addi	a7,a7,-28
 13c:	6d757303          	0x6d757303
    la a5, _data_section_lma_start # 
 140:	0100                	addi	s0,sp,128
 142:	0704                	addi	s1,sp,896
    la a4, _data_section_vma_start # 
 144:	0076                	c.slli	zero,0x1d
 146:	0000                	unimp
 148:	9102                	jalr	sp
 14a:	0070                	addi	a2,sp,12
    la a3, _data_section_vma_end # 
 14c:	2200                	fld	fs0,0(a2)
 14e:	0000                	unimp
 150:	0200                	addi	s0,sp,256
 152:	8c00                	0x8c00
    beq a4, a3, 2f # if a4 == a3 then 1f
 154:	0000                	unimp
 156:	0400                	addi	s0,sp,512
    lw t0, 0(a5) #
 158:	e901                	bnez	a0,168 <load_data+0x28>
 15a:	0000                	unimp
    sw t0, 0(a4) #
 15c:	2000                	fld	fs0,0(s0)
 15e:	0001                	nop
    addi a4, a4, 4; # a4 = a4 + 4
 160:	4000                	lw	s0,0(s0)
    addi a5, a5, 4; # a5 = a5 + 4
 162:	0001                	nop
    blt a4, a3, 1b # if a4 < a3 then 1b
 164:	0000                	unimp
 166:	0001                	nop
    ret
 168:	0000                	unimp
 16a:	0000                	unimp
 16c:	0b00                	addi	s0,sp,400
 16e:	0001                	nop
 170:	0100                	addi	s0,sp,128
 172:	2280                	fld	fs0,0(a3)
 174:	0000                	unimp
 176:	0200                	addi	s0,sp,256
 178:	a000                	fsd	fs0,0(s0)
 17a:	0000                	unimp
 17c:	0400                	addi	s0,sp,512
 17e:	4801                	li	a6,0
 180:	0001                	nop
 182:	4000                	lw	s0,0(s0)
 184:	0001                	nop
 186:	6a00                	flw	fs0,16(a2)
 188:	0001                	nop
 18a:	1700                	addi	s0,sp,928
 18c:	0001                	nop
 18e:	0000                	unimp
 190:	0000                	unimp
 192:	0b00                	addi	s0,sp,400
 194:	0001                	nop
 196:	0100                	addi	s0,sp,128
 198:	2280                	fld	fs0,0(a3)
 19a:	0000                	unimp
 19c:	0200                	addi	s0,sp,256
 19e:	b400                	fsd	fs0,40(s0)
 1a0:	0000                	unimp
 1a2:	0400                	addi	s0,sp,512
 1a4:	ba01                	j	fffffab4 <_my_stack_start+0xdffff2b4>
 1a6:	0001                	nop
 1a8:	0000                	unimp
 1aa:	0000                	unimp
 1ac:	3200                	fld	fs0,32(a2)
 1ae:	0000                	unimp
 1b0:	2300                	fld	fs0,0(a4)
 1b2:	0001                	nop
 1b4:	0000                	unimp
 1b6:	0000                	unimp
 1b8:	0b00                	addi	s0,sp,400
 1ba:	0001                	nop
 1bc:	0100                	addi	s0,sp,128
 1be:	80              	Address 0x00000000000001be is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
    li ra, 0 # x1 = 0
   0:	1101                	addi	sp,sp,-32
    li sp, 0 # x2 = 0
   2:	2501                	jal	602 <_data_section_lma_start+0x3fe>
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
        int k, int l, int m) {
  32:	0034                	addi	a3,sp,8
  34:	0b3a0803          	lb	a6,179(s4)
  38:	0b390b3b          	0xb390b3b
  3c:	1349                	addi	t1,t1,-14
  3e:	1802                	slli	a6,a6,0x20
  40:	0000                	unimp
  42:	3404                	fld	fs1,40(s0)
  44:	0300                	addi	s0,sp,384
  46:	3a0e                	fld	fs4,224(sp)
  48:	390b3b0b          	0x390b3b0b
  4c:	0213490b          	0x213490b
  50:	0018                	0x18
  52:	0500                	addi	s0,sp,640
  sum = (a + b + c + d + e + f - g - h - i) * j * k;
  54:	0024                	addi	s1,sp,8
  56:	0b3e0b0b          	0xb3e0b0b
  5a:	00000803          	lb	a6,0(zero) # 0 <my_start>
  5e:	2e06                	fld	ft8,64(sp)
  60:	3f01                	jal	ffffff70 <_my_stack_start+0xdffff770>
  62:	0319                	addi	t1,t1,6
  64:	3a08                	fld	fa0,48(a2)
  66:	390b3b0b          	0x390b3b0b
  6a:	4919270b          	0x4919270b
  6e:	12011113          	0x12011113
  72:	4006                	0x4006
  74:	9618                	0x9618
  76:	1942                	slli	s2,s2,0x30
  78:	0000                	unimp
  7a:	03000507          	0x3000507
  7e:	3a08                	fld	fa0,48(a2)
  80:	390b3b0b          	0x390b3b0b
  84:	0213490b          	0x213490b
  88:	0018                	0x18
  8a:	0000                	unimp
  8c:	1101                	addi	sp,sp,-32
  8e:	1000                	addi	s0,sp,32
  90:	1106                	slli	sp,sp,0x21
  92:	1201                	addi	tp,tp,-32
  94:	0301                	addi	t1,t1,0
  96:	1b0e                	slli	s6,s6,0x23
  sum = sum * m / l;
  98:	250e                	fld	fa0,192(sp)
  9a:	130e                	slli	t1,t1,0x23
  9c:	0005                	c.nop	1
  9e:	0000                	unimp
  a0:	1101                	addi	sp,sp,-32
  a2:	1000                	addi	s0,sp,32
  a4:	1106                	slli	sp,sp,0x21
  a6:	1201                	addi	tp,tp,-32
  a8:	0301                	addi	t1,t1,0
  aa:	1b0e                	slli	s6,s6,0x23
  ac:	250e                	fld	fa0,192(sp)
  return sum;
  ae:	130e                	slli	t1,t1,0x23
  b0:	0005                	c.nop	1
}
  b2:	0000                	unimp
  b4:	1101                	addi	sp,sp,-32
  b6:	1000                	addi	s0,sp,32
  b8:	1106                	slli	sp,sp,0x21
  ba:	1201                	addi	tp,tp,-32
  bc:	0301                	addi	t1,t1,0
int main(void) {
  be:	1b0e                	slli	s6,s6,0x23
  c0:	250e                	fld	fa0,192(sp)
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
  14:	008c                	addi	a1,sp,64
    li a2, 0 # x12 = 0
  16:	0000                	unimp
    li a3, 0 # x13 = 0
  18:	00be                	slli	ra,ra,0xf
    li a4, 0 # x14 = 0
  1a:	0000                	unimp
    li a5, 0 # x15 = 0
  1c:	0062                	c.slli	zero,0x18
	...
    call load_data  # load data from flash to sram
  26:	0000                	unimp
    jal init_bss  # jump to init_bss and save position to ra
  28:	001c                	0x1c
  2a:	0000                	unimp
    j main  # jump to main
  2c:	0002                	c.slli64	zero
  2e:	014d                	addi	sp,sp,19
    nop
  30:	0000                	unimp
        int k, int l, int m) {
  32:	0004                	0x4
  34:	0000                	unimp
  36:	0000                	unimp
  38:	0120                	addi	s0,sp,136
  3a:	0000                	unimp
  3c:	0020                	addi	s0,sp,8
	...
  46:	0000                	unimp
  48:	001c                	0x1c
  4a:	0000                	unimp
  4c:	0002                	c.slli64	zero
  4e:	00000173          	0x173
  52:	0004                	0x4
  sum = (a + b + c + d + e + f - g - h - i) * j * k;
  54:	0000                	unimp
  56:	0000                	unimp
  58:	0140                	addi	s0,sp,132
  5a:	0000                	unimp
  5c:	002a                	c.slli	zero,0xa
	...
  66:	0000                	unimp
  68:	001c                	0x1c
  6a:	0000                	unimp
  6c:	0002                	c.slli64	zero
  6e:	0199                	addi	gp,gp,6
  70:	0000                	unimp
  72:	0004                	0x4
	...
  7c:	0032                	c.slli	zero,0xc
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
    li ra, 0 # x1 = 0
   0:	0032                	c.slli	zero,0xc
    li sp, 0 # x2 = 0
   2:	0000                	unimp
    li gp, 0 # x3 = 0
   4:	00be                	slli	ra,ra,0xf
    li tp, 0 # x4 = 0
   6:	0000                	unimp
    li t0, 0 # x5 = 0
   8:	00be                	slli	ra,ra,0xf
    li t1, 0 # x6 = 0
   a:	0000                	unimp
    li t2, 0 # x7 = 0
   c:	0120                	addi	s0,sp,136
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
    li ra, 0 # x1 = 0
   0:	00e5                	addi	ra,ra,25
    li sp, 0 # x2 = 0
   2:	0000                	unimp
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
  28:	001e                	c.slli	zero,0x7
  2a:	0205                	addi	tp,tp,1
    j main  # jump to main
  2c:	0032                	c.slli	zero,0xc
  2e:	0000                	unimp
    nop
  30:	030c0513          	addi	a0,s8,48
        int k, int l, int m) {
  34:	0904                	addi	s1,sp,144
  36:	0022                	c.slli	zero,0x8
  38:	0501                	addi	a0,a0,0
  3a:	0310                	addi	a2,sp,384
  3c:	0900                	addi	s0,sp,144
  3e:	000a                	c.slli	zero,0x2
  40:	0501                	addi	a0,a0,0
  42:	0314                	addi	a3,sp,384
  44:	0900                	addi	s0,sp,144
  46:	0006                	c.slli	zero,0x1
  48:	0501                	addi	a0,a0,0
  4a:	0318                	addi	a4,sp,384
  4c:	0900                	addi	s0,sp,144
  4e:	0006                	c.slli	zero,0x1
  50:	0501                	addi	a0,a0,0
  52:	031c                	addi	a5,sp,384
  sum = (a + b + c + d + e + f - g - h - i) * j * k;
  54:	0900                	addi	s0,sp,144
  56:	0006                	c.slli	zero,0x1
  58:	0501                	addi	a0,a0,0
  5a:	0320                	addi	s0,sp,392
  5c:	0900                	addi	s0,sp,144
  5e:	0006                	c.slli	zero,0x1
  60:	0501                	addi	a0,a0,0
  62:	0324                	addi	s1,sp,392
  64:	0900                	addi	s0,sp,144
  66:	0004                	0x4
  68:	0501                	addi	a0,a0,0
  6a:	0328                	addi	a0,sp,392
  6c:	0900                	addi	s0,sp,144
  6e:	0004                	0x4
  70:	0501                	addi	a0,a0,0
  72:	032d                	addi	t1,t1,11
  74:	0900                	addi	s0,sp,144
  76:	0006                	c.slli	zero,0x1
  78:	0501                	addi	a0,a0,0
  7a:	09000307          	0x9000307
  7e:	0008                	0x8
  80:	0501                	addi	a0,a0,0
  82:	030d                	addi	t1,t1,3
  84:	0901                	addi	s2,s2,0
  86:	000c                	0xc
  88:	0501                	addi	a0,a0,0
  8a:	09000307          	0x9000307
  8e:	000a                	c.slli	zero,0x2
  90:	0501                	addi	a0,a0,0
  92:	030a                	slli	t1,t1,0x2
  94:	0902                	c.slli64	s2
  96:	000c                	0xc
  sum = sum * m / l;
  98:	0501                	addi	a0,a0,0
  9a:	0301                	addi	t1,t1,0
  9c:	0901                	addi	s2,s2,0
  9e:	0004                	0x4
  a0:	0901                	addi	s2,s2,0
  a2:	000c                	0xc
  a4:	0100                	addi	s0,sp,128
  a6:	0501                	addi	a0,a0,0
  a8:	0010                	0x10
  aa:	0205                	addi	tp,tp,1
  ac:	00be                	slli	ra,ra,0xf
  return sum;
  ae:	0000                	unimp
  b0:	05010b03          	lb	s6,80(sp) # 1001105c <__sram_size+0x1001095c>
}
  b4:	0305                	addi	t1,t1,1
  b6:	0902                	c.slli64	s2
  b8:	000a                	c.slli	zero,0x2
  ba:	0501                	addi	a0,a0,0
  bc:	030c                	addi	a1,sp,384
int main(void) {
  be:	0900                	addi	s0,sp,144
  c0:	0006                	c.slli	zero,0x1
  c2:	0501                	addi	a0,a0,0
  c4:	0314                	addi	a3,sp,384
  c6:	0900                	addi	s0,sp,144
  e = 3, g = 21, l = 5;
  c8:	0006                	c.slli	zero,0x1
  ca:	0501                	addi	a0,a0,0
  cc:	030c                	addi	a1,sp,384
  ce:	0901                	addi	s2,s2,0
  d0:	0006                	c.slli	zero,0x1
  d2:	0501                	addi	a0,a0,0
  d4:	030a                	slli	t1,t1,0x2
  d6:	0902                	c.slli64	s2
  d8:	0036                	c.slli	zero,0xd
  result = foo(10, 9, 8, 15, e, 20, g, 0, -13, 41, 29, l, 51);
  da:	0501                	addi	a0,a0,0
  dc:	0301                	addi	t1,t1,0
  de:	0901                	addi	s2,s2,0
  e0:	0004                	0x4
  e2:	0901                	addi	s2,s2,0
  e4:	000c                	0xc
  e6:	0100                	addi	s0,sp,128
  e8:	5b01                	li	s6,-32
  ea:	0000                	unimp
  ec:	0300                	addi	s0,sp,384
  ee:	2100                	fld	fs0,0(a0)
  f0:	0000                	unimp
  f2:	0100                	addi	s0,sp,128
  f4:	fb01                	bnez	a4,4 <my_start+0x4>
  f6:	0d0e                	slli	s10,s10,0x3
  f8:	0100                	addi	s0,sp,128
  fa:	0101                	addi	sp,sp,0
  fc:	0001                	nop
  fe:	0000                	unimp
 100:	0001                	nop
 102:	0100                	addi	s0,sp,128
 104:	6900                	flw	fs0,16(a0)
 106:	696e                	flw	fs2,216(sp)
 108:	5f74                	lw	a3,124(a4)
 10a:	7362                	flw	ft6,56(sp)
 10c:	00532e73          	csrrs	t3,utvec,t1
  return result;
 110:	0000                	unimp
 112:	0000                	unimp
 114:	0500                	addi	s0,sp,640
 116:	2002                	fld	ft0,0(sp)
 118:	0001                	nop
 11a:	0300                	addi	s0,sp,384
 11c:	010c                	addi	a1,sp,128
 11e:	08090103          	lb	sp,128(s2) # 1080 <__sram_size+0x980>
    la a5, _bss_data_start # 
 122:	0100                	addi	s0,sp,128
 124:	08090103          	lb	sp,128(s2)
    la a4, _bss_data_end # 
 128:	0100                	addi	s0,sp,128
 12a:	04090303          	lb	t1,64(s2)
 12e:	0100                	addi	s0,sp,128
    beq a4, a5, 2f; # if a4 == a5 then 2f
 130:	04090103          	lb	sp,64(s2)
    sw zero, 0(a5) # 
 134:	0100                	addi	s0,sp,128
 136:	02090103          	lb	sp,32(s2)
    blt a5, a4, 1b # if a5 < a4 then 1b
 13a:	0100                	addi	s0,sp,128
 13c:	04090303          	lb	t1,64(s2)
    la a5, _data_section_lma_start # 
 140:	0100                	addi	s0,sp,128
 142:	0209                	addi	tp,tp,2
    la a4, _data_section_vma_start # 
 144:	0000                	unimp
 146:	0101                	addi	sp,sp,0
 148:	006e                	c.slli	zero,0x1b
 14a:	0000                	unimp
    la a3, _data_section_vma_end # 
 14c:	00220003          	lb	zero,2(tp) # 2 <my_start+0x2>
 150:	0000                	unimp
 152:	0101                	addi	sp,sp,0
    beq a4, a3, 2f # if a4 == a3 then 1f
 154:	000d0efb          	0xd0efb
    lw t0, 0(a5) #
 158:	0101                	addi	sp,sp,0
 15a:	0101                	addi	sp,sp,0
    sw t0, 0(a4) #
 15c:	0000                	unimp
 15e:	0100                	addi	s0,sp,128
    addi a4, a4, 4; # a4 = a4 + 4
 160:	0000                	unimp
    addi a5, a5, 4; # a5 = a5 + 4
 162:	0001                	nop
    blt a4, a3, 1b # if a4 < a3 then 1b
 164:	6f6c                	flw	fa1,92(a4)
 166:	6461                	lui	s0,0x18
    ret
 168:	645f 7461 2e61      	0x2e617461645f
 16e:	00000053          	fadd.s	ft0,ft0,ft0,rne
 172:	0000                	unimp
 174:	0500                	addi	s0,sp,640
 176:	4002                	0x4002
 178:	0001                	nop
 17a:	0300                	addi	s0,sp,384
 17c:	0110                	addi	a2,sp,128
 17e:	04090103          	lb	sp,64(s2)
 182:	0100                	addi	s0,sp,128
 184:	08090103          	lb	sp,128(s2)
 188:	0100                	addi	s0,sp,128
 18a:	08090803          	lb	a6,128(s2)
 18e:	0100                	addi	s0,sp,128
 190:	04090703          	lb	a4,64(s2)
 194:	0100                	addi	s0,sp,128
 196:	04090103          	lb	sp,64(s2)
 19a:	0100                	addi	s0,sp,128
 19c:	04090103          	lb	sp,64(s2)
 1a0:	0100                	addi	s0,sp,128
 1a2:	02090103          	lb	sp,32(s2)
 1a6:	0100                	addi	s0,sp,128
 1a8:	02090103          	lb	sp,32(s2)
 1ac:	0100                	addi	s0,sp,128
 1ae:	04090203          	lb	tp,64(s2)
 1b2:	0100                	addi	s0,sp,128
 1b4:	0209                	addi	tp,tp,2
 1b6:	0000                	unimp
 1b8:	0101                	addi	sp,sp,0
 1ba:	00a6                	slli	ra,ra,0x9
 1bc:	0000                	unimp
 1be:	001e0003          	lb	zero,1(t3) # 1a001 <__sram_size+0x19901>
 1c2:	0000                	unimp
 1c4:	0101                	addi	sp,sp,0
 1c6:	000d0efb          	0xd0efb
 1ca:	0101                	addi	sp,sp,0
 1cc:	0101                	addi	sp,sp,0
 1ce:	0000                	unimp
 1d0:	0100                	addi	s0,sp,128
 1d2:	0000                	unimp
 1d4:	0001                	nop
 1d6:	72617473          	csrrci	s0,0x726,2
 1da:	2e74                	fld	fa3,216(a2)
 1dc:	00000053          	fadd.s	ft0,ft0,ft0,rne
 1e0:	0000                	unimp
 1e2:	0500                	addi	s0,sp,640
 1e4:	0002                	c.slli64	zero
 1e6:	0000                	unimp
 1e8:	0300                	addi	s0,sp,384
 1ea:	0110                	addi	a2,sp,128
 1ec:	02090103          	lb	sp,32(s2)
 1f0:	0100                	addi	s0,sp,128
 1f2:	02090103          	lb	sp,32(s2)
 1f6:	0100                	addi	s0,sp,128
 1f8:	02090103          	lb	sp,32(s2)
 1fc:	0100                	addi	s0,sp,128
 1fe:	02090103          	lb	sp,32(s2)
 202:	0100                	addi	s0,sp,128
 204:	02090103          	lb	sp,32(s2)
 208:	0100                	addi	s0,sp,128
 20a:	02090103          	lb	sp,32(s2)
 20e:	0100                	addi	s0,sp,128
 210:	02090103          	lb	sp,32(s2)
 214:	0100                	addi	s0,sp,128
 216:	02090103          	lb	sp,32(s2)
 21a:	0100                	addi	s0,sp,128
 21c:	02090103          	lb	sp,32(s2)
 220:	0100                	addi	s0,sp,128
 222:	02090103          	lb	sp,32(s2)
 226:	0100                	addi	s0,sp,128
 228:	02090103          	lb	sp,32(s2)
 22c:	0100                	addi	s0,sp,128
 22e:	02090103          	lb	sp,32(s2)
 232:	0100                	addi	s0,sp,128
 234:	02090103          	lb	sp,32(s2)
 238:	0100                	addi	s0,sp,128
 23a:	02090103          	lb	sp,32(s2)
 23e:	0100                	addi	s0,sp,128
 240:	02090303          	lb	t1,32(s2)
 244:	0100                	addi	s0,sp,128
 246:	08090303          	lb	t1,128(s2)
 24a:	0100                	addi	s0,sp,128
 24c:	02090103          	lb	sp,32(s2)
 250:	0100                	addi	s0,sp,128
 252:	04090103          	lb	sp,64(s2)
 256:	0100                	addi	s0,sp,128
 258:	04090303          	lb	t1,64(s2)
 25c:	0100                	addi	s0,sp,128
 25e:	0209                	addi	tp,tp,2
 260:	0000                	unimp
 262:	0101                	addi	sp,sp,0

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
  1a:	612d7663          	bgeu	s10,s2,626 <_data_section_lma_start+0x422>
    la sp, _my_stack_start # sp = _my_stack_start
  1e:	302f6d73          	csrrsi	s10,medeleg,30
  22:	2d31                	jal	63e <_data_section_lma_start+0x43a>
  24:	6e69                	lui	t3,0x1a
    call load_data  # load data from flash to sram
  26:	75727473          	csrrci	s0,0x757,4
    jal init_bss  # jump to init_bss and save position to ra
  2a:	6f697463          	bgeu	s2,s6,712 <__sram_size+0x12>
    j main  # jump to main
  2e:	2d6e                	fld	fs10,216(sp)
    nop
  30:	7566                	flw	fa0,120(sp)
        int k, int l, int m) {
  32:	746e                	flw	fs0,248(sp)
  34:	6f69                	lui	t5,0x1a
  36:	2f6e                	fld	ft10,216(sp)
  38:	3131                	jal	fffffc44 <_my_stack_start+0xdffff444>
  3a:	652d                	lui	a0,0xb
  3c:	6578                	flw	fa4,76(a0)
  3e:	6372                	flw	ft6,28(sp)
  40:	7369                	lui	t1,0xffffa
  42:	2f65                	jal	7fa <__sram_size+0xfa>
  44:	3230                	fld	fa2,96(a2)
  46:	722d                	lui	tp,0xfffeb
  48:	6165                	addi	sp,sp,112
  4a:	7964                	flw	fs1,116(a0)
  4c:	432d                	li	t1,11
  4e:	2d35302f          	0x2d35302f
  52:	7266                	flw	ft4,120(sp)
  sum = (a + b + c + d + e + f - g - h - i) * j * k;
  54:	6d61                	lui	s10,0x18
  56:	0065                	c.nop	25
  58:	6572                	flw	fa0,28(sp)
  5a:	746c7573          	csrrci	a0,0x746,24
  5e:	6d00                	flw	fs0,24(a0)
  60:	6961                	lui	s2,0x18
  62:	2e6e                	fld	ft8,216(sp)
  64:	4e470063          	beq	a4,tp,544 <_data_section_lma_start+0x340>
  68:	2055                	jal	10c <__stack_size+0xc>
  6a:	20393943          	fmadd.s	fs2,fs2,ft3,ft4,rup
  6e:	2e38                	fld	fa4,88(a2)
  70:	2e32                	fld	ft8,264(sp)
  72:	2030                	fld	fa2,64(s0)
  74:	6d2d                	lui	s10,0xb
  76:	7261                	lui	tp,0xffff8
  78:	723d6863          	bltu	s10,gp,7a8 <__sram_size+0xa8>
  7c:	3376                	fld	ft6,376(sp)
  7e:	6532                	flw	fa0,12(sp)
  80:	6d2d2063          	0x6d2d2063
  84:	6261                	lui	tp,0x18
  86:	3d69                	jal	ffffff20 <_my_stack_start+0xdffff720>
  88:	6c69                	lui	s8,0x1a
  8a:	3370                	fld	fa2,224(a4)
  8c:	6532                	flw	fa0,12(sp)
  8e:	2d20                	fld	fs0,88(a0)
  90:	4f2d2067          	0x4f2d2067
  94:	2030                	fld	fa2,64(s0)
  96:	732d                	lui	t1,0xfffeb
  sum = sum * m / l;
  98:	6474                	flw	fa3,76(s0)
  9a:	673d                	lui	a4,0xf
  9c:	756e                	flw	fa0,248(sp)
  9e:	3939                	jal	fffffcbc <_my_stack_start+0xdffff4bc>
  a0:	2d20                	fld	fs0,88(a0)
  a2:	6e66                	flw	ft8,88(sp)
  a4:	75622d6f          	jal	s10,227fa <__sram_size+0x220fa>
  a8:	6c69                	lui	s8,0x1a
  aa:	6974                	flw	fa3,84(a0)
  ac:	206e                	fld	ft0,216(sp)
  return sum;
  ae:	662d                	lui	a2,0xb
  b0:	6f6e                	flw	ft10,216(sp)
}
  b2:	622d                	lui	tp,0xb
  b4:	6975                	lui	s2,0x1d
  b6:	746c                	flw	fa1,108(s0)
  b8:	6e69                	lui	t3,0x1a
  ba:	2a2d                	jal	1f4 <__modsi3+0x18>
  bc:	2d20                	fld	fs0,88(a0)
int main(void) {
  be:	7366                	flw	ft6,120(sp)
  c0:	6769                	lui	a4,0x1a
  c2:	656e                	flw	fa0,216(sp)
  c4:	2d64                	fld	fs1,216(a0)
  c6:	72616863          	bltu	sp,t1,7f6 <__sram_size+0xf6>
  e = 3, g = 21, l = 5;
  ca:	2d20                	fld	fs0,88(a0)
  cc:	6666                	flw	fa2,88(sp)
  ce:	6e75                	lui	t3,0x1d
  d0:	6f697463          	bgeu	s2,s6,7b8 <__sram_size+0xb8>
  d4:	2d6e                	fld	fs10,216(sp)
  d6:	74636573          	csrrsi	a0,0x746,6
  result = foo(10, 9, 8, 15, e, 20, g, 0, -13, 41, 29, l, 51);
  da:	6f69                	lui	t5,0x1a
  dc:	736e                	flw	ft6,248(sp)
  de:	2d20                	fld	fs0,88(a0)
  e0:	6466                	flw	fs0,88(sp)
  e2:	7461                	lui	s0,0xffff8
  e4:	2d61                	jal	77c <__sram_size+0x7c>
  e6:	74636573          	csrrsi	a0,0x746,6
  ea:	6f69                	lui	t5,0x1a
  ec:	736e                	flw	ft6,248(sp)
  ee:	2d20                	fld	fs0,88(a0)
  f0:	6e66                	flw	ft8,88(sp)
  f2:	6f632d6f          	jal	s10,327e8 <__sram_size+0x320e8>
  f6:	6d6d                	lui	s10,0x1b
  f8:	6d006e6f          	jal	t3,67c8 <__sram_size+0x60c8>
  fc:	6961                	lui	s2,0x18
  fe:	006e                	c.slli	zero,0x1b
 100:	6e69                	lui	t3,0x1a
 102:	7469                	lui	s0,0xffffa
 104:	625f 7373 532e      	0x532e7373625f
 10a:	4700                	lw	s0,8(a4)
 10c:	554e                	lw	a0,240(sp)
 10e:	4120                	lw	s0,64(a0)
  return result;
 110:	2e322053          	0x2e322053
 114:	6c003233          	0x6c003233
 118:	5f64616f          	jal	sp,4670e <__sram_size+0x4600e>
 11c:	6164                	flw	fs1,68(a0)
 11e:	6174                	flw	fa3,68(a0)
    la a5, _bss_data_start # 
 120:	532e                	lw	t1,232(sp)
 122:	7300                	flw	fs0,32(a4)
 124:	6174                	flw	fa3,68(a0)
 126:	7472                	flw	fs0,60(sp)
    la a4, _bss_data_end # 
 128:	532e                	lw	t1,232(sp)
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
   e:	2055                	jal	b2 <foo+0x80>
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
  1c:	008c                	addi	a1,sp,64
    la sp, _my_stack_start # sp = _my_stack_start
  1e:	0000                	unimp
  20:	0e44                	addi	s1,sp,788
  22:	4428                	lw	a0,72(s0)
  24:	0181                	addi	gp,gp,0
    call load_data  # load data from flash to sram
  26:	0288                	addi	a0,sp,320
    jal init_bss  # jump to init_bss and save position to ra
  28:	0c42                	slli	s8,s8,0x10
  2a:	0008                	0x8
    j main  # jump to main
  2c:	7a02                	flw	fs4,32(sp)
  2e:	42c1                	li	t0,16
    nop
  30:	44c8                	lw	a0,12(s1)
        int k, int l, int m) {
  32:	020d                	addi	tp,tp,3
  34:	0020                	addi	s0,sp,8
  36:	0000                	unimp
  38:	0000                	unimp
  3a:	0000                	unimp
  3c:	00be                	slli	ra,ra,0xf
  3e:	0000                	unimp
  40:	0062                	c.slli	zero,0x18
  42:	0000                	unimp
  44:	0e44                	addi	s1,sp,788
  46:	4438                	lw	a4,72(s0)
  48:	0181                	addi	gp,gp,0
  4a:	0288                	addi	a0,sp,320
  4c:	0c42                	slli	s8,s8,0x10
  4e:	0008                	0x8
  50:	5002                	0x5002
  52:	42c1                	li	t0,16
  sum = (a + b + c + d + e + f - g - h - i) * j * k;
  54:	44c8                	lw	a0,12(s1)
  56:	020d                	addi	tp,tp,3
