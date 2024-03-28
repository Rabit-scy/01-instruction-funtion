
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
  26:	2a75                	jal	1e2 <load_data>
  28:	19a000ef          	jal	ra,1c2 <init_bss>
  2c:	17c0006f          	j	1a8 <main>
  30:	0001                	nop

00000032 <swap>:
  32:	1141                	addi	sp,sp,-16
  34:	c622                	sw	s0,12(sp)
  36:	0800                	addi	s0,sp,16
  38:	fea42a23          	sw	a0,-12(s0)
  3c:	feb42823          	sw	a1,-16(s0)
  40:	ff442783          	lw	a5,-12(s0)
  44:	439c                	lw	a5,0(a5)
  46:	fef42c23          	sw	a5,-8(s0)
  4a:	ff042783          	lw	a5,-16(s0)
  4e:	4398                	lw	a4,0(a5)
  50:	ff442783          	lw	a5,-12(s0)
  54:	c398                	sw	a4,0(a5)
  56:	ff442783          	lw	a5,-12(s0)
  5a:	4398                	lw	a4,0(a5)
  5c:	ff042783          	lw	a5,-16(s0)
  60:	c398                	sw	a4,0(a5)
  62:	0001                	nop
  64:	4432                	lw	s0,12(sp)
  66:	0141                	addi	sp,sp,16
  68:	8082                	ret

0000006a <QuickSort>:
/* control link and saved status ---  */
  6a:	1101                	addi	sp,sp,-32
  6c:	ce06                	sw	ra,28(sp)
  6e:	cc22                	sw	s0,24(sp)
  70:	1000                	addi	s0,sp,32

  72:	fea42223          	sw	a0,-28(s0)
  76:	feb42023          	sw	a1,-32(s0)

  7a:	fe442783          	lw	a5,-28(s0)
  7e:	fef42823          	sw	a5,-16(s0)

  82:	fe042783          	lw	a5,-32(s0)
  86:	fef42623          	sw	a5,-20(s0)
  
  8a:	ff042703          	lw	a4,-16(s0)
  8e:	fec42783          	lw	a5,-20(s0)
  92:	10f75663          	bge	a4,a5,19e <__stack_size+0x9e>
  96:	200007b7          	lui	a5,0x20000
  9a:	fe442703          	lw	a4,-28(s0)
  9e:	070a                	slli	a4,a4,0x2
  a0:	00078793          	mv	a5,a5
  a4:	97ba                	add	a5,a5,a4
  a6:	439c                	lw	a5,0(a5)
  a8:	fef42423          	sw	a5,-24(s0)
  ac:	a871                	j	148 <__stack_size+0x48>
  ae:	fec42783          	lw	a5,-20(s0)
  b2:	17fd                	addi	a5,a5,-1
  b4:	fef42623          	sw	a5,-20(s0)
  b8:	200007b7          	lui	a5,0x20000
  bc:	fec42703          	lw	a4,-20(s0)
  c0:	070a                	slli	a4,a4,0x2
  c2:	00078793          	mv	a5,a5
  c6:	97ba                	add	a5,a5,a4
  c8:	439c                	lw	a5,0(a5)
  ca:	fe842703          	lw	a4,-24(s0)
  ce:	00e7ce63          	blt	a5,a4,ea <QuickSort+0x80>
  d2:	ff042703          	lw	a4,-16(s0)
  d6:	fec42783          	lw	a5,-20(s0)
  da:	fcf74ae3          	blt	a4,a5,ae <QuickSort+0x44>
  de:	a031                	j	ea <QuickSort+0x80>
  e0:	ff042783          	lw	a5,-16(s0)
  e4:	0785                	addi	a5,a5,1
  e6:	fef42823          	sw	a5,-16(s0)
  ea:	200007b7          	lui	a5,0x20000
  ee:	ff042703          	lw	a4,-16(s0)
  f2:	070a                	slli	a4,a4,0x2
  f4:	00078793          	mv	a5,a5
  f8:	97ba                	add	a5,a5,a4
  fa:	439c                	lw	a5,0(a5)
  fc:	fe842703          	lw	a4,-24(s0)
 100:	00f74863          	blt	a4,a5,110 <__stack_size+0x10>
 104:	ff042703          	lw	a4,-16(s0)
 108:	fec42783          	lw	a5,-20(s0)
 10c:	fcf74ae3          	blt	a4,a5,e0 <QuickSort+0x76>
 110:	ff042703          	lw	a4,-16(s0)
 114:	fec42783          	lw	a5,-20(s0)
 118:	02f75863          	bge	a4,a5,148 <__stack_size+0x48>
 11c:	ff042783          	lw	a5,-16(s0)
 120:	00279713          	slli	a4,a5,0x2
 124:	200007b7          	lui	a5,0x20000
 128:	00078793          	mv	a5,a5
 12c:	00f706b3          	add	a3,a4,a5
 130:	fec42783          	lw	a5,-20(s0)
 134:	00279713          	slli	a4,a5,0x2
 138:	200007b7          	lui	a5,0x20000
 13c:	00078793          	mv	a5,a5
 140:	97ba                	add	a5,a5,a4
 142:	85be                	mv	a1,a5
 144:	8536                	mv	a0,a3
 146:	35f5                	jal	32 <swap>
 148:	ff042703          	lw	a4,-16(s0)
 14c:	fec42783          	lw	a5,-20(s0)
 150:	f6f714e3          	bne	a4,a5,b8 <QuickSort+0x4e>
 154:	fe442783          	lw	a5,-28(s0)
 158:	00279713          	slli	a4,a5,0x2
 15c:	200007b7          	lui	a5,0x20000
 160:	00078793          	mv	a5,a5
 164:	00f706b3          	add	a3,a4,a5
 168:	ff042783          	lw	a5,-16(s0)
 16c:	00279713          	slli	a4,a5,0x2
 170:	200007b7          	lui	a5,0x20000
 174:	00078793          	mv	a5,a5
 178:	97ba                	add	a5,a5,a4
 17a:	85be                	mv	a1,a5
 17c:	8536                	mv	a0,a3
 17e:	3d55                	jal	32 <swap>
 180:	ff042783          	lw	a5,-16(s0)
 184:	17fd                	addi	a5,a5,-1
 186:	85be                	mv	a1,a5
 188:	fe442503          	lw	a0,-28(s0)
 18c:	3df9                	jal	6a <QuickSort>
 18e:	ff042783          	lw	a5,-16(s0)
 192:	0785                	addi	a5,a5,1
 194:	fe042583          	lw	a1,-32(s0)
 198:	853e                	mv	a0,a5
 19a:	3dc1                	jal	6a <QuickSort>
 19c:	a011                	j	1a0 <__stack_size+0xa0>
 19e:	0001                	nop
 1a0:	40f2                	lw	ra,28(sp)
 1a2:	4462                	lw	s0,24(sp)
 1a4:	6105                	addi	sp,sp,32
 1a6:	8082                	ret

000001a8 <main>:
 1a8:	1151                	addi	sp,sp,-12
 1aa:	c406                	sw	ra,8(sp)
 1ac:	c222                	sw	s0,4(sp)
 1ae:	0060                	addi	s0,sp,12

 1b0:	45ad                	li	a1,11
 1b2:	4501                	li	a0,0

 1b4:	3d5d                	jal	6a <QuickSort>

 1b6:	4781                	li	a5,0
 1b8:	853e                	mv	a0,a5

 1ba:	40a2                	lw	ra,8(sp)
 1bc:	4412                	lw	s0,4(sp)
 1be:	0131                	addi	sp,sp,12
 1c0:	8082                	ret

000001c2 <init_bss>:
 1c2:	20000797          	auipc	a5,0x20000
 1c6:	e6a78793          	addi	a5,a5,-406 # 2000002c <_data_section_vma_end>
 1ca:	20000717          	auipc	a4,0x20000
 1ce:	e6270713          	addi	a4,a4,-414 # 2000002c <_data_section_vma_end>
 1d2:	00f70763          	beq	a4,a5,1e0 <init_bss+0x1e>
 1d6:	0007a023          	sw	zero,0(a5)
 1da:	0791                	addi	a5,a5,4
 1dc:	fee7cde3          	blt	a5,a4,1d6 <init_bss+0x14>
 1e0:	8082                	ret

000001e2 <load_data>:
 1e2:	20c00793          	li	a5,524
 1e6:	20000717          	auipc	a4,0x20000
 1ea:	e1a70713          	addi	a4,a4,-486 # 20000000 <need_to_sort>
 1ee:	20000697          	auipc	a3,0x20000
 1f2:	e3e68693          	addi	a3,a3,-450 # 2000002c <_data_section_vma_end>
 1f6:	00d70a63          	beq	a4,a3,20a <load_data+0x28>
 1fa:	0007a283          	lw	t0,0(a5)
 1fe:	00572023          	sw	t0,0(a4)
 202:	0711                	addi	a4,a4,4
 204:	0791                	addi	a5,a5,4
 206:	fed74ae3          	blt	a4,a3,1fa <load_data+0x18>
 20a:	8082                	ret

Disassembly of section .data:

20000000 <need_to_sort>:
20000000:	000a                	c.slli	zero,0x2
20000002:	0000                	unimp
20000004:	001e                	c.slli	zero,0x7
20000006:	0000                	unimp
20000008:	0014                	0x14
2000000a:	0000                	unimp
2000000c:	0021                	c.nop	8
2000000e:	0000                	unimp
20000010:	0016                	c.slli	zero,0x5
20000012:	0000                	unimp
20000014:	0000000b          	0xb
20000018:	0005                	c.nop	1
2000001a:	0000                	unimp
2000001c:	0008                	0x8
2000001e:	0000                	unimp
20000020:	000d                	c.nop	3
20000022:	0000                	unimp
20000024:	001c                	0x1c
20000026:	0000                	unimp
20000028:	00000003          	lb	zero,0(zero) # 0 <my_start>

Disassembly of section .my_stack:

20000700 <_my_stack_start-0x100>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	010a                	slli	sp,sp,0x2
   2:	0000                	unimp
   4:	0004                	0x4
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0104                	addi	s1,sp,128
   c:	008d                	addi	ra,ra,3
   e:	0000                	unimp
  10:	7c0c                	flw	fa1,56(s0)
  12:	0000                	unimp
  14:	0d00                	addi	s0,sp,656
	...
  22:	0000                	unimp
  24:	0200                	addi	s0,sp,256
  26:	003c                	addi	a5,sp,8
  28:	0000                	unimp
  2a:	0035                	c.nop	13
  2c:	0000                	unimp
  2e:	00003503          	0x3503
  32:	0a00                	addi	s0,sp,272
  34:	0400                	addi	s0,sp,512
  36:	0704                	addi	s1,sp,896
  38:	0000                	unimp
  3a:	0000                	unimp
  3c:	0405                	addi	s0,s0,1
  3e:	6905                	lui	s2,0x1
  40:	746e                	flw	fs0,248(sp)
  42:	0600                	addi	s0,sp,768
  44:	0000006f          	j	44 <swap+0x12>
  48:	0c01                	addi	s8,s8,0
  4a:	2505                	jal	66a <_data_section_lma_start+0x45e>
  4c:	0000                	unimp
  4e:	0500                	addi	s0,sp,640
  50:	00000003          	lb	zero,0(zero) # 0 <my_start>
  54:	0720                	addi	s0,sp,904
  56:	0122                	slli	sp,sp,0x8
  58:	0000                	unimp
  5a:	2f01                	jal	76a <__sram_size+0x6a>
  5c:	3c05                	jal	fffffa8c <_my_stack_start+0xdffff28c>
  5e:	0000                	unimp
  60:	a800                	fsd	fs0,16(s0)
  62:	0001                	nop
  64:	1a00                	addi	s0,sp,304
  66:	0000                	unimp
  68:	0100                	addi	s0,sp,128
  6a:	089c                	addi	a5,sp,80
  6c:	0065                	c.nop	25
  6e:	0000                	unimp
  70:	1501                	addi	a0,a0,-32
  72:	6a06                	flw	fs4,64(sp)
  74:	0000                	unimp
  76:	3e00                	fld	fs0,56(a2)
  78:	0001                	nop
  7a:	0100                	addi	s0,sp,128
  7c:	c99c                	sw	a5,16(a1)
  7e:	0000                	unimp
  80:	0900                	addi	s0,sp,144
  82:	6f6c                	flw	fa1,92(a4)
  84:	15010077          	0x15010077
  88:	3c14                	fld	fa3,56(s0)
  8a:	0000                	unimp
  8c:	0200                	addi	s0,sp,256
  8e:	6491                	lui	s1,0x4
  90:	880a                	mv	a6,sp
  92:	0000                	unimp
  94:	0100                	addi	s0,sp,128
  96:	1d15                	addi	s10,s10,-27
  98:	003c                	addi	a5,sp,8
  9a:	0000                	unimp
  9c:	9102                	jalr	sp
  9e:	0b60                	addi	s0,sp,412
  a0:	0069                	c.nop	26
  a2:	1601                	addi	a2,a2,-32
  a4:	00003c07          	fld	fs8,0(zero) # 0 <my_start>
  a8:	0200                	addi	s0,sp,256
  aa:	7091                	lui	ra,0xfffe4
  ac:	01006a0b          	0x1006a0b
  b0:	003c0717          	auipc	a4,0x3c0
  b4:	0000                	unimp
  b6:	9102                	jalr	sp
  b8:	0c6c                	addi	a1,sp,540
  ba:	00000127          	0x127
  be:	1c01                	addi	s8,s8,-32
  c0:	00003c07          	fld	fs8,0(zero) # 0 <my_start>
  c4:	0200                	addi	s0,sp,256
  c6:	6891                	lui	a7,0x4
  c8:	0d00                	addi	s0,sp,656
  ca:	00000083          	lb	ra,0(zero) # 0 <my_start>
  ce:	0e01                	addi	t3,t3,0
  d0:	3206                	fld	ft4,96(sp)
  d2:	0000                	unimp
  d4:	3800                	fld	fs0,48(s0)
  d6:	0000                	unimp
  d8:	0100                	addi	s0,sp,128
  da:	079c                	addi	a5,sp,960
  dc:	0001                	nop
  de:	0900                	addi	s0,sp,144
  e0:	0061                	c.nop	24
  e2:	0e01                	addi	t3,t3,0
  e4:	0710                	addi	a2,sp,896
  e6:	0001                	nop
  e8:	0200                	addi	s0,sp,256
  ea:	7491                	lui	s1,0xfffe4
  ec:	6209                	lui	tp,0x2
  ee:	0100                	addi	s0,sp,128
  f0:	180e                	slli	a6,a6,0x23
  f2:	00000107          	0x107
  f6:	9102                	jalr	sp
  f8:	0b70                	addi	a2,sp,412
  fa:	0078                	addi	a4,sp,12
  fc:	0f01                	addi	t5,t5,0
  fe:	00003c07          	fld	fs8,0(zero) # 0 <my_start>
 102:	0200                	addi	s0,sp,256
 104:	7891                	lui	a7,0xfffe4
 106:	0e00                	addi	s0,sp,784
 108:	3c04                	fld	fs1,56(s0)
 10a:	0000                	unimp
 10c:	0000                	unimp
 10e:	0022                	c.slli	zero,0x8
 110:	0000                	unimp
 112:	0002                	c.slli64	zero
 114:	00f0                	addi	a2,sp,76
 116:	0000                	unimp
 118:	0104                	addi	s1,sp,128
 11a:	00000157          	0x157
 11e:	01c2                	slli	gp,gp,0x10
 120:	0000                	unimp
 122:	01e2                	slli	gp,gp,0x18
 124:	0000                	unimp
 126:	012c                	addi	a1,sp,136
 128:	0000                	unimp
 12a:	000d                	c.nop	3
 12c:	0000                	unimp
 12e:	00000137          	lui	sp,0x0
 132:	8001                	c.srli64	s0
 134:	0022                	c.slli	zero,0x8
 136:	0000                	unimp
 138:	0002                	c.slli64	zero
 13a:	0104                	addi	s1,sp,128
 13c:	0000                	unimp
 13e:	0104                	addi	s1,sp,128
 140:	01b6                	slli	gp,gp,0xd
 142:	0000                	unimp
 144:	01e2                	slli	gp,gp,0x18
 146:	0000                	unimp
 148:	020c                	addi	a1,sp,256
 14a:	0000                	unimp
 14c:	00000143          	fmadd.s	ft2,ft0,ft0,ft0,rne
 150:	000d                	c.nop	3
 152:	0000                	unimp
 154:	00000137          	lui	sp,0x0
 158:	8001                	c.srli64	s0
 15a:	0022                	c.slli	zero,0x8
 15c:	0000                	unimp
 15e:	0002                	c.slli64	zero
 160:	0118                	addi	a4,sp,128
 162:	0000                	unimp
 164:	0104                	addi	s1,sp,128
 166:	0228                	addi	a0,sp,264
 168:	0000                	unimp
 16a:	0000                	unimp
 16c:	0000                	unimp
 16e:	0032                	c.slli	zero,0xc
 170:	0000                	unimp
 172:	0000014f          	fnmadd.s	ft2,ft0,ft0,ft0,rne
 176:	000d                	c.nop	3
 178:	0000                	unimp
 17a:	00000137          	lui	sp,0x0
 17e:	8001                	c.srli64	s0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	1101                	addi	sp,sp,-32
   2:	2501                	jal	602 <_data_section_lma_start+0x3f6>
   4:	130e                	slli	t1,t1,0x23
   6:	1b0e030b          	0x1b0e030b
   a:	550e                	lw	a0,224(sp)
   c:	10011117          	auipc	sp,0x10011
  10:	02000017          	auipc	zero,0x2000
  14:	0101                	addi	sp,sp,0
  16:	1349                	addi	t1,t1,-14
  18:	1301                	addi	t1,t1,-32
  1a:	0000                	unimp
  1c:	49002103          	lw	sp,1168(zero) # 490 <_data_section_lma_start+0x284>
  20:	000b2f13          	slti	t5,s6,0
  24:	0400                	addi	s0,sp,512
  26:	0024                	addi	s1,sp,8
  28:	0b3e0b0b          	0xb3e0b0b
  2c:	00000e03          	lb	t3,0(zero) # 0 <my_start>
  30:	2405                	jal	250 <_data_section_lma_start+0x44>
  32:	0b00                	addi	s0,sp,400
  34:	030b3e0b          	0x30b3e0b
  38:	0008                	0x8
  3a:	0600                	addi	s0,sp,768
  3c:	0034                	addi	a3,sp,8
  3e:	0b3a0e03          	lb	t3,179(s4)
  42:	0b390b3b          	0xb390b3b
  46:	1349                	addi	t1,t1,-14
  48:	1802193f 2e070000 	0x2e0700001802193f
  50:	3f00                	fld	fs0,56(a4)
  52:	0319                	addi	t1,t1,6
  54:	3a0e                	fld	fs4,224(sp)
  56:	390b3b0b          	0x390b3b0b
  5a:	4919270b          	0x4919270b
  5e:	12011113          	0x12011113
  62:	4006                	0x4006
  64:	9618                	0x9618
  66:	1942                	slli	s2,s2,0x30
  68:	0000                	unimp
  6a:	2e08                	fld	fa0,24(a2)
  6c:	3f01                	jal	ffffff7c <_my_stack_start+0xdffff77c>
  6e:	0319                	addi	t1,t1,6
  70:	3a0e                	fld	fs4,224(sp)
  72:	390b3b0b          	0x390b3b0b
  76:	1119270b          	0x1119270b
  7a:	1201                	addi	tp,tp,-32
  7c:	4006                	0x4006
  7e:	9618                	0x9618
  80:	1942                	slli	s2,s2,0x30
  82:	1301                	addi	t1,t1,-32
  84:	0000                	unimp
  86:	0509                	addi	a0,a0,2
  88:	0300                	addi	s0,sp,384
  8a:	3a08                	fld	fa0,48(a2)
  8c:	390b3b0b          	0x390b3b0b
  90:	0213490b          	0x213490b
  94:	0018                	0x18
  96:	0a00                	addi	s0,sp,272
  98:	0005                	c.nop	1
  9a:	0b3a0e03          	lb	t3,179(s4)
  9e:	0b390b3b          	0xb390b3b
  a2:	1349                	addi	t1,t1,-14
  a4:	1802                	slli	a6,a6,0x20
  a6:	0000                	unimp
  a8:	0300340b          	0x300340b
  ac:	3a08                	fld	fa0,48(a2)
  ae:	390b3b0b          	0x390b3b0b
  b2:	0213490b          	0x213490b
  b6:	0018                	0x18
  b8:	0c00                	addi	s0,sp,528
  ba:	0034                	addi	a3,sp,8
  bc:	0b3a0e03          	lb	t3,179(s4)
  c0:	0b390b3b          	0xb390b3b
  c4:	1349                	addi	t1,t1,-14
  c6:	1802                	slli	a6,a6,0x20
  c8:	0000                	unimp
  ca:	2e0d                	jal	3fc <_data_section_lma_start+0x1f0>
  cc:	3f01                	jal	ffffffdc <_my_stack_start+0xdffff7dc>
  ce:	0319                	addi	t1,t1,6
  d0:	3a0e                	fld	fs4,224(sp)
  d2:	390b3b0b          	0x390b3b0b
  d6:	1119270b          	0x1119270b
  da:	1201                	addi	tp,tp,-32
  dc:	4006                	0x4006
  de:	9718                	0x9718
  e0:	1942                	slli	s2,s2,0x30
  e2:	1301                	addi	t1,t1,-32
  e4:	0000                	unimp
  e6:	0f0e                	slli	t5,t5,0x3
  e8:	0b00                	addi	s0,sp,400
  ea:	0013490b          	0x13490b
  ee:	0000                	unimp
  f0:	1101                	addi	sp,sp,-32
  f2:	1000                	addi	s0,sp,32
  f4:	1106                	slli	sp,sp,0x21
  f6:	1201                	addi	tp,tp,-32
  f8:	0301                	addi	t1,t1,0
  fa:	1b0e                	slli	s6,s6,0x23
  fc:	250e                	fld	fa0,192(sp)
  fe:	130e                	slli	t1,t1,0x23
 100:	0005                	c.nop	1
 102:	0000                	unimp
 104:	1101                	addi	sp,sp,-32
 106:	1000                	addi	s0,sp,32
 108:	1106                	slli	sp,sp,0x21
 10a:	1201                	addi	tp,tp,-32
 10c:	0301                	addi	t1,t1,0
 10e:	1b0e                	slli	s6,s6,0x23
 110:	250e                	fld	fa0,192(sp)
 112:	130e                	slli	t1,t1,0x23
 114:	0005                	c.nop	1
 116:	0000                	unimp
 118:	1101                	addi	sp,sp,-32
 11a:	1000                	addi	s0,sp,32
 11c:	1106                	slli	sp,sp,0x21
 11e:	1201                	addi	tp,tp,-32
 120:	0301                	addi	t1,t1,0
 122:	1b0e                	slli	s6,s6,0x23
 124:	250e                	fld	fa0,192(sp)
 126:	130e                	slli	t1,t1,0x23
 128:	0005                	c.nop	1
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	002c                	addi	a1,sp,8
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0004                	0x4
   c:	0000                	unimp
   e:	0000                	unimp
  10:	0032                	c.slli	zero,0xc
  12:	0000                	unimp
  14:	0038                	addi	a4,sp,8
  16:	0000                	unimp
  18:	006a                	c.slli	zero,0x1a
  1a:	0000                	unimp
  1c:	013e                	slli	sp,sp,0xf
  1e:	0000                	unimp
  20:	01a8                	addi	a0,sp,200
  22:	0000                	unimp
  24:	001a                	c.slli	zero,0x6
	...
  2e:	0000                	unimp
  30:	001c                	0x1c
  32:	0000                	unimp
  34:	0002                	c.slli64	zero
  36:	010e                	slli	sp,sp,0x3
  38:	0000                	unimp
  3a:	0004                	0x4
  3c:	0000                	unimp
  3e:	0000                	unimp
  40:	01c2                	slli	gp,gp,0x10
  42:	0000                	unimp
  44:	0020                	addi	s0,sp,8
	...
  4e:	0000                	unimp
  50:	001c                	0x1c
  52:	0000                	unimp
  54:	0002                	c.slli64	zero
  56:	0134                	addi	a3,sp,136
  58:	0000                	unimp
  5a:	0004                	0x4
  5c:	0000                	unimp
  5e:	0000                	unimp
  60:	01e2                	slli	gp,gp,0x18
  62:	0000                	unimp
  64:	002a                	c.slli	zero,0xa
	...
  6e:	0000                	unimp
  70:	001c                	0x1c
  72:	0000                	unimp
  74:	0002                	c.slli64	zero
  76:	015a                	slli	sp,sp,0x16
  78:	0000                	unimp
  7a:	0004                	0x4
	...
  84:	0032                	c.slli	zero,0xc
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	0032                	c.slli	zero,0xc
   2:	0000                	unimp
   4:	006a                	c.slli	zero,0x1a
   6:	0000                	unimp
   8:	006a                	c.slli	zero,0x1a
   a:	0000                	unimp
   c:	01a8                	addi	a0,sp,200
   e:	0000                	unimp
  10:	01a8                	addi	a0,sp,200
  12:	0000                	unimp
  14:	01c2                	slli	gp,gp,0x10
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000153          	fadd.s	ft2,ft0,ft0,rne
   4:	001d0003          	lb	zero,1(s10)
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
  28:	0205001b          	0x205001b
  2c:	0032                	c.slli	zero,0xc
  2e:	0000                	unimp
  30:	05010d03          	lb	s10,80(sp) # 1001105c <__sram_size+0x1001095c>
  34:	0305                	addi	t1,t1,1
  36:	000e0903          	lb	s2,0(t3) # 1a000 <__sram_size+0x19900>
  3a:	0501                	addi	a0,a0,0
  3c:	0308                	addi	a0,sp,384
  3e:	0901                	addi	s2,s2,0
  40:	000a                	c.slli	zero,0x2
  42:	0501                	addi	a0,a0,0
  44:	0306                	slli	t1,t1,0x1
  46:	0900                	addi	s0,sp,144
  48:	0006                	c.slli	zero,0x1
  4a:	0501                	addi	a0,a0,0
  4c:	0308                	addi	a0,sp,384
  4e:	0901                	addi	s2,s2,0
  50:	0006                	c.slli	zero,0x1
  52:	0501                	addi	a0,a0,0
  54:	0306                	slli	t1,t1,0x1
  56:	0900                	addi	s0,sp,144
  58:	0006                	c.slli	zero,0x1
  5a:	0501                	addi	a0,a0,0
  5c:	0301                	addi	t1,t1,0
  5e:	0901                	addi	s2,s2,0
  60:	0006                	c.slli	zero,0x1
  62:	0901                	addi	s2,s2,0
  64:	0008                	0x8
  66:	0100                	addi	s0,sp,128
  68:	0501                	addi	a0,a0,0
  6a:	02050023          	sb	zero,32(a0)
  6e:	006a                	c.slli	zero,0x1a
  70:	0000                	unimp
  72:	05011403          	lh	s0,80(sp)
  76:	09010307          	0x9010307
  7a:	0010                	0x10
  7c:	0301                	addi	t1,t1,0
  7e:	0901                	addi	s2,s2,0
  80:	0008                	0x8
  82:	0501                	addi	a0,a0,0
  84:	0306                	slli	t1,t1,0x1
  86:	0901                	addi	s2,s2,0
  88:	0008                	0x8
  8a:	0501                	addi	a0,a0,0
  8c:	09040307          	0x9040307
  90:	000c                	0xc
  92:	0501                	addi	a0,a0,0
  94:	0309                	addi	t1,t1,2
  96:	0901                	addi	s2,s2,0
  98:	0016                	c.slli	zero,0x5
  9a:	0501                	addi	a0,a0,0
  9c:	0308                	addi	a0,sp,384
  9e:	0902                	c.slli64	s2
  a0:	0002                	c.slli64	zero
  a2:	0501                	addi	a0,a0,0
  a4:	0318                	addi	a4,sp,384
  a6:	097f                	0x97f
  a8:	000a                	c.slli	zero,0x2
  aa:	0501                	addi	a0,a0,0
  ac:	0900030b          	0x900030b
  b0:	0012                	c.slli	zero,0x4
  b2:	0501                	addi	a0,a0,0
  b4:	0024                	addi	s1,sp,8
  b6:	0402                	c.slli64	s0
  b8:	0301                	addi	t1,t1,0
  ba:	0900                	addi	s0,sp,144
  bc:	0008                	0x8
  be:	0501                	addi	a0,a0,0
  c0:	0903030b          	0x903030b
  c4:	000c                	0xc
  c6:	0501                	addi	a0,a0,0
  c8:	0308                	addi	a0,sp,384
  ca:	0901                	addi	s2,s2,0
  cc:	0002                	c.slli64	zero
  ce:	0501                	addi	a0,a0,0
  d0:	0318                	addi	a4,sp,384
  d2:	097f                	0x97f
  d4:	000a                	c.slli	zero,0x2
  d6:	0501                	addi	a0,a0,0
  d8:	0900030b          	0x900030b
  dc:	0012                	c.slli	zero,0x4
  de:	0501                	addi	a0,a0,0
  e0:	0024                	addi	s1,sp,8
  e2:	0402                	c.slli64	s0
  e4:	0301                	addi	t1,t1,0
  e6:	0900                	addi	s0,sp,144
  e8:	0008                	0x8
  ea:	0501                	addi	a0,a0,0
  ec:	0308                	addi	a0,sp,384
  ee:	000c0903          	lb	s2,0(s8)
  f2:	0501                	addi	a0,a0,0
  f4:	09010307          	0x9010307
  f8:	000c                	0xc
  fa:	0501                	addi	a0,a0,0
  fc:	0309                	addi	t1,t1,2
  fe:	0978                	addi	a4,sp,156
 100:	002c                	addi	a1,sp,8
 102:	0501                	addi	a0,a0,0
 104:	090d0303          	lb	t1,144(s10)
 108:	000c                	0xc
 10a:	0301                	addi	t1,t1,0
 10c:	0901                	addi	s2,s2,0
 10e:	002c                	addi	a1,sp,8
 110:	0301                	addi	t1,t1,0
 112:	0901                	addi	s2,s2,0
 114:	000e                	c.slli	zero,0x3
 116:	0501                	addi	a0,a0,0
 118:	0305                	addi	t1,t1,1
 11a:	096d                	addi	s2,s2,27
 11c:	0010                	0x10
 11e:	0501                	addi	a0,a0,0
 120:	0301                	addi	t1,t1,0
 122:	0914                	addi	a3,sp,144
 124:	0002                	c.slli64	zero
 126:	0901                	addi	s2,s2,0
 128:	0008                	0x8
 12a:	0100                	addi	s0,sp,128
 12c:	0501                	addi	a0,a0,0
 12e:	0010                	0x10
 130:	0205                	addi	tp,tp,1
 132:	01a8                	addi	a0,sp,200
 134:	0000                	unimp
 136:	05012e03          	lw	t3,80(sp)
 13a:	09010303          	lb	t1,144(sp)
 13e:	0008                	0x8
 140:	0501                	addi	a0,a0,0
 142:	030a                	slli	t1,t1,0x2
 144:	0901                	addi	s2,s2,0
 146:	0006                	c.slli	zero,0x1
 148:	0501                	addi	a0,a0,0
 14a:	0301                	addi	t1,t1,0
 14c:	0901                	addi	s2,s2,0
 14e:	0002                	c.slli64	zero
 150:	0901                	addi	s2,s2,0
 152:	000a                	c.slli	zero,0x2
 154:	0100                	addi	s0,sp,128
 156:	5b01                	li	s6,-32
 158:	0000                	unimp
 15a:	0300                	addi	s0,sp,384
 15c:	2100                	fld	fs0,0(a0)
 15e:	0000                	unimp
 160:	0100                	addi	s0,sp,128
 162:	fb01                	bnez	a4,72 <QuickSort+0x8>
 164:	0d0e                	slli	s10,s10,0x3
 166:	0100                	addi	s0,sp,128
 168:	0101                	addi	sp,sp,0
 16a:	0001                	nop
 16c:	0000                	unimp
 16e:	0001                	nop
 170:	0100                	addi	s0,sp,128
 172:	6900                	flw	fs0,16(a0)
 174:	696e                	flw	fs2,216(sp)
 176:	5f74                	lw	a3,124(a4)
 178:	7362                	flw	ft6,56(sp)
 17a:	00532e73          	csrrs	t3,utvec,t1
 17e:	0000                	unimp
 180:	0000                	unimp
 182:	0500                	addi	s0,sp,640
 184:	c202                	sw	zero,4(sp)
 186:	0001                	nop
 188:	0300                	addi	s0,sp,384
 18a:	010c                	addi	a1,sp,128
 18c:	08090103          	lb	sp,128(s2) # 1080 <__sram_size+0x980>
 190:	0100                	addi	s0,sp,128
 192:	08090103          	lb	sp,128(s2)
 196:	0100                	addi	s0,sp,128
 198:	04090303          	lb	t1,64(s2)
 19c:	0100                	addi	s0,sp,128
 19e:	04090103          	lb	sp,64(s2)
 1a2:	0100                	addi	s0,sp,128
 1a4:	02090103          	lb	sp,32(s2)
 1a8:	0100                	addi	s0,sp,128
 1aa:	04090303          	lb	t1,64(s2)
 1ae:	0100                	addi	s0,sp,128
 1b0:	0209                	addi	tp,tp,2
 1b2:	0000                	unimp
 1b4:	0101                	addi	sp,sp,0
 1b6:	006e                	c.slli	zero,0x1b
 1b8:	0000                	unimp
 1ba:	00220003          	lb	zero,2(tp) # 2002 <__sram_size+0x1902>
 1be:	0000                	unimp
 1c0:	0101                	addi	sp,sp,0
 1c2:	000d0efb          	0xd0efb
 1c6:	0101                	addi	sp,sp,0
 1c8:	0101                	addi	sp,sp,0
 1ca:	0000                	unimp
 1cc:	0100                	addi	s0,sp,128
 1ce:	0000                	unimp
 1d0:	0001                	nop
 1d2:	6f6c                	flw	fa1,92(a4)
 1d4:	6461                	lui	s0,0x18
 1d6:	645f 7461 2e61      	0x2e617461645f
 1dc:	00000053          	fadd.s	ft0,ft0,ft0,rne
 1e0:	0000                	unimp
 1e2:	0500                	addi	s0,sp,640
 1e4:	e202                	fsw	ft0,4(sp)
 1e6:	0001                	nop
 1e8:	0300                	addi	s0,sp,384
 1ea:	0110                	addi	a2,sp,128
 1ec:	04090103          	lb	sp,64(s2)
 1f0:	0100                	addi	s0,sp,128
 1f2:	08090103          	lb	sp,128(s2)
 1f6:	0100                	addi	s0,sp,128
 1f8:	08090803          	lb	a6,128(s2)
 1fc:	0100                	addi	s0,sp,128
 1fe:	04090703          	lb	a4,64(s2)
 202:	0100                	addi	s0,sp,128
 204:	04090103          	lb	sp,64(s2)
 208:	0100                	addi	s0,sp,128
 20a:	04090103          	lb	sp,64(s2)
 20e:	0100                	addi	s0,sp,128
 210:	02090103          	lb	sp,32(s2)
 214:	0100                	addi	s0,sp,128
 216:	02090103          	lb	sp,32(s2)
 21a:	0100                	addi	s0,sp,128
 21c:	04090203          	lb	tp,64(s2)
 220:	0100                	addi	s0,sp,128
 222:	0209                	addi	tp,tp,2
 224:	0000                	unimp
 226:	0101                	addi	sp,sp,0
 228:	00a6                	slli	ra,ra,0x9
 22a:	0000                	unimp
 22c:	001e0003          	lb	zero,1(t3)
 230:	0000                	unimp
 232:	0101                	addi	sp,sp,0
 234:	000d0efb          	0xd0efb
 238:	0101                	addi	sp,sp,0
 23a:	0101                	addi	sp,sp,0
 23c:	0000                	unimp
 23e:	0100                	addi	s0,sp,128
 240:	0000                	unimp
 242:	0001                	nop
 244:	72617473          	csrrci	s0,0x726,2
 248:	2e74                	fld	fa3,216(a2)
 24a:	00000053          	fadd.s	ft0,ft0,ft0,rne
 24e:	0000                	unimp
 250:	0500                	addi	s0,sp,640
 252:	0002                	c.slli64	zero
 254:	0000                	unimp
 256:	0300                	addi	s0,sp,384
 258:	0110                	addi	a2,sp,128
 25a:	02090103          	lb	sp,32(s2)
 25e:	0100                	addi	s0,sp,128
 260:	02090103          	lb	sp,32(s2)
 264:	0100                	addi	s0,sp,128
 266:	02090103          	lb	sp,32(s2)
 26a:	0100                	addi	s0,sp,128
 26c:	02090103          	lb	sp,32(s2)
 270:	0100                	addi	s0,sp,128
 272:	02090103          	lb	sp,32(s2)
 276:	0100                	addi	s0,sp,128
 278:	02090103          	lb	sp,32(s2)
 27c:	0100                	addi	s0,sp,128
 27e:	02090103          	lb	sp,32(s2)
 282:	0100                	addi	s0,sp,128
 284:	02090103          	lb	sp,32(s2)
 288:	0100                	addi	s0,sp,128
 28a:	02090103          	lb	sp,32(s2)
 28e:	0100                	addi	s0,sp,128
 290:	02090103          	lb	sp,32(s2)
 294:	0100                	addi	s0,sp,128
 296:	02090103          	lb	sp,32(s2)
 29a:	0100                	addi	s0,sp,128
 29c:	02090103          	lb	sp,32(s2)
 2a0:	0100                	addi	s0,sp,128
 2a2:	02090103          	lb	sp,32(s2)
 2a6:	0100                	addi	s0,sp,128
 2a8:	02090103          	lb	sp,32(s2)
 2ac:	0100                	addi	s0,sp,128
 2ae:	02090303          	lb	t1,32(s2)
 2b2:	0100                	addi	s0,sp,128
 2b4:	08090303          	lb	t1,128(s2)
 2b8:	0100                	addi	s0,sp,128
 2ba:	02090103          	lb	sp,32(s2)
 2be:	0100                	addi	s0,sp,128
 2c0:	04090103          	lb	sp,64(s2)
 2c4:	0100                	addi	s0,sp,128
 2c6:	04090303          	lb	t1,64(s2)
 2ca:	0100                	addi	s0,sp,128
 2cc:	0209                	addi	tp,tp,2
 2ce:	0000                	unimp
 2d0:	0101                	addi	sp,sp,0

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6e75                	lui	t3,0x1d
   2:	6e676973          	csrrsi	s2,0x6e6,14
   6:	6465                	lui	s0,0x19
   8:	6920                	flw	fs0,80(a0)
   a:	746e                	flw	fs0,248(sp)
   c:	2f00                	fld	fs0,24(a4)
   e:	6f68                	flw	fa0,92(a4)
  10:	656d                	lui	a0,0x1b
  12:	7462722f          	0x7462722f
  16:	7061682f          	0x7061682f
  1a:	7970                	flw	fa2,116(a0)
  1c:	6b726f77          	0x6b726f77
  20:	2d35302f          	0x2d35302f
  24:	6972                	flw	fs2,28(sp)
  26:	2d766373          	csrrsi	t1,0x2d7,12
  2a:	7361                	lui	t1,0xffff8
  2c:	2f6d                	jal	7e6 <__sram_size+0xe6>
  2e:	3130                	fld	fa2,96(a0)
  30:	692d                	lui	s2,0xb
  32:	736e                	flw	ft6,248(sp)
  34:	7274                	flw	fa3,100(a2)
  36:	6375                	lui	t1,0x1d
  38:	6974                	flw	fa3,84(a0)
  3a:	662d6e6f          	jal	t3,d669c <__sram_size+0xd5f9c>
  3e:	6e75                	lui	t3,0x1d
  40:	6974                	flw	fa3,84(a0)
  42:	312f6e6f          	jal	t3,f6354 <__sram_size+0xf5c54>
  46:	2d31                	jal	662 <_data_section_lma_start+0x456>
  48:	7865                	lui	a6,0xffff9
  4a:	7265                	lui	tp,0xffff9
  4c:	65736963          	bltu	t1,s7,69e <_data_section_lma_start+0x492>
  50:	2d32302f          	0x2d32302f
  54:	6572                	flw	fa0,28(sp)
  56:	6461                	lui	s0,0x18
  58:	2d79                	jal	6f6 <_data_section_lma_start+0x4ea>
  5a:	35302f43          	0x35302f43
  5e:	662d                	lui	a2,0xb
  60:	6172                	flw	ft2,28(sp)
  62:	656d                	lui	a0,0x1b
  64:	5100                	lw	s0,32(a0)
  66:	6975                	lui	s2,0x1d
  68:	6f536b63          	bltu	t1,s5,75e <__sram_size+0x5e>
  6c:	7472                	flw	fs0,60(sp)
  6e:	6e00                	flw	fs0,24(a2)
  70:	6565                	lui	a0,0x19
  72:	5f64                	lw	s1,124(a4)
  74:	6f74                	flw	fa3,92(a4)
  76:	735f 726f 0074      	0x74726f735f
  7c:	616d                	addi	sp,sp,240
  7e:	6e69                	lui	t3,0x1a
  80:	632e                	flw	ft6,200(sp)
  82:	7300                	flw	fs0,32(a4)
  84:	00706177          	0x706177
  88:	6968                	flw	fa0,84(a0)
  8a:	47006867          	0x47006867
  8e:	554e                	lw	a0,240(sp)
  90:	4320                	lw	s0,64(a4)
  92:	3939                	jal	fffffcb0 <_my_stack_start+0xdffff4b0>
  94:	3820                	fld	fs0,112(s0)
  96:	322e                	fld	ft4,232(sp)
  98:	302e                	fld	ft0,232(sp)
  9a:	2d20                	fld	fs0,88(a0)
  9c:	616d                	addi	sp,sp,240
  9e:	6372                	flw	ft6,28(sp)
  a0:	3d68                	fld	fa0,248(a0)
  a2:	7672                	flw	fa2,60(sp)
  a4:	63653233          	0x63653233
  a8:	2d20                	fld	fs0,88(a0)
  aa:	616d                	addi	sp,sp,240
  ac:	6962                	flw	fs2,24(sp)
  ae:	693d                	lui	s2,0xf
  b0:	706c                	flw	fa1,100(s0)
  b2:	20653233          	0x20653233
  b6:	672d                	lui	a4,0xb
  b8:	2d20                	fld	fs0,88(a0)
  ba:	2d20304f          	0x2d20304f
  be:	3d647473          	csrrci	s0,0x3d6,8
  c2:	39756e67          	0x39756e67
  c6:	2039                	jal	d4 <QuickSort+0x6a>
  c8:	662d                	lui	a2,0xb
  ca:	6f6e                	flw	ft10,216(sp)
  cc:	622d                	lui	tp,0xb
  ce:	6975                	lui	s2,0x1d
  d0:	746c                	flw	fa1,108(s0)
  d2:	6e69                	lui	t3,0x1a
  d4:	2d20                	fld	fs0,88(a0)
  d6:	6e66                	flw	ft8,88(sp)
  d8:	75622d6f          	jal	s10,2282e <__sram_size+0x2212e>
  dc:	6c69                	lui	s8,0x1a
  de:	6974                	flw	fa3,84(a0)
  e0:	2d6e                	fld	fs10,216(sp)
  e2:	202a                	fld	ft0,136(sp)
  e4:	662d                	lui	a2,0xb
  e6:	6e676973          	csrrsi	s2,0x6e6,14
  ea:	6465                	lui	s0,0x19
  ec:	632d                	lui	t1,0xb
  ee:	6168                	flw	fa0,68(a0)
  f0:	2072                	fld	ft0,280(sp)
  f2:	662d                	lui	a2,0xb
  f4:	7566                	flw	fa0,120(sp)
  f6:	636e                	flw	ft6,216(sp)
  f8:	6974                	flw	fa3,84(a0)
  fa:	732d6e6f          	jal	t3,d682c <__sram_size+0xd612c>
  fe:	6365                	lui	t1,0x19
 100:	6974                	flw	fa3,84(a0)
 102:	20736e6f          	jal	t3,36b08 <__sram_size+0x36408>
 106:	662d                	lui	a2,0xb
 108:	6164                	flw	fs1,68(a0)
 10a:	6174                	flw	fa3,68(a0)
 10c:	732d                	lui	t1,0xfffeb
 10e:	6365                	lui	t1,0x19
 110:	6974                	flw	fa3,84(a0)
 112:	20736e6f          	jal	t3,36b18 <__sram_size+0x36418>
 116:	662d                	lui	a2,0xb
 118:	6f6e                	flw	ft10,216(sp)
 11a:	632d                	lui	t1,0xb
 11c:	6f6d6d6f          	jal	s10,d6812 <__sram_size+0xd6112>
 120:	006e                	c.slli	zero,0x1b
 122:	616d                	addi	sp,sp,240
 124:	6e69                	lui	t3,0x1a
 126:	7400                	flw	fs0,40(s0)
 128:	6d65                	lui	s10,0x19
 12a:	0070                	addi	a2,sp,12
 12c:	6e69                	lui	t3,0x1a
 12e:	7469                	lui	s0,0xffffa
 130:	625f 7373 532e      	0x532e7373625f
 136:	4700                	lw	s0,8(a4)
 138:	554e                	lw	a0,240(sp)
 13a:	4120                	lw	s0,64(a0)
 13c:	2e322053          	0x2e322053
 140:	6c003233          	0x6c003233
 144:	5f64616f          	jal	sp,4673a <__sram_size+0x4603a>
 148:	6164                	flw	fs1,68(a0)
 14a:	6174                	flw	fa3,68(a0)
 14c:	532e                	lw	t1,232(sp)
 14e:	7300                	flw	fs0,32(a4)
 150:	6174                	flw	fa3,68(a0)
 152:	7472                	flw	fs0,60(sp)
 154:	532e                	lw	t1,232(sp)
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	5078                	lw	a4,100(s0)
   8:	6361                	lui	t1,0x18
   a:	4e47206b          	0x4e47206b
   e:	2055                	jal	b2 <QuickSort+0x48>
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
  10:	001c                	0x1c
  12:	0000                	unimp
  14:	0000                	unimp
  16:	0000                	unimp
  18:	0032                	c.slli	zero,0xc
  1a:	0000                	unimp
  1c:	0038                	addi	a4,sp,8
  1e:	0000                	unimp
  20:	0e42                	slli	t3,t3,0x10
  22:	4210                	lw	a2,0(a2)
  24:	0188                	addi	a0,sp,192
  26:	0c42                	slli	s8,s8,0x10
  28:	0008                	0x8
  2a:	c86e                	sw	s11,16(sp)
  2c:	0d42                	slli	s10,s10,0x10
  2e:	0002                	c.slli64	zero
  30:	0024                	addi	s1,sp,8
  32:	0000                	unimp
  34:	0000                	unimp
  36:	0000                	unimp
  38:	006a                	c.slli	zero,0x1a
  3a:	0000                	unimp
  3c:	013e                	slli	sp,sp,0xf
  3e:	0000                	unimp
  40:	0e42                	slli	t3,t3,0x10
  42:	4420                	lw	s0,72(s0)
  44:	0181                	addi	gp,gp,0
  46:	0288                	addi	a0,sp,320
  48:	0c42                	slli	s8,s8,0x10
  4a:	0008                	0x8
  4c:	c1013003          	0xc1013003
  50:	c842                	sw	a6,16(sp)
  52:	0d42                	slli	s10,s10,0x10
  54:	0002                	c.slli64	zero
  56:	0000                	unimp
  58:	0020                	addi	s0,sp,8
  5a:	0000                	unimp
  5c:	0000                	unimp
  5e:	0000                	unimp
  60:	01a8                	addi	a0,sp,200
  62:	0000                	unimp
  64:	001a                	c.slli	zero,0x6
  66:	0000                	unimp
  68:	0e42                	slli	t3,t3,0x10
  6a:	440c                	lw	a1,8(s0)
  6c:	0181                	addi	gp,gp,0
  6e:	0288                	addi	a0,sp,320
  70:	0c42                	slli	s8,s8,0x10
  72:	0008                	0x8
  74:	c14c                	sw	a1,4(a0)
  76:	c842                	sw	a6,16(sp)
  78:	0d42                	slli	s10,s10,0x10
  7a:	0002                	c.slli64	zero
