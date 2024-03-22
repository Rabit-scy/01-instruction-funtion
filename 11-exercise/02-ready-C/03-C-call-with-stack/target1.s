
target.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <my_start>:
   0:	4081                	li	ra,0
   2:	4101                	li	sp,0
   4:	4181                	li	gp,0
   6:	4201                	li	tp,0
   8:	4281                	li	t0,0
   a:	4301                	li	t1,0
   c:	4381                	li	t2,0
   e:	4401                	li	s0,0
  10:	4481                	li	s1,0
  12:	4501                	li	a0,0
  14:	4581                	li	a1,0
  16:	4601                	li	a2,0
  18:	4681                	li	a3,0
  1a:	4701                	li	a4,0
  1c:	4781                	li	a5,0
  1e:	20000117          	auipc	sp,0x20000
  22:	7e210113          	addi	sp,sp,2018 # 20000800 <_my_stack_start>
  26:	2895                	jal	9a <load_data>
  28:	052000ef          	jal	ra,7a <init_bss>
  2c:	0180006f          	j	44 <main>
  30:	0001                	nop

00000032 <sum_0>:
  32:	200007b7          	lui	a5,0x20000
  36:	00078793          	mv	a5,a5
  3a:	4388                	lw	a0,0(a5)
  3c:	00150713          	addi	a4,a0,1
  40:	c398                	sw	a4,0(a5)
  42:	8082                	ret

00000044 <main>:
  44:	1151                	addi	sp,sp,-12
  46:	c406                	sw	ra,8(sp)
  48:	37ed                	jal	32 <sum_0>
  4a:	37e5                	jal	32 <sum_0>
  4c:	37dd                	jal	32 <sum_0>
  4e:	00150713          	addi	a4,a0,1
  52:	200007b7          	lui	a5,0x20000
  56:	00478793          	addi	a5,a5,4 # 20000004 <c.982>
  5a:	4394                	lw	a3,0(a5)
  5c:	9736                	add	a4,a4,a3
  5e:	c398                	sw	a4,0(a5)
  60:	00670693          	addi	a3,a4,6
  64:	01f6d793          	srli	a5,a3,0x1f
  68:	97b6                	add	a5,a5,a3
  6a:	8785                	srai	a5,a5,0x1
  6c:	953a                	add	a0,a0,a4
  6e:	458d                	li	a1,3
  70:	953e                	add	a0,a0,a5
  72:	2889                	jal	c4 <__divsi3>
  74:	40a2                	lw	ra,8(sp)
  76:	0131                	addi	sp,sp,12
  78:	8082                	ret

0000007a <init_bss>:
  7a:	20000797          	auipc	a5,0x20000
  7e:	f8678793          	addi	a5,a5,-122 # 20000000 <_data_section_vma_end>
  82:	20000717          	auipc	a4,0x20000
  86:	f7e70713          	addi	a4,a4,-130 # 20000000 <_data_section_vma_end>
  8a:	00f70763          	beq	a4,a5,98 <init_bss+0x1e>
  8e:	0007a023          	sw	zero,0(a5)
  92:	0791                	addi	a5,a5,4
  94:	fee7cde3          	blt	a5,a4,8e <init_bss+0x14>
  98:	8082                	ret

0000009a <load_data>:
  9a:	14400793          	li	a5,324
  9e:	20000717          	auipc	a4,0x20000
  a2:	f6270713          	addi	a4,a4,-158 # 20000000 <_data_section_vma_end>
  a6:	20000697          	auipc	a3,0x20000
  aa:	f5a68693          	addi	a3,a3,-166 # 20000000 <_data_section_vma_end>
  ae:	00d70a63          	beq	a4,a3,c2 <load_data+0x28>
  b2:	0007a283          	lw	t0,0(a5)
  b6:	00572023          	sw	t0,0(a4)
  ba:	0711                	addi	a4,a4,4
  bc:	0791                	addi	a5,a5,4
  be:	fed74ae3          	blt	a4,a3,b2 <load_data+0x18>
  c2:	8082                	ret

000000c4 <__divsi3>:
  c4:	02054e63          	bltz	a0,100 <__stack_size>
  c8:	0405c363          	bltz	a1,10e <__stack_size+0xe>

000000cc <__udivsi3>:
  cc:	862e                	mv	a2,a1
  ce:	85aa                	mv	a1,a0
  d0:	557d                	li	a0,-1
  d2:	c215                	beqz	a2,f6 <__udivsi3+0x2a>
  d4:	4685                	li	a3,1
  d6:	00b67863          	bgeu	a2,a1,e6 <__udivsi3+0x1a>
  da:	00c05663          	blez	a2,e6 <__udivsi3+0x1a>
  de:	0606                	slli	a2,a2,0x1
  e0:	0686                	slli	a3,a3,0x1
  e2:	feb66ce3          	bltu	a2,a1,da <__udivsi3+0xe>
  e6:	4501                	li	a0,0
  e8:	00c5e463          	bltu	a1,a2,f0 <__udivsi3+0x24>
  ec:	8d91                	sub	a1,a1,a2
  ee:	8d55                	or	a0,a0,a3
  f0:	8285                	srli	a3,a3,0x1
  f2:	8205                	srli	a2,a2,0x1
  f4:	faf5                	bnez	a3,e8 <__udivsi3+0x1c>
  f6:	8082                	ret

000000f8 <__umodsi3>:
  f8:	8286                	mv	t0,ra
  fa:	3fc9                	jal	cc <__udivsi3>
  fc:	852e                	mv	a0,a1
  fe:	8282                	jr	t0
 100:	40a00533          	neg	a0,a0
 104:	0005d763          	bgez	a1,112 <__stack_size+0x12>
 108:	40b005b3          	neg	a1,a1
 10c:	b7c1                	j	cc <__udivsi3>
 10e:	40b005b3          	neg	a1,a1
 112:	8286                	mv	t0,ra
 114:	3f65                	jal	cc <__udivsi3>
 116:	40a00533          	neg	a0,a0
 11a:	8282                	jr	t0

0000011c <__modsi3>:
 11c:	8286                	mv	t0,ra
 11e:	0005c763          	bltz	a1,12c <__modsi3+0x10>
 122:	00054963          	bltz	a0,134 <__modsi3+0x18>
 126:	375d                	jal	cc <__udivsi3>
 128:	852e                	mv	a0,a1
 12a:	8282                	jr	t0
 12c:	40b005b3          	neg	a1,a1
 130:	fe055be3          	bgez	a0,126 <__modsi3+0xa>
 134:	40a00533          	neg	a0,a0
 138:	3f51                	jal	cc <__udivsi3>
 13a:	40b00533          	neg	a0,a1
 13e:	8282                	jr	t0
 140:	0000                	unimp
	...
