
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
  26:	22e9                	jal	1f0 <load_data>
  28:	1a8000ef          	jal	ra,1d0 <init_bss>
  2c:	0060006f          	j	32 <main>
  30:	0001                	nop

00000032 <main>:
  32:	fdc10113          	addi	sp,sp,-36
  36:	d006                	sw	ra,32(sp)
  38:	ce22                	sw	s0,28(sp)
  3a:	1040                	addi	s0,sp,36
  3c:	fe042823          	sw	zero,-16(s0)
  40:	fc042e23          	sw	zero,-36(s0)
  44:	fe042023          	sw	zero,-32(s0)
  48:	fe042223          	sw	zero,-28(s0)
  4c:	fe042423          	sw	zero,-24(s0)
  50:	fe042623          	sw	zero,-20(s0)
  54:	2061                	jal	dc <sum_0>
  56:	87aa                	mv	a5,a0
  58:	fcf42e23          	sw	a5,-36(s0)
  5c:	2041                	jal	dc <sum_0>
  5e:	87aa                	mv	a5,a0
  60:	fcf42e23          	sw	a5,-36(s0)
  64:	28a5                	jal	dc <sum_0>
  66:	87aa                	mv	a5,a0
  68:	fcf42e23          	sw	a5,-36(s0)
  6c:	fdc42783          	lw	a5,-36(s0)
  70:	0785                	addi	a5,a5,1
  72:	fef42823          	sw	a5,-16(s0)
  76:	ff042503          	lw	a0,-16(s0)
  7a:	2051                	jal	fe <sum_double>
  7c:	87aa                	mv	a5,a0
  7e:	fef42023          	sw	a5,-32(s0)
  82:	4795                	li	a5,5
  84:	fef42823          	sw	a5,-16(s0)
  88:	fe042703          	lw	a4,-32(s0)
  8c:	ff042783          	lw	a5,-16(s0)
  90:	0785                	addi	a5,a5,1
  92:	85be                	mv	a1,a5
  94:	853a                	mv	a0,a4
  96:	2861                	jal	12e <sum_2>
  98:	87aa                	mv	a5,a0
  9a:	fef42223          	sw	a5,-28(s0)
  9e:	fdc42783          	lw	a5,-36(s0)
  a2:	fe042703          	lw	a4,-32(s0)
  a6:	fe442683          	lw	a3,-28(s0)
  aa:	8636                	mv	a2,a3
  ac:	85ba                	mv	a1,a4
  ae:	853e                	mv	a0,a5
  b0:	205d                	jal	156 <sum_3>
  b2:	87aa                	mv	a5,a0
  b4:	fef42423          	sw	a5,-24(s0)
  b8:	fdc42783          	lw	a5,-36(s0)
  bc:	fe442703          	lw	a4,-28(s0)
  c0:	85ba                	mv	a1,a4
  c2:	853e                	mv	a0,a5
  c4:	20e1                	jal	18c <double_2>
  c6:	87aa                	mv	a5,a0
  c8:	fef42623          	sw	a5,-20(s0)
  cc:	fe842783          	lw	a5,-24(s0)
  d0:	853e                	mv	a0,a5
  d2:	5082                	lw	ra,32(sp)
  d4:	4472                	lw	s0,28(sp)
  d6:	02410113          	addi	sp,sp,36
  da:	8082                	ret

000000dc <sum_0>:
  dc:	1171                	addi	sp,sp,-4
  de:	c022                	sw	s0,0(sp)
  e0:	0040                	addi	s0,sp,4
  e2:	200007b7          	lui	a5,0x20000
  e6:	0007a783          	lw	a5,0(a5) # 20000000 <_data_section_vma_end>
  ea:	00178693          	addi	a3,a5,1
  ee:	20000737          	lui	a4,0x20000
  f2:	00d72023          	sw	a3,0(a4) # 20000000 <_data_section_vma_end>
  f6:	853e                	mv	a0,a5
  f8:	4402                	lw	s0,0(sp)
  fa:	0111                	addi	sp,sp,4
  fc:	8082                	ret

000000fe <sum_double>:
  fe:	1161                	addi	sp,sp,-8
 100:	c222                	sw	s0,4(sp)
 102:	0020                	addi	s0,sp,8
 104:	fea42c23          	sw	a0,-8(s0)
 108:	200007b7          	lui	a5,0x20000
 10c:	0047a703          	lw	a4,4(a5) # 20000004 <c.985>
 110:	ff842783          	lw	a5,-8(s0)
 114:	973e                	add	a4,a4,a5
 116:	200007b7          	lui	a5,0x20000
 11a:	00e7a223          	sw	a4,4(a5) # 20000004 <c.985>
 11e:	200007b7          	lui	a5,0x20000
 122:	0047a783          	lw	a5,4(a5) # 20000004 <c.985>
 126:	853e                	mv	a0,a5
 128:	4412                	lw	s0,4(sp)
 12a:	0121                	addi	sp,sp,8
 12c:	8082                	ret

0000012e <my_callee>:
  /* push my_callee's register(Callee) to stack */
 12e:	1151                	addi	sp,sp,-12
 130:	c422                	sw	s0,8(sp)
 132:	0060                	addi	s0,sp,12
  /* push my_caller's register(Caller) to stack in here!!!!*/
 134:	fea42c23          	sw	a0,-8(s0)
 138:	feb42a23          	sw	a1,-12(s0)

 13c:	ff842703          	lw	a4,-8(s0)
 140:	ff442783          	lw	a5,-12(s0)
 144:	97ba                	add	a5,a5,a4
 146:	01f7d713          	srli	a4,a5,0x1f
 14a:	97ba                	add	a5,a5,a4
 14c:	8785                	srai	a5,a5,0x1
 14e:	853e                	mv	a0,a5
 150:	4422                	lw	s0,8(sp)
 152:	0131                	addi	sp,sp,12
 154:	8082                	ret

00000156 <sum_3>:
 156:	1121                	addi	sp,sp,-24
 158:	ca06                	sw	ra,20(sp)
 15a:	c822                	sw	s0,16(sp)
 15c:	0820                	addi	s0,sp,24
 15e:	fea42823          	sw	a0,-16(s0)
 162:	feb42623          	sw	a1,-20(s0)
 166:	fec42423          	sw	a2,-24(s0)
 16a:	ff042703          	lw	a4,-16(s0)
 16e:	fec42783          	lw	a5,-20(s0)
 172:	973e                	add	a4,a4,a5
 174:	fe842783          	lw	a5,-24(s0)
 178:	97ba                	add	a5,a5,a4
 17a:	458d                	li	a1,3
 17c:	853e                	mv	a0,a5
 17e:	2879                	jal	21c <__divsi3>
 180:	87aa                	mv	a5,a0
 182:	853e                	mv	a0,a5
 184:	40d2                	lw	ra,20(sp)
 186:	4442                	lw	s0,16(sp)
 188:	0161                	addi	sp,sp,24
 18a:	8082                	ret

0000018c <my_caller>:
/* */
 18c:	1121                	addi	sp,sp,-24
 18e:	ca06                	sw	ra,20(sp)
 190:	c822                	sw	s0,16(sp)
 192:	0820                	addi	s0,sp,24

 194:	fea42623          	sw	a0,-20(s0)
 198:	feb42423          	sw	a1,-24(s0)
  /* local variable init zero*/
 19c:	fe042823          	sw	zero,-16(s0)
  /*mv argument to a0~a1, only two argument */
 1a0:	fe842583          	lw	a1,-24(s0)
 1a4:	fec42503          	lw	a0,-20(s0)
 1a8:	3759                	jal	12e <my_callee>
 1aa:	fea42823          	sw	a0,-16(s0)
 1ae:	ff042703          	lw	a4,-16(s0)
 1b2:	fec42783          	lw	a5,-20(s0)
 1b6:	97ba                	add	a5,a5,a4
 1b8:	fe842703          	lw	a4,-24(s0)
 1bc:	97ba                	add	a5,a5,a4
 1be:	fef42823          	sw	a5,-16(s0)
 1c2:	ff042783          	lw	a5,-16(s0)
 1c6:	853e                	mv	a0,a5
 1c8:	40d2                	lw	ra,20(sp)
 1ca:	4442                	lw	s0,16(sp)
 1cc:	0161                	addi	sp,sp,24
 1ce:	8082                	ret

000001d0 <init_bss>:
 1d0:	20000797          	auipc	a5,0x20000
 1d4:	e3078793          	addi	a5,a5,-464 # 20000000 <_data_section_vma_end>
 1d8:	20000717          	auipc	a4,0x20000
 1dc:	e2870713          	addi	a4,a4,-472 # 20000000 <_data_section_vma_end>
 1e0:	00f70763          	beq	a4,a5,1ee <init_bss+0x1e>
 1e4:	0007a023          	sw	zero,0(a5)
 1e8:	0791                	addi	a5,a5,4
 1ea:	fee7cde3          	blt	a5,a4,1e4 <init_bss+0x14>
 1ee:	8082                	ret

000001f0 <load_data>:
 1f0:	29c00793          	li	a5,668
 1f4:	20000717          	auipc	a4,0x20000
 1f8:	e0c70713          	addi	a4,a4,-500 # 20000000 <_data_section_vma_end>
 1fc:	20000697          	auipc	a3,0x20000
 200:	e0468693          	addi	a3,a3,-508 # 20000000 <_data_section_vma_end>
 204:	00d70a63          	beq	a4,a3,218 <load_data+0x28>
 208:	0007a283          	lw	t0,0(a5)
 20c:	00572023          	sw	t0,0(a4)
 210:	0711                	addi	a4,a4,4
 212:	0791                	addi	a5,a5,4
 214:	fed74ae3          	blt	a4,a3,208 <load_data+0x18>
 218:	8082                	ret
	...

0000021c <__divsi3>:
 21c:	02054e63          	bltz	a0,258 <__umodsi3+0x8>
 220:	0405c363          	bltz	a1,266 <__umodsi3+0x16>

00000224 <__udivsi3>:
 224:	862e                	mv	a2,a1
 226:	85aa                	mv	a1,a0
 228:	557d                	li	a0,-1
 22a:	c215                	beqz	a2,24e <__udivsi3+0x2a>
 22c:	4685                	li	a3,1
 22e:	00b67863          	bgeu	a2,a1,23e <__udivsi3+0x1a>
 232:	00c05663          	blez	a2,23e <__udivsi3+0x1a>
 236:	0606                	slli	a2,a2,0x1
 238:	0686                	slli	a3,a3,0x1
 23a:	feb66ce3          	bltu	a2,a1,232 <__udivsi3+0xe>
 23e:	4501                	li	a0,0
 240:	00c5e463          	bltu	a1,a2,248 <__udivsi3+0x24>
 244:	8d91                	sub	a1,a1,a2
 246:	8d55                	or	a0,a0,a3
 248:	8285                	srli	a3,a3,0x1
 24a:	8205                	srli	a2,a2,0x1
 24c:	faf5                	bnez	a3,240 <__udivsi3+0x1c>
 24e:	8082                	ret

00000250 <__umodsi3>:
 250:	8286                	mv	t0,ra
 252:	3fc9                	jal	224 <__udivsi3>
 254:	852e                	mv	a0,a1
 256:	8282                	jr	t0
 258:	40a00533          	neg	a0,a0
 25c:	0005d763          	bgez	a1,26a <__umodsi3+0x1a>
 260:	40b005b3          	neg	a1,a1
 264:	b7c1                	j	224 <__udivsi3>
 266:	40b005b3          	neg	a1,a1
 26a:	8286                	mv	t0,ra
 26c:	3f65                	jal	224 <__udivsi3>
 26e:	40a00533          	neg	a0,a0
 272:	8282                	jr	t0

00000274 <__modsi3>:
 274:	8286                	mv	t0,ra
 276:	0005c763          	bltz	a1,284 <__modsi3+0x10>
 27a:	00054963          	bltz	a0,28c <__modsi3+0x18>
 27e:	375d                	jal	224 <__udivsi3>
 280:	852e                	mv	a0,a1
 282:	8282                	jr	t0
 284:	40b005b3          	neg	a1,a1
 288:	fe055be3          	bgez	a0,27e <__modsi3+0xa>
 28c:	40a00533          	neg	a0,a0
 290:	3f51                	jal	224 <__udivsi3>
 292:	40b00533          	neg	a0,a1
 296:	8282                	jr	t0
 298:	0000                	unimp
	...




0000018c <double_2>:
  /*alloc stack */

  /* push Caller register to stack*/
 194:	fea42623          	sw	a0,16(sp)
 198:	feb42423          	sw	a1,20(sp)

  /* push Callee register to stack */
 18e:	ca06                sw	ra,20(sp)
 190:	c822                sw	s0,16(sp)

 192:	0820                addi	s0,sp,24
 18c:	1121                addi	sp,sp,-24

 19c:	fe042823          	sw	zero,-16(s0)


 1a0:	fe842583          	lw	a1,-24(s0)
 1a4:	fec42503          	lw	a0,-20(s0)
 1a8:	3759                	jal	12e <sum_2>



 1aa:	fea42823          	sw	a0,-16(s0)
 1ae:	ff042703          	lw	a4,-16(s0)
 1b2:	fec42783          	lw	a5,-20(s0)
 1b6:	97ba                	add	a5,a5,a4
 1b8:	fe842703          	lw	a4,-24(s0)
 1bc:	97ba                	add	a5,a5,a4
 1be:	fef42823          	sw	a5,-16(s0)
 1c2:	ff042783          	lw	a5,-16(s0)
 1c6:	853e                	mv	a0,a5
 1c8:	40d2                	lw	ra,20(sp)
 1ca:	4442                	lw	s0,16(sp)
 1cc:	0161                	addi	sp,sp,24
 1ce:	8082                	ret
