
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
  26:	22ad                	jal	190 <load_data>
  28:	148000ef          	jal	ra,170 <init_bss>
  2c:	0060006f          	j	32 <main>
  30:	0001                	nop

00000032 <main>:
  32:	1101                	addi	sp,sp,-32
  34:	ce06                	sw	ra,28(sp)
  36:	cc22                	sw	s0,24(sp)
  38:	1000                	addi	s0,sp,32
  3a:	fe042823          	sw	zero,-16(s0)
  3e:	fe042023          	sw	zero,-32(s0)
  42:	fe042223          	sw	zero,-28(s0)
  46:	fe042423          	sw	zero,-24(s0)
  4a:	fe042623          	sw	zero,-20(s0)
  4e:	288d                	jal	c0 <sum_0>
  50:	87aa                	mv	a5,a0
  52:	fef42023          	sw	a5,-32(s0)
  56:	20ad                	jal	c0 <sum_0>
  58:	87aa                	mv	a5,a0
  5a:	fef42023          	sw	a5,-32(s0)
  5e:	208d                	jal	c0 <sum_0>
  60:	87aa                	mv	a5,a0
  62:	fef42023          	sw	a5,-32(s0)
  66:	fe042783          	lw	a5,-32(s0)
  6a:	0785                	addi	a5,a5,1
  6c:	fef42823          	sw	a5,-16(s0)
  70:	ff042503          	lw	a0,-16(s0)
  74:	20bd                	jal	e2 <sum_double>
  76:	87aa                	mv	a5,a0
  78:	fef42223          	sw	a5,-28(s0)
  7c:	4795                	li	a5,5
  7e:	fef42823          	sw	a5,-16(s0)
  82:	fe442703          	lw	a4,-28(s0)
  86:	ff042783          	lw	a5,-16(s0)
  8a:	0785                	addi	a5,a5,1
  8c:	85be                	mv	a1,a5
  8e:	853a                	mv	a0,a4
  90:	2049                	jal	112 <sum_2>
  92:	87aa                	mv	a5,a0
  94:	fef42423          	sw	a5,-24(s0)
  98:	fe042783          	lw	a5,-32(s0)
  9c:	fe442703          	lw	a4,-28(s0)
  a0:	fe842683          	lw	a3,-24(s0)
  a4:	8636                	mv	a2,a3
  a6:	85ba                	mv	a1,a4
  a8:	853e                	mv	a0,a5
  aa:	2841                	jal	13a <sum_3>
  ac:	87aa                	mv	a5,a0
  ae:	fef42623          	sw	a5,-20(s0)
  b2:	fec42783          	lw	a5,-20(s0)
  b6:	853e                	mv	a0,a5
  b8:	40f2                	lw	ra,28(sp)
  ba:	4462                	lw	s0,24(sp)
  bc:	6105                	addi	sp,sp,32
  be:	8082                	ret

000000c0 <sum_0>:
  c0:	1171                	addi	sp,sp,-4
  c2:	c022                	sw	s0,0(sp)
  c4:	0040                	addi	s0,sp,4
  c6:	200007b7          	lui	a5,0x20000
  ca:	0007a783          	lw	a5,0(a5) # 20000000 <_data_section_vma_end>
  ce:	00178693          	addi	a3,a5,1
  d2:	20000737          	lui	a4,0x20000
  d6:	00d72023          	sw	a3,0(a4) # 20000000 <_data_section_vma_end>
  da:	853e                	mv	a0,a5
  dc:	4402                	lw	s0,0(sp)
  de:	0111                	addi	sp,sp,4
  e0:	8082                	ret

000000e2 <sum_double>:
  e2:	1161                	addi	sp,sp,-8
  e4:	c222                	sw	s0,4(sp)
  e6:	0020                	addi	s0,sp,8
  e8:	fea42c23          	sw	a0,-8(s0)
  ec:	200007b7          	lui	a5,0x20000
  f0:	0047a703          	lw	a4,4(a5) # 20000004 <c.982>
  f4:	ff842783          	lw	a5,-8(s0)
  f8:	973e                	add	a4,a4,a5
  fa:	200007b7          	lui	a5,0x20000
  fe:	00e7a223          	sw	a4,4(a5) # 20000004 <c.982>
 102:	200007b7          	lui	a5,0x20000
 106:	0047a783          	lw	a5,4(a5) # 20000004 <c.982>
 10a:	853e                	mv	a0,a5
 10c:	4412                	lw	s0,4(sp)
 10e:	0121                	addi	sp,sp,8
 110:	8082                	ret

00000112 <sum_2>:
 112:	1151                	addi	sp,sp,-12
 114:	c422                	sw	s0,8(sp)
 116:	0060                	addi	s0,sp,12
 118:	fea42c23          	sw	a0,-8(s0)
 11c:	feb42a23          	sw	a1,-12(s0)
 120:	ff842703          	lw	a4,-8(s0)
 124:	ff442783          	lw	a5,-12(s0)
 128:	97ba                	add	a5,a5,a4
 12a:	01f7d713          	srli	a4,a5,0x1f
 12e:	97ba                	add	a5,a5,a4
 130:	8785                	srai	a5,a5,0x1
 132:	853e                	mv	a0,a5
 134:	4422                	lw	s0,8(sp)
 136:	0131                	addi	sp,sp,12
 138:	8082                	ret

0000013a <sum_3>:
 13a:	1121                	addi	sp,sp,-24
 13c:	ca06                	sw	ra,20(sp)
 13e:	c822                	sw	s0,16(sp)
 140:	0820                	addi	s0,sp,24
 142:	fea42823          	sw	a0,-16(s0)
 146:	feb42623          	sw	a1,-20(s0)
 14a:	fec42423          	sw	a2,-24(s0)
 14e:	ff042703          	lw	a4,-16(s0)
 152:	fec42783          	lw	a5,-20(s0)
 156:	973e                	add	a4,a4,a5
 158:	fe842783          	lw	a5,-24(s0)
 15c:	97ba                	add	a5,a5,a4
 15e:	458d                	li	a1,3
 160:	853e                	mv	a0,a5
 162:	28a9                	jal	1bc <__divsi3>
 164:	87aa                	mv	a5,a0
 166:	853e                	mv	a0,a5
 168:	40d2                	lw	ra,20(sp)
 16a:	4442                	lw	s0,16(sp)
 16c:	0161                	addi	sp,sp,24
 16e:	8082                	ret

00000170 <init_bss>:
 170:	20000797          	auipc	a5,0x20000
 174:	e9078793          	addi	a5,a5,-368 # 20000000 <_data_section_vma_end>
 178:	20000717          	auipc	a4,0x20000
 17c:	e8870713          	addi	a4,a4,-376 # 20000000 <_data_section_vma_end>
 180:	00f70763          	beq	a4,a5,18e <init_bss+0x1e>
 184:	0007a023          	sw	zero,0(a5)
 188:	0791                	addi	a5,a5,4
 18a:	fee7cde3          	blt	a5,a4,184 <init_bss+0x14>
 18e:	8082                	ret

00000190 <load_data>:
 190:	23c00793          	li	a5,572
 194:	20000717          	auipc	a4,0x20000
 198:	e6c70713          	addi	a4,a4,-404 # 20000000 <_data_section_vma_end>
 19c:	20000697          	auipc	a3,0x20000
 1a0:	e6468693          	addi	a3,a3,-412 # 20000000 <_data_section_vma_end>
 1a4:	00d70a63          	beq	a4,a3,1b8 <load_data+0x28>
 1a8:	0007a283          	lw	t0,0(a5)
 1ac:	00572023          	sw	t0,0(a4)
 1b0:	0711                	addi	a4,a4,4
 1b2:	0791                	addi	a5,a5,4
 1b4:	fed74ae3          	blt	a4,a3,1a8 <load_data+0x18>
 1b8:	8082                	ret
	...

000001bc <__divsi3>:
 1bc:	02054e63          	bltz	a0,1f8 <__umodsi3+0x8>
 1c0:	0405c363          	bltz	a1,206 <__umodsi3+0x16>

000001c4 <__udivsi3>:
 1c4:	862e                	mv	a2,a1
 1c6:	85aa                	mv	a1,a0
 1c8:	557d                	li	a0,-1
 1ca:	c215                	beqz	a2,1ee <__udivsi3+0x2a>
 1cc:	4685                	li	a3,1
 1ce:	00b67863          	bgeu	a2,a1,1de <__udivsi3+0x1a>
 1d2:	00c05663          	blez	a2,1de <__udivsi3+0x1a>
 1d6:	0606                	slli	a2,a2,0x1
 1d8:	0686                	slli	a3,a3,0x1
 1da:	feb66ce3          	bltu	a2,a1,1d2 <__udivsi3+0xe>
 1de:	4501                	li	a0,0
 1e0:	00c5e463          	bltu	a1,a2,1e8 <__udivsi3+0x24>
 1e4:	8d91                	sub	a1,a1,a2
 1e6:	8d55                	or	a0,a0,a3
 1e8:	8285                	srli	a3,a3,0x1
 1ea:	8205                	srli	a2,a2,0x1
 1ec:	faf5                	bnez	a3,1e0 <__udivsi3+0x1c>
 1ee:	8082                	ret

000001f0 <__umodsi3>:
 1f0:	8286                	mv	t0,ra
 1f2:	3fc9                	jal	1c4 <__udivsi3>
 1f4:	852e                	mv	a0,a1
 1f6:	8282                	jr	t0
 1f8:	40a00533          	neg	a0,a0
 1fc:	0005d763          	bgez	a1,20a <__umodsi3+0x1a>
 200:	40b005b3          	neg	a1,a1
 204:	b7c1                	j	1c4 <__udivsi3>
 206:	40b005b3          	neg	a1,a1
 20a:	8286                	mv	t0,ra
 20c:	3f65                	jal	1c4 <__udivsi3>
 20e:	40a00533          	neg	a0,a0
 212:	8282                	jr	t0

00000214 <__modsi3>:
 214:	8286                	mv	t0,ra
 216:	0005c763          	bltz	a1,224 <__modsi3+0x10>
 21a:	00054963          	bltz	a0,22c <__modsi3+0x18>
 21e:	375d                	jal	1c4 <__udivsi3>
 220:	852e                	mv	a0,a1
 222:	8282                	jr	t0
 224:	40b005b3          	neg	a1,a1
 228:	fe055be3          	bgez	a0,21e <__modsi3+0xa>
 22c:	40a00533          	neg	a0,a0
 230:	3f51                	jal	1c4 <__udivsi3>
 232:	40b00533          	neg	a0,a1
 236:	8282                	jr	t0
 238:	0000                	unimp
	...

Disassembly of section .sbss.c.978:

20000000 <c.978>:
20000000:	0000                	unimp
	...

Disassembly of section .sbss.c.982:

20000004 <c.982>:
20000004:	0000                	unimp
	...

Disassembly of section .my_stack:

20000700 <_my_stack_start-0x100>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	0000016f          	jal	sp,0 <my_start>
   4:	0004                	0x4
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0104                	addi	s1,sp,128
   c:	0000008f          	0x8f
  10:	880c                	0x880c
	...
  22:	0000                	unimp
  24:	0200                	addi	s0,sp,256
  26:	003c                	addi	a5,sp,8
  28:	0000                	unimp
  2a:	0035                	c.nop	13
  2c:	0000                	unimp
  2e:	00003503          	0x3503
  32:	0200                	addi	s0,sp,256
  34:	0400                	addi	s0,sp,512
  36:	0704                	addi	s1,sp,896
  38:	0064                	addi	s1,sp,12
  3a:	0000                	unimp
  3c:	0405                	addi	s0,s0,1
  3e:	6905                	lui	s2,0x1
  40:	746e                	flw	fs0,248(sp)
  42:	0600                	addi	s0,sp,768
  44:	0124                	addi	s1,sp,136
  46:	0000                	unimp
  48:	0801                	addi	a6,a6,0
  4a:	2505                	jal	66a <_data_section_lma_start+0x42e>
  4c:	0000                	unimp
  4e:	0500                	addi	s0,sp,640
  50:	00000003          	lb	zero,0(zero) # 0 <my_start>
  54:	0700                	addi	s0,sp,896
  56:	007c                	addi	a5,sp,12
  58:	0000                	unimp
  5a:	2501                	jal	65a <_data_section_lma_start+0x41e>
  5c:	3c05                	jal	fffffa8c <_my_stack_start+0xdffff28c>
  5e:	0000                	unimp
  60:	3a00                	fld	fs0,48(a2)
  62:	0001                	nop
  64:	3600                	fld	fs0,40(a2)
  66:	0000                	unimp
  68:	0100                	addi	s0,sp,128
  6a:	979c                	0x979c
  6c:	0000                	unimp
  6e:	0800                	addi	s0,sp,16
  70:	0061                	c.nop	24
  72:	2501                	jal	672 <_data_section_lma_start+0x436>
  74:	00003c0f          	0x3c0f
  78:	0200                	addi	s0,sp,256
  7a:	7091                	lui	ra,0xfffe4
  7c:	6208                	flw	fa0,0(a2)
  7e:	0100                	addi	s0,sp,128
  80:	1625                	addi	a2,a2,-23
  82:	003c                	addi	a5,sp,8
  84:	0000                	unimp
  86:	9102                	jalr	sp
  88:	086c                	addi	a1,sp,28
  8a:	25010063          	beq	sp,a6,2ca <_data_section_lma_start+0x8e>
  8e:	3c1d                	jal	fffffac4 <_my_stack_start+0xdffff2c4>
  90:	0000                	unimp
  92:	0200                	addi	s0,sp,256
  94:	6891                	lui	a7,0x4
  96:	0900                	addi	s0,sp,144
  98:	0082                	c.slli64	ra
  9a:	0000                	unimp
  9c:	2401                	jal	29c <_data_section_lma_start+0x60>
  9e:	3c05                	jal	ffffface <_my_stack_start+0xdffff2ce>
  a0:	0000                	unimp
  a2:	1200                	addi	s0,sp,288
  a4:	0001                	nop
  a6:	2800                	fld	fs0,16(s0)
  a8:	0000                	unimp
  aa:	0100                	addi	s0,sp,128
  ac:	cc9c                	sw	a5,24(s1)
  ae:	0000                	unimp
  b0:	0800                	addi	s0,sp,16
  b2:	0061                	c.nop	24
  b4:	2401                	jal	2b4 <_data_section_lma_start+0x78>
  b6:	00003c0f          	0x3c0f
  ba:	0200                	addi	s0,sp,256
  bc:	7891                	lui	a7,0xfffe4
  be:	6208                	flw	fa0,0(a2)
  c0:	0100                	addi	s0,sp,128
  c2:	1624                	addi	s1,sp,808
  c4:	003c                	addi	a5,sp,8
  c6:	0000                	unimp
  c8:	9102                	jalr	sp
  ca:	0074                	addi	a3,sp,12
  cc:	2c09                	jal	2de <_data_section_lma_start+0xa2>
  ce:	0001                	nop
  d0:	0100                	addi	s0,sp,128
  d2:	051e                	slli	a0,a0,0x7
  d4:	003c                	addi	a5,sp,8
  d6:	0000                	unimp
  d8:	00e2                	slli	ra,ra,0x18
  da:	0000                	unimp
  dc:	0030                	addi	a2,sp,8
  de:	0000                	unimp
  e0:	9c01                	0x9c01
  e2:	0104                	addi	s1,sp,128
  e4:	0000                	unimp
  e6:	6108                	flw	fa0,0(a0)
  e8:	0100                	addi	s0,sp,128
  ea:	141e                	slli	s0,s0,0x27
  ec:	003c                	addi	a5,sp,8
  ee:	0000                	unimp
  f0:	9102                	jalr	sp
  f2:	0a78                	addi	a4,sp,284
  f4:	1f010063          	beq	sp,a6,2d4 <_data_section_lma_start+0x98>
  f8:	3c0e                	fld	fs8,224(sp)
  fa:	0000                	unimp
  fc:	0500                	addi	s0,sp,640
  fe:	00000403          	lb	s0,0(zero) # 0 <my_start>
 102:	0020                	addi	s0,sp,8
 104:	7609                	lui	a2,0xfffe2
 106:	0000                	unimp
 108:	0100                	addi	s0,sp,128
 10a:	051a                	slli	a0,a0,0x6
 10c:	003c                	addi	a5,sp,8
 10e:	0000                	unimp
 110:	00c0                	addi	s0,sp,68
 112:	0000                	unimp
 114:	0022                	c.slli	zero,0x8
 116:	0000                	unimp
 118:	9c01                	0x9c01
 11a:	0000012f          	0x12f
 11e:	630a                	flw	ft6,128(sp)
 120:	0100                	addi	s0,sp,128
 122:	003c0e1b          	0x3c0e1b
 126:	0000                	unimp
 128:	0305                	addi	t1,t1,1
 12a:	0000                	unimp
 12c:	2000                	fld	fs0,0(s0)
 12e:	0700                	addi	s0,sp,896
 130:	0071                	c.nop	28
 132:	0000                	unimp
 134:	0a01                	addi	s4,s4,0
 136:	3c05                	jal	fffffb66 <_my_stack_start+0xdffff366>
 138:	0000                	unimp
 13a:	3200                	fld	fs0,32(a2)
 13c:	0000                	unimp
 13e:	8e00                	0x8e00
 140:	0000                	unimp
 142:	0100                	addi	s0,sp,128
 144:	669c                	flw	fa5,8(a3)
 146:	0001                	nop
 148:	0a00                	addi	s0,sp,272
 14a:	0069                	c.nop	26
 14c:	0b01                	addi	s6,s6,0
 14e:	00003c07          	fld	fs8,0(zero) # 0 <my_start>
 152:	0200                	addi	s0,sp,256
 154:	7091                	lui	ra,0xfffe4
 156:	730a                	flw	ft6,160(sp)
 158:	6d75                	lui	s10,0x1d
 15a:	0100                	addi	s0,sp,128
 15c:	070c                	addi	a1,sp,896
 15e:	0166                	slli	sp,sp,0x19
 160:	0000                	unimp
 162:	9102                	jalr	sp
 164:	0060                	addi	s0,sp,12
 166:	00003c0b          	0x3c0b
 16a:	0300                	addi	s0,sp,384
 16c:	0035                	c.nop	13
 16e:	0000                	unimp
 170:	22000003          	lb	zero,544(zero) # 220 <__modsi3+0xc>
 174:	0000                	unimp
 176:	0200                	addi	s0,sp,256
 178:	b400                	fsd	fs0,40(s0)
 17a:	0000                	unimp
 17c:	0400                	addi	s0,sp,512
 17e:	7d01                	lui	s10,0xfffe0
 180:	0001                	nop
 182:	7000                	flw	fs0,32(s0)
 184:	0001                	nop
 186:	9000                	0x9000
 188:	0001                	nop
 18a:	3700                	fld	fs0,40(a4)
 18c:	0001                	nop
 18e:	0000                	unimp
 190:	0000                	unimp
 192:	4200                	lw	s0,0(a2)
 194:	0001                	nop
 196:	0100                	addi	s0,sp,128
 198:	2280                	fld	fs0,0(a3)
 19a:	0000                	unimp
 19c:	0200                	addi	s0,sp,256
 19e:	c800                	sw	s0,16(s0)
 1a0:	0000                	unimp
 1a2:	0400                	addi	s0,sp,512
 1a4:	dc01                	beqz	s0,bc <main+0x8a>
 1a6:	0001                	nop
 1a8:	9000                	0x9000
 1aa:	0001                	nop
 1ac:	ba00                	fsd	fs0,48(a2)
 1ae:	0001                	nop
 1b0:	4e00                	lw	s0,24(a2)
 1b2:	0001                	nop
 1b4:	0000                	unimp
 1b6:	0000                	unimp
 1b8:	4200                	lw	s0,0(a2)
 1ba:	0001                	nop
 1bc:	0100                	addi	s0,sp,128
 1be:	2280                	fld	fs0,0(a3)
 1c0:	0000                	unimp
 1c2:	0200                	addi	s0,sp,256
 1c4:	dc00                	sw	s0,56(s0)
 1c6:	0000                	unimp
 1c8:	0400                	addi	s0,sp,512
 1ca:	4e01                	li	t3,0
 1cc:	0002                	c.slli64	zero
 1ce:	0000                	unimp
 1d0:	0000                	unimp
 1d2:	3200                	fld	fs0,32(a2)
 1d4:	0000                	unimp
 1d6:	5a00                	lw	s0,48(a2)
 1d8:	0001                	nop
 1da:	0000                	unimp
 1dc:	0000                	unimp
 1de:	4200                	lw	s0,0(a2)
 1e0:	0001                	nop
 1e2:	0100                	addi	s0,sp,128
 1e4:	80              	Address 0x00000000000001e4 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	1101                	addi	sp,sp,-32
   2:	2501                	jal	602 <_data_section_lma_start+0x3c6>
   4:	130e                	slli	t1,t1,0x23
   6:	1b0e030b          	0x1b0e030b
   a:	550e                	lw	a0,224(sp)
   c:	10011117          	auipc	sp,0x10011
  10:	02000017          	auipc	zero,0x2000
  14:	0101                	addi	sp,sp,0
  16:	1349                	addi	t1,t1,-14
  18:	1301                	addi	t1,t1,-32
  1a:	0000                	unimp
  1c:	49002103          	lw	sp,1168(zero) # 490 <_data_section_lma_start+0x254>
  20:	000b2f13          	slti	t5,s6,0
  24:	0400                	addi	s0,sp,512
  26:	0024                	addi	s1,sp,8
  28:	0b3e0b0b          	0xb3e0b0b
  2c:	00000e03          	lb	t3,0(zero) # 0 <my_start>
  30:	2405                	jal	250 <_data_section_lma_start+0x14>
  32:	0b00                	addi	s0,sp,400
  34:	030b3e0b          	0x30b3e0b
  38:	0008                	0x8
  3a:	0600                	addi	s0,sp,768
  3c:	0034                	addi	a3,sp,8
  3e:	0b3a0e03          	lb	t3,179(s4)
  42:	0b390b3b          	0xb390b3b
  46:	1349                	addi	t1,t1,-14
  48:	1802193f 2e070000 	0x2e0700001802193f
  50:	3f01                	jal	ffffff60 <_my_stack_start+0xdffff760>
  52:	0319                	addi	t1,t1,6
  54:	3a0e                	fld	fs4,224(sp)
  56:	390b3b0b          	0x390b3b0b
  5a:	4919270b          	0x4919270b
  5e:	12011113          	0x12011113
  62:	4006                	0x4006
  64:	9618                	0x9618
  66:	1942                	slli	s2,s2,0x30
  68:	1301                	addi	t1,t1,-32
  6a:	0000                	unimp
  6c:	0508                	addi	a0,sp,640
  6e:	0300                	addi	s0,sp,384
  70:	3a08                	fld	fa0,48(a2)
  72:	390b3b0b          	0x390b3b0b
  76:	0213490b          	0x213490b
  7a:	0018                	0x18
  7c:	0900                	addi	s0,sp,144
  7e:	012e                	slli	sp,sp,0xb
  80:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
  88:	0b39                	addi	s6,s6,14
  8a:	13491927          	0x13491927
  8e:	0111                	addi	sp,sp,4
  90:	0612                	slli	a2,a2,0x4
  92:	1840                	addi	s0,sp,52
  94:	01194297          	auipc	t0,0x1194
  98:	0a000013          	li	zero,160
  9c:	0034                	addi	a3,sp,8
  9e:	0b3a0803          	lb	a6,179(s4)
  a2:	0b390b3b          	0xb390b3b
  a6:	1349                	addi	t1,t1,-14
  a8:	1802                	slli	a6,a6,0x20
  aa:	0000                	unimp
  ac:	4901010b          	0x4901010b
  b0:	00000013          	nop
  b4:	1101                	addi	sp,sp,-32
  b6:	1000                	addi	s0,sp,32
  b8:	1106                	slli	sp,sp,0x21
  ba:	1201                	addi	tp,tp,-32
  bc:	0301                	addi	t1,t1,0
  be:	1b0e                	slli	s6,s6,0x23
  c0:	250e                	fld	fa0,192(sp)
  c2:	130e                	slli	t1,t1,0x23
  c4:	0005                	c.nop	1
  c6:	0000                	unimp
  c8:	1101                	addi	sp,sp,-32
  ca:	1000                	addi	s0,sp,32
  cc:	1106                	slli	sp,sp,0x21
  ce:	1201                	addi	tp,tp,-32
  d0:	0301                	addi	t1,t1,0
  d2:	1b0e                	slli	s6,s6,0x23
  d4:	250e                	fld	fa0,192(sp)
  d6:	130e                	slli	t1,t1,0x23
  d8:	0005                	c.nop	1
  da:	0000                	unimp
  dc:	1101                	addi	sp,sp,-32
  de:	1000                	addi	s0,sp,32
  e0:	1106                	slli	sp,sp,0x21
  e2:	1201                	addi	tp,tp,-32
  e4:	0301                	addi	t1,t1,0
  e6:	1b0e                	slli	s6,s6,0x23
  e8:	250e                	fld	fa0,192(sp)
  ea:	130e                	slli	t1,t1,0x23
  ec:	0005                	c.nop	1
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	003c                	addi	a5,sp,8
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0004                	0x4
   c:	0000                	unimp
   e:	0000                	unimp
  10:	0032                	c.slli	zero,0xc
  12:	0000                	unimp
  14:	008e                	slli	ra,ra,0x3
  16:	0000                	unimp
  18:	00c0                	addi	s0,sp,68
  1a:	0000                	unimp
  1c:	0022                	c.slli	zero,0x8
  1e:	0000                	unimp
  20:	00e2                	slli	ra,ra,0x18
  22:	0000                	unimp
  24:	0030                	addi	a2,sp,8
  26:	0000                	unimp
  28:	0112                	slli	sp,sp,0x4
  2a:	0000                	unimp
  2c:	0028                	addi	a0,sp,8
  2e:	0000                	unimp
  30:	013a                	slli	sp,sp,0xe
  32:	0000                	unimp
  34:	0036                	c.slli	zero,0xd
	...
  3e:	0000                	unimp
  40:	001c                	0x1c
  42:	0000                	unimp
  44:	0002                	c.slli64	zero
  46:	00000173          	0x173
  4a:	0004                	0x4
  4c:	0000                	unimp
  4e:	0000                	unimp
  50:	0170                	addi	a2,sp,140
  52:	0000                	unimp
  54:	0020                	addi	s0,sp,8
	...
  5e:	0000                	unimp
  60:	001c                	0x1c
  62:	0000                	unimp
  64:	0002                	c.slli64	zero
  66:	0199                	addi	gp,gp,6
  68:	0000                	unimp
  6a:	0004                	0x4
  6c:	0000                	unimp
  6e:	0000                	unimp
  70:	0190                	addi	a2,sp,192
  72:	0000                	unimp
  74:	002a                	c.slli	zero,0xa
	...
  7e:	0000                	unimp
  80:	001c                	0x1c
  82:	0000                	unimp
  84:	0002                	c.slli64	zero
  86:	000001bf 00000004 	0x4000001bf
  8e:	0000                	unimp
  90:	0000                	unimp
  92:	0000                	unimp
  94:	0032                	c.slli	zero,0xc
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	0032                	c.slli	zero,0xc
   2:	0000                	unimp
   4:	00c0                	addi	s0,sp,68
   6:	0000                	unimp
   8:	00c0                	addi	s0,sp,68
   a:	0000                	unimp
   c:	00e2                	slli	ra,ra,0x18
   e:	0000                	unimp
  10:	00e2                	slli	ra,ra,0x18
  12:	0000                	unimp
  14:	0112                	slli	sp,sp,0x4
  16:	0000                	unimp
  18:	0112                	slli	sp,sp,0x4
  1a:	0000                	unimp
  1c:	013a                	slli	sp,sp,0xe
  1e:	0000                	unimp
  20:	013a                	slli	sp,sp,0xe
  22:	0000                	unimp
  24:	0170                	addi	a2,sp,140
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0179                	addi	sp,sp,30
   2:	0000                	unimp
   4:	001d0003          	lb	zero,1(s10) # fffe0001 <_my_stack_start+0xdffdf801>
   8:	0000                	unimp
   a:	0101                	addi	sp,sp,0
   c:	000d0efb          	0xd0efb
  10:	0101                	addi	sp,sp,0
  12:	0101                	addi	sp,sp,0
  14:	0000                	unimp
  16:	0100                	addi	s0,sp,128
  18:	0000                	unimp
  1a:	0001                	nop
  1c:	616d                	addi	sp,sp,240
  1e:	6e69                	lui	t3,0x1a
  20:	632e                	flw	ft6,200(sp)
  22:	0000                	unimp
  24:	0000                	unimp
  26:	0500                	addi	s0,sp,640
  28:	0010                	0x10
  2a:	0205                	addi	tp,tp,1
  2c:	0032                	c.slli	zero,0xc
  2e:	0000                	unimp
  30:	05010903          	lb	s2,80(sp) # 1001105c <__sram_size+0x1001095c>
  34:	09010307          	0x9010307
  38:	0008                	0x8
  3a:	0301                	addi	t1,t1,0
  3c:	0901                	addi	s2,s2,0
  3e:	0004                	0x4
  40:	0501                	addi	a0,a0,0
  42:	030c                	addi	a1,sp,384
  44:	0902                	c.slli64	s2
  46:	0010                	0x10
  48:	0501                	addi	a0,a0,0
  4a:	030a                	slli	t1,t1,0x2
  4c:	0900                	addi	s0,sp,144
  4e:	0004                	0x4
  50:	0501                	addi	a0,a0,0
  52:	030c                	addi	a1,sp,384
  54:	0901                	addi	s2,s2,0
  56:	0004                	0x4
  58:	0501                	addi	a0,a0,0
  5a:	030a                	slli	t1,t1,0x2
  5c:	0900                	addi	s0,sp,144
  5e:	0004                	0x4
  60:	0501                	addi	a0,a0,0
  62:	030c                	addi	a1,sp,384
  64:	0901                	addi	s2,s2,0
  66:	0004                	0x4
  68:	0501                	addi	a0,a0,0
  6a:	030a                	slli	t1,t1,0x2
  6c:	0900                	addi	s0,sp,144
  6e:	0004                	0x4
  70:	0301                	addi	t1,t1,0
  72:	0901                	addi	s2,s2,0
  74:	0004                	0x4
  76:	0501                	addi	a0,a0,0
  78:	0305                	addi	t1,t1,1
  7a:	0900                	addi	s0,sp,144
  7c:	0004                	0x4
  7e:	0501                	addi	a0,a0,0
  80:	030c                	addi	a1,sp,384
  82:	0901                	addi	s2,s2,0
  84:	0006                	c.slli	zero,0x1
  86:	0501                	addi	a0,a0,0
  88:	030a                	slli	t1,t1,0x2
  8a:	0900                	addi	s0,sp,144
  8c:	0008                	0x8
  8e:	0501                	addi	a0,a0,0
  90:	0305                	addi	t1,t1,1
  92:	0901                	addi	s2,s2,0
  94:	0004                	0x4
  96:	0501                	addi	a0,a0,0
  98:	030c                	addi	a1,sp,384
  9a:	0901                	addi	s2,s2,0
  9c:	0006                	c.slli	zero,0x1
  9e:	0501                	addi	a0,a0,0
  a0:	030a                	slli	t1,t1,0x2
  a2:	0900                	addi	s0,sp,144
  a4:	0012                	c.slli	zero,0x4
  a6:	0501                	addi	a0,a0,0
  a8:	030c                	addi	a1,sp,384
  aa:	0901                	addi	s2,s2,0
  ac:	0004                	0x4
  ae:	0501                	addi	a0,a0,0
  b0:	030a                	slli	t1,t1,0x2
  b2:	0900                	addi	s0,sp,144
  b4:	0016                	c.slli	zero,0x5
  b6:	0501                	addi	a0,a0,0
  b8:	030d                	addi	t1,t1,3
  ba:	0902                	c.slli64	s2
  bc:	0004                	0x4
  be:	0501                	addi	a0,a0,0
  c0:	0301                	addi	t1,t1,0
  c2:	0901                	addi	s2,s2,0
  c4:	0004                	0x4
  c6:	0901                	addi	s2,s2,0
  c8:	000a                	c.slli	zero,0x2
  ca:	0100                	addi	s0,sp,128
  cc:	0501                	addi	a0,a0,0
  ce:	0011                	c.nop	4
  d0:	0205                	addi	tp,tp,1
  d2:	00c0                	addi	s0,sp,68
  d4:	0000                	unimp
  d6:	05011903          	lh	s2,80(sp)
  da:	0902030b          	0x902030b
  de:	0006                	c.slli	zero,0x1
  e0:	0501                	addi	a0,a0,0
  e2:	0301                	addi	t1,t1,0
  e4:	0901                	addi	s2,s2,0
  e6:	0014                	0x14
  e8:	0901                	addi	s2,s2,0
  ea:	0008                	0x8
  ec:	0100                	addi	s0,sp,128
  ee:	0501                	addi	a0,a0,0
  f0:	02050017          	auipc	zero,0x2050
  f4:	00e2                	slli	ra,ra,0x18
  f6:	0000                	unimp
  f8:	05011d03          	lh	s10,80(sp)
  fc:	0309                	addi	t1,t1,2
  fe:	0902                	c.slli64	s2
 100:	000a                	c.slli	zero,0x2
 102:	0501                	addi	a0,a0,0
 104:	0305                	addi	t1,t1,1
 106:	0900                	addi	s0,sp,144
 108:	000e                	c.slli	zero,0x3
 10a:	0501                	addi	a0,a0,0
 10c:	030a                	slli	t1,t1,0x2
 10e:	0902                	c.slli64	s2
 110:	0008                	0x8
 112:	0501                	addi	a0,a0,0
 114:	0301                	addi	t1,t1,0
 116:	0901                	addi	s2,s2,0
 118:	0008                	0x8
 11a:	0901                	addi	s2,s2,0
 11c:	0008                	0x8
 11e:	0100                	addi	s0,sp,128
 120:	0501                	addi	a0,a0,0
 122:	0019                	c.nop	6
 124:	0205                	addi	tp,tp,1
 126:	0112                	slli	sp,sp,0x4
 128:	0000                	unimp
 12a:	05012303          	lw	t1,80(sp)
 12e:	0325                	addi	t1,t1,9
 130:	0900                	addi	s0,sp,144
 132:	000e                	c.slli	zero,0x3
 134:	0501                	addi	a0,a0,0
 136:	032a                	slli	t1,t1,0xa
 138:	0900                	addi	s0,sp,144
 13a:	000a                	c.slli	zero,0x2
 13c:	0501                	addi	a0,a0,0
 13e:	0301                	addi	t1,t1,0
 140:	0900                	addi	s0,sp,144
 142:	0008                	0x8
 144:	0901                	addi	s2,s2,0
 146:	0008                	0x8
 148:	0100                	addi	s0,sp,128
 14a:	0501                	addi	a0,a0,0
 14c:	0020                	addi	s0,sp,8
 14e:	0205                	addi	tp,tp,1
 150:	013a                	slli	sp,sp,0xe
 152:	0000                	unimp
 154:	05012403          	lw	s0,80(sp)
 158:	032c                	addi	a1,sp,392
 15a:	0900                	addi	s0,sp,144
 15c:	0014                	0x14
 15e:	0501                	addi	a0,a0,0
 160:	0330                	addi	a2,sp,392
 162:	0900                	addi	s0,sp,144
 164:	000a                	c.slli	zero,0x2
 166:	0501                	addi	a0,a0,0
 168:	0335                	addi	t1,t1,13
 16a:	0900                	addi	s0,sp,144
 16c:	0006                	c.slli	zero,0x1
 16e:	0501                	addi	a0,a0,0
 170:	0301                	addi	t1,t1,0
 172:	0900                	addi	s0,sp,144
 174:	0008                	0x8
 176:	0901                	addi	s2,s2,0
 178:	000a                	c.slli	zero,0x2
 17a:	0100                	addi	s0,sp,128
 17c:	5b01                	li	s6,-32
 17e:	0000                	unimp
 180:	0300                	addi	s0,sp,384
 182:	2100                	fld	fs0,0(a0)
 184:	0000                	unimp
 186:	0100                	addi	s0,sp,128
 188:	fb01                	bnez	a4,98 <main+0x66>
 18a:	0d0e                	slli	s10,s10,0x3
 18c:	0100                	addi	s0,sp,128
 18e:	0101                	addi	sp,sp,0
 190:	0001                	nop
 192:	0000                	unimp
 194:	0001                	nop
 196:	0100                	addi	s0,sp,128
 198:	6900                	flw	fs0,16(a0)
 19a:	696e                	flw	fs2,216(sp)
 19c:	5f74                	lw	a3,124(a4)
 19e:	7362                	flw	ft6,56(sp)
 1a0:	00532e73          	csrrs	t3,utvec,t1
 1a4:	0000                	unimp
 1a6:	0000                	unimp
 1a8:	0500                	addi	s0,sp,640
 1aa:	7002                	flw	ft0,32(sp)
 1ac:	0001                	nop
 1ae:	0300                	addi	s0,sp,384
 1b0:	010c                	addi	a1,sp,128
 1b2:	08090103          	lb	sp,128(s2) # 1080 <__sram_size+0x980>
 1b6:	0100                	addi	s0,sp,128
 1b8:	08090103          	lb	sp,128(s2)
 1bc:	0100                	addi	s0,sp,128
 1be:	04090303          	lb	t1,64(s2)
 1c2:	0100                	addi	s0,sp,128
 1c4:	04090103          	lb	sp,64(s2)
 1c8:	0100                	addi	s0,sp,128
 1ca:	02090103          	lb	sp,32(s2)
 1ce:	0100                	addi	s0,sp,128
 1d0:	04090303          	lb	t1,64(s2)
 1d4:	0100                	addi	s0,sp,128
 1d6:	0209                	addi	tp,tp,2
 1d8:	0000                	unimp
 1da:	0101                	addi	sp,sp,0
 1dc:	006e                	c.slli	zero,0x1b
 1de:	0000                	unimp
 1e0:	00220003          	lb	zero,2(tp) # 2 <my_start+0x2>
 1e4:	0000                	unimp
 1e6:	0101                	addi	sp,sp,0
 1e8:	000d0efb          	0xd0efb
 1ec:	0101                	addi	sp,sp,0
 1ee:	0101                	addi	sp,sp,0
 1f0:	0000                	unimp
 1f2:	0100                	addi	s0,sp,128
 1f4:	0000                	unimp
 1f6:	0001                	nop
 1f8:	6f6c                	flw	fa1,92(a4)
 1fa:	6461                	lui	s0,0x18
 1fc:	645f 7461 2e61      	0x2e617461645f
 202:	00000053          	fadd.s	ft0,ft0,ft0,rne
 206:	0000                	unimp
 208:	0500                	addi	s0,sp,640
 20a:	9002                	ebreak
 20c:	0001                	nop
 20e:	0300                	addi	s0,sp,384
 210:	0110                	addi	a2,sp,128
 212:	04090103          	lb	sp,64(s2)
 216:	0100                	addi	s0,sp,128
 218:	08090103          	lb	sp,128(s2)
 21c:	0100                	addi	s0,sp,128
 21e:	08090803          	lb	a6,128(s2)
 222:	0100                	addi	s0,sp,128
 224:	04090703          	lb	a4,64(s2)
 228:	0100                	addi	s0,sp,128
 22a:	04090103          	lb	sp,64(s2)
 22e:	0100                	addi	s0,sp,128
 230:	04090103          	lb	sp,64(s2)
 234:	0100                	addi	s0,sp,128
 236:	02090103          	lb	sp,32(s2)
 23a:	0100                	addi	s0,sp,128
 23c:	02090103          	lb	sp,32(s2)
 240:	0100                	addi	s0,sp,128
 242:	04090203          	lb	tp,64(s2)
 246:	0100                	addi	s0,sp,128
 248:	0209                	addi	tp,tp,2
 24a:	0000                	unimp
 24c:	0101                	addi	sp,sp,0
 24e:	00a6                	slli	ra,ra,0x9
 250:	0000                	unimp
 252:	001e0003          	lb	zero,1(t3) # 1a001 <__sram_size+0x19901>
 256:	0000                	unimp
 258:	0101                	addi	sp,sp,0
 25a:	000d0efb          	0xd0efb
 25e:	0101                	addi	sp,sp,0
 260:	0101                	addi	sp,sp,0
 262:	0000                	unimp
 264:	0100                	addi	s0,sp,128
 266:	0000                	unimp
 268:	0001                	nop
 26a:	72617473          	csrrci	s0,0x726,2
 26e:	2e74                	fld	fa3,216(a2)
 270:	00000053          	fadd.s	ft0,ft0,ft0,rne
 274:	0000                	unimp
 276:	0500                	addi	s0,sp,640
 278:	0002                	c.slli64	zero
 27a:	0000                	unimp
 27c:	0300                	addi	s0,sp,384
 27e:	0110                	addi	a2,sp,128
 280:	02090103          	lb	sp,32(s2)
 284:	0100                	addi	s0,sp,128
 286:	02090103          	lb	sp,32(s2)
 28a:	0100                	addi	s0,sp,128
 28c:	02090103          	lb	sp,32(s2)
 290:	0100                	addi	s0,sp,128
 292:	02090103          	lb	sp,32(s2)
 296:	0100                	addi	s0,sp,128
 298:	02090103          	lb	sp,32(s2)
 29c:	0100                	addi	s0,sp,128
 29e:	02090103          	lb	sp,32(s2)
 2a2:	0100                	addi	s0,sp,128
 2a4:	02090103          	lb	sp,32(s2)
 2a8:	0100                	addi	s0,sp,128
 2aa:	02090103          	lb	sp,32(s2)
 2ae:	0100                	addi	s0,sp,128
 2b0:	02090103          	lb	sp,32(s2)
 2b4:	0100                	addi	s0,sp,128
 2b6:	02090103          	lb	sp,32(s2)
 2ba:	0100                	addi	s0,sp,128
 2bc:	02090103          	lb	sp,32(s2)
 2c0:	0100                	addi	s0,sp,128
 2c2:	02090103          	lb	sp,32(s2)
 2c6:	0100                	addi	s0,sp,128
 2c8:	02090103          	lb	sp,32(s2)
 2cc:	0100                	addi	s0,sp,128
 2ce:	02090103          	lb	sp,32(s2)
 2d2:	0100                	addi	s0,sp,128
 2d4:	02090303          	lb	t1,32(s2)
 2d8:	0100                	addi	s0,sp,128
 2da:	08090303          	lb	t1,128(s2)
 2de:	0100                	addi	s0,sp,128
 2e0:	02090103          	lb	sp,32(s2)
 2e4:	0100                	addi	s0,sp,128
 2e6:	04090103          	lb	sp,64(s2)
 2ea:	0100                	addi	s0,sp,128
 2ec:	04090303          	lb	t1,64(s2)
 2f0:	0100                	addi	s0,sp,128
 2f2:	0209                	addi	tp,tp,2
 2f4:	0000                	unimp
 2f6:	0101                	addi	sp,sp,0

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6d6f682f          	0x6d6f682f
   4:	2f65                	jal	7bc <__sram_size+0xbc>
   6:	6272                	flw	ft4,28(sp)
   8:	2f74                	fld	fa3,216(a4)
   a:	6168                	flw	fa0,68(a0)
   c:	7070                	flw	fa2,100(s0)
   e:	7779                	lui	a4,0xffffe
  10:	2f6b726f          	jal	tp,b7306 <__sram_size+0xb6c06>
  14:	3530                	fld	fa2,104(a0)
  16:	722d                	lui	tp,0xfffeb
  18:	7369                	lui	t1,0xffffa
  1a:	612d7663          	bgeu	s10,s2,626 <_data_section_lma_start+0x3ea>
  1e:	302f6d73          	csrrsi	s10,medeleg,30
  22:	2d31                	jal	63e <_data_section_lma_start+0x402>
  24:	6e69                	lui	t3,0x1a
  26:	75727473          	csrrci	s0,0x757,4
  2a:	6f697463          	bgeu	s2,s6,712 <__sram_size+0x12>
  2e:	2d6e                	fld	fs10,216(sp)
  30:	7566                	flw	fa0,120(sp)
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
  4e:	2d33302f          	0x2d33302f
  52:	61632d43          	fmadd.s	fs10,ft6,fs6,fa2,rdn
  56:	6c6c                	flw	fa1,92(s0)
  58:	772d                	lui	a4,0xfffeb
  5a:	7469                	lui	s0,0xffffa
  5c:	2d68                	fld	fa0,216(a0)
  5e:	63617473          	csrrci	s0,0x636,2
  62:	6e75006b          	0x6e75006b
  66:	6e676973          	csrrsi	s2,0x6e6,14
  6a:	6465                	lui	s0,0x19
  6c:	6920                	flw	fs0,80(a0)
  6e:	746e                	flw	fs0,248(sp)
  70:	6d00                	flw	fs0,24(a0)
  72:	6961                	lui	s2,0x18
  74:	006e                	c.slli	zero,0x1b
  76:	5f6d7573          	csrrci	a0,0x5f6,26
  7a:	0030                	addi	a2,sp,8
  7c:	5f6d7573          	csrrci	a0,0x5f6,26
  80:	75730033          	0x75730033
  84:	5f6d                	li	t5,-5
  86:	0032                	c.slli	zero,0xc
  88:	616d                	addi	sp,sp,240
  8a:	6e69                	lui	t3,0x1a
  8c:	632e                	flw	ft6,200(sp)
  8e:	4700                	lw	s0,8(a4)
  90:	554e                	lw	a0,240(sp)
  92:	4320                	lw	s0,64(a4)
  94:	3939                	jal	fffffcb2 <_my_stack_start+0xdffff4b2>
  96:	3820                	fld	fs0,112(s0)
  98:	322e                	fld	ft4,232(sp)
  9a:	302e                	fld	ft0,232(sp)
  9c:	2d20                	fld	fs0,88(a0)
  9e:	616d                	addi	sp,sp,240
  a0:	6372                	flw	ft6,28(sp)
  a2:	3d68                	fld	fa0,248(a0)
  a4:	7672                	flw	fa2,60(sp)
  a6:	63653233          	0x63653233
  aa:	2d20                	fld	fs0,88(a0)
  ac:	616d                	addi	sp,sp,240
  ae:	6962                	flw	fs2,24(sp)
  b0:	693d                	lui	s2,0xf
  b2:	706c                	flw	fa1,100(s0)
  b4:	20653233          	0x20653233
  b8:	672d                	lui	a4,0xb
  ba:	2d20                	fld	fs0,88(a0)
  bc:	2d20304f          	0x2d20304f
  c0:	3d647473          	csrrci	s0,0x3d6,8
  c4:	39756e67          	0x39756e67
  c8:	2039                	jal	d6 <sum_0+0x16>
  ca:	662d                	lui	a2,0xb
  cc:	6f6e                	flw	ft10,216(sp)
  ce:	622d                	lui	tp,0xb
  d0:	6975                	lui	s2,0x1d
  d2:	746c                	flw	fa1,108(s0)
  d4:	6e69                	lui	t3,0x1a
  d6:	2d20                	fld	fs0,88(a0)
  d8:	6e66                	flw	ft8,88(sp)
  da:	75622d6f          	jal	s10,22830 <__sram_size+0x22130>
  de:	6c69                	lui	s8,0x1a
  e0:	6974                	flw	fa3,84(a0)
  e2:	2d6e                	fld	fs10,216(sp)
  e4:	202a                	fld	ft0,136(sp)
  e6:	662d                	lui	a2,0xb
  e8:	6e676973          	csrrsi	s2,0x6e6,14
  ec:	6465                	lui	s0,0x19
  ee:	632d                	lui	t1,0xb
  f0:	6168                	flw	fa0,68(a0)
  f2:	2072                	fld	ft0,280(sp)
  f4:	662d                	lui	a2,0xb
  f6:	7566                	flw	fa0,120(sp)
  f8:	636e                	flw	ft6,216(sp)
  fa:	6974                	flw	fa3,84(a0)
  fc:	732d6e6f          	jal	t3,d682e <__sram_size+0xd612e>
 100:	6365                	lui	t1,0x19
 102:	6974                	flw	fa3,84(a0)
 104:	20736e6f          	jal	t3,36b0a <__sram_size+0x3640a>
 108:	662d                	lui	a2,0xb
 10a:	6164                	flw	fs1,68(a0)
 10c:	6174                	flw	fa3,68(a0)
 10e:	732d                	lui	t1,0xfffeb
 110:	6365                	lui	t1,0x19
 112:	6974                	flw	fa3,84(a0)
 114:	20736e6f          	jal	t3,36b1a <__sram_size+0x3641a>
 118:	662d                	lui	a2,0xb
 11a:	6f6e                	flw	ft10,216(sp)
 11c:	632d                	lui	t1,0xb
 11e:	6f6d6d6f          	jal	s10,d6814 <__sram_size+0xd6114>
 122:	006e                	c.slli	zero,0x1b
 124:	796d                	lui	s2,0xffffb
 126:	645f 7461 0061      	0x617461645f
 12c:	5f6d7573          	csrrci	a0,0x5f6,26
 130:	6f64                	flw	fs1,92(a4)
 132:	6275                	lui	tp,0x1d
 134:	656c                	flw	fa1,76(a0)
 136:	6900                	flw	fs0,16(a0)
 138:	696e                	flw	fs2,216(sp)
 13a:	5f74                	lw	a3,124(a4)
 13c:	7362                	flw	ft6,56(sp)
 13e:	00532e73          	csrrs	t3,utvec,t1
 142:	20554e47          	fmsub.s	ft8,fa0,ft5,ft4,rmm
 146:	5341                	li	t1,-16
 148:	3220                	fld	fs0,96(a2)
 14a:	332e                	fld	ft6,232(sp)
 14c:	0032                	c.slli	zero,0xc
 14e:	6f6c                	flw	fa1,92(a4)
 150:	6461                	lui	s0,0x18
 152:	645f 7461 2e61      	0x2e617461645f
 158:	74730053          	0x74730053
 15c:	7261                	lui	tp,0xffff8
 15e:	2e74                	fld	fa3,216(a2)
 160:	          	fadd.s	ft0,ft0,ft0,rne

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	5078                	lw	a4,100(s0)
   8:	6361                	lui	t1,0x18
   a:	4e47206b          	0x4e47206b
   e:	2055                	jal	b2 <main+0x80>
  10:	4952                	lw	s2,20(sp)
  12:	562d4353          	0x562d4353
  16:	4520                	lw	s0,72(a0)
  18:	626d                	lui	tp,0x1b
  1a:	6465                	lui	s0,0x19
  1c:	6564                	flw	fs1,76(a0)
  1e:	2064                	fld	fs1,192(s0)
  20:	2c434347          	0x2c434347
  24:	3620                	fld	fs0,104(a2)
  26:	2d34                	fld	fa3,88(a0)
  28:	6962                	flw	fs2,24(sp)
  2a:	2974                	fld	fa3,208(a0)
  2c:	3820                	fld	fs0,112(s0)
  2e:	322e                	fld	ft4,232(sp)
  30:	302e                	fld	ft0,232(sp)
	...

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	000c                	0xc
   2:	0000                	unimp
   4:	ffff                	0xffff
   6:	ffff                	0xffff
   8:	0001                	nop
   a:	7c01                	lui	s8,0xfffe0
   c:	0d01                	addi	s10,s10,0
   e:	0002                	c.slli64	zero
  10:	0020                	addi	s0,sp,8
  12:	0000                	unimp
  14:	0000                	unimp
  16:	0000                	unimp
  18:	0032                	c.slli	zero,0xc
  1a:	0000                	unimp
  1c:	008e                	slli	ra,ra,0x3
  1e:	0000                	unimp
  20:	0e42                	slli	t3,t3,0x10
  22:	4420                	lw	s0,72(s0)
  24:	0181                	addi	gp,gp,0
  26:	0288                	addi	a0,sp,320
  28:	0c42                	slli	s8,s8,0x10
  2a:	0008                	0x8
  2c:	8002                	0x8002
  2e:	42c1                	li	t0,16
  30:	42c8                	lw	a0,4(a3)
  32:	020d                	addi	tp,tp,3
  34:	001c                	0x1c
  36:	0000                	unimp
  38:	0000                	unimp
  3a:	0000                	unimp
  3c:	00c0                	addi	s0,sp,68
  3e:	0000                	unimp
  40:	0022                	c.slli	zero,0x8
  42:	0000                	unimp
  44:	0e42                	slli	t3,t3,0x10
  46:	4204                	lw	s1,0(a2)
  48:	0188                	addi	a0,sp,192
  4a:	0c42                	slli	s8,s8,0x10
  4c:	0008                	0x8
  4e:	c858                	sw	a4,20(s0)
  50:	0d42                	slli	s10,s10,0x10
  52:	0002                	c.slli64	zero
  54:	001c                	0x1c
  56:	0000                	unimp
  58:	0000                	unimp
  5a:	0000                	unimp
  5c:	00e2                	slli	ra,ra,0x18
  5e:	0000                	unimp
  60:	0030                	addi	a2,sp,8
  62:	0000                	unimp
  64:	0e42                	slli	t3,t3,0x10
  66:	4208                	lw	a0,0(a2)
  68:	0188                	addi	a0,sp,192
  6a:	0c42                	slli	s8,s8,0x10
  6c:	0008                	0x8
  6e:	c866                	sw	s9,16(sp)
  70:	0d42                	slli	s10,s10,0x10
  72:	0002                	c.slli64	zero
  74:	001c                	0x1c
  76:	0000                	unimp
  78:	0000                	unimp
  7a:	0000                	unimp
  7c:	0112                	slli	sp,sp,0x4
  7e:	0000                	unimp
  80:	0028                	addi	a0,sp,8
  82:	0000                	unimp
  84:	0e42                	slli	t3,t3,0x10
  86:	420c                	lw	a1,0(a2)
  88:	0188                	addi	a0,sp,192
  8a:	0c42                	slli	s8,s8,0x10
  8c:	0008                	0x8
  8e:	c85e                	sw	s7,16(sp)
  90:	0d42                	slli	s10,s10,0x10
  92:	0002                	c.slli64	zero
  94:	0020                	addi	s0,sp,8
  96:	0000                	unimp
  98:	0000                	unimp
  9a:	0000                	unimp
  9c:	013a                	slli	sp,sp,0xe
  9e:	0000                	unimp
  a0:	0036                	c.slli	zero,0xd
  a2:	0000                	unimp
  a4:	0e42                	slli	t3,t3,0x10
  a6:	4418                	lw	a4,8(s0)
  a8:	0181                	addi	gp,gp,0
  aa:	0288                	addi	a0,sp,320
  ac:	0c42                	slli	s8,s8,0x10
  ae:	0008                	0x8
  b0:	c168                	sw	a0,68(a0)
  b2:	c842                	sw	a6,16(sp)
  b4:	0d42                	slli	s10,s10,0x10
  b6:	0002                	c.slli64	zero
