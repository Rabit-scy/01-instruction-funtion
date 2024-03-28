
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
  26:	2ad1                	jal	1fa <load_data>
  28:	1b2000ef          	jal	ra,1da <init_bss>
  2c:	804022f3          	csrr	t0,0x804
  30:	40000293          	li	t0,1024
  34:	0022e293          	ori	t0,t0,2
  38:	30529073          	csrw	mtvec,t0
  3c:	30502373          	csrr	t1,mtvec
  40:	0dc000ef          	jal	ra,11c <led_cfg>
  44:	0ee000ef          	jal	ra,132 <led_ctrl>
  48:	20e000ef          	jal	ra,256 <watch_systick_reg>
  4c:	1d8000ef          	jal	ra,224 <systick_cfg>
  50:	206000ef          	jal	ra,256 <watch_systick_reg>
  54:	0001                	nop
  56:	30200073          	mret
	...

0000005c <watch_rcc_reg>:
  5c:	1171                	addi	sp,sp,-4
  5e:	c006                	sw	ra,0(sp)
  60:	20000797          	auipc	a5,0x20000
  64:	fa078793          	addi	a5,a5,-96 # 20000000 <_data_section_vma_start>
  68:	40021737          	lui	a4,0x40021
  6c:	4314                	lw	a3,0(a4)
  6e:	c394                	sw	a3,0(a5)
  70:	40021737          	lui	a4,0x40021
  74:	00470713          	addi	a4,a4,4 # 40021004 <__RCC_CFGR0>
  78:	4314                	lw	a3,0(a4)
  7a:	c3d4                	sw	a3,4(a5)
  7c:	40021737          	lui	a4,0x40021
  80:	00870713          	addi	a4,a4,8 # 40021008 <__RCC_INTR>
  84:	4314                	lw	a3,0(a4)
  86:	c794                	sw	a3,8(a5)
  88:	40021737          	lui	a4,0x40021
  8c:	00c70713          	addi	a4,a4,12 # 4002100c <__RCC_APB2PRSTR>
  90:	4314                	lw	a3,0(a4)
  92:	c7d4                	sw	a3,12(a5)
  94:	40021737          	lui	a4,0x40021
  98:	01070713          	addi	a4,a4,16 # 40021010 <__RCC_APB1PRSTR>
  9c:	4314                	lw	a3,0(a4)
  9e:	cb94                	sw	a3,16(a5)
  a0:	40021737          	lui	a4,0x40021
  a4:	01470713          	addi	a4,a4,20 # 40021014 <__RCC_AHBPCENR>
  a8:	4314                	lw	a3,0(a4)
  aa:	cbd4                	sw	a3,20(a5)
  ac:	40021737          	lui	a4,0x40021
  b0:	01870713          	addi	a4,a4,24 # 40021018 <__RCC_APB2PCENR>
  b4:	4314                	lw	a3,0(a4)
  b6:	cf94                	sw	a3,24(a5)
  b8:	40021737          	lui	a4,0x40021
  bc:	01c70713          	addi	a4,a4,28 # 4002101c <__RCC_APB1PCENR>
  c0:	4314                	lw	a3,0(a4)
  c2:	cfd4                	sw	a3,28(a5)
  c4:	40021737          	lui	a4,0x40021
  c8:	02470713          	addi	a4,a4,36 # 40021024 <__RCC_RSTSCKR>
  cc:	4314                	lw	a3,0(a4)
  ce:	d394                	sw	a3,32(a5)
  d0:	4082                	lw	ra,0(sp)
  d2:	0111                	addi	sp,sp,4
  d4:	8082                	ret

000000d6 <watch_gpiod_reg>:
  d6:	1171                	addi	sp,sp,-4
  d8:	c006                	sw	ra,0(sp)
  da:	20000797          	auipc	a5,0x20000
  de:	f4a78793          	addi	a5,a5,-182 # 20000024 <gpiod_struct>
  e2:	40011737          	lui	a4,0x40011
  e6:	40070713          	addi	a4,a4,1024 # 40011400 <__GPIOD_CFGLR>
  ea:	4314                	lw	a3,0(a4)
  ec:	c394                	sw	a3,0(a5)
  ee:	40011737          	lui	a4,0x40011
  f2:	40c70713          	addi	a4,a4,1036 # 4001140c <__GPIOD_OUTDR>
  f6:	00075683          	lhu	a3,0(a4)
  fa:	00d79223          	sh	a3,4(a5)
  fe:	40011737          	lui	a4,0x40011
 102:	41070713          	addi	a4,a4,1040 # 40011410 <__GPIOD_BSHR>
 106:	00075683          	lhu	a3,0(a4)
 10a:	00d79323          	sh	a3,6(a5)
 10e:	00275683          	lhu	a3,2(a4)
 112:	00d79423          	sh	a3,8(a5)
 116:	4082                	lw	ra,0(sp)
 118:	0111                	addi	sp,sp,4
 11a:	8082                	ret

0000011c <led_cfg>:
 11c:	1171                	addi	sp,sp,-4
 11e:	c006                	sw	ra,0(sp)
 120:	3f35                	jal	5c <watch_rcc_reg>
 122:	2849                	jal	1b4 <led_rcc_cfg>
 124:	3f25                	jal	5c <watch_rcc_reg>
 126:	3f45                	jal	d6 <watch_gpiod_reg>
 128:	2081                	jal	168 <led_gpio_cfg>
 12a:	3775                	jal	d6 <watch_gpiod_reg>
 12c:	4082                	lw	ra,0(sp)
 12e:	0111                	addi	sp,sp,4
 130:	8082                	ret

00000132 <led_ctrl>:
 132:	1151                	addi	sp,sp,-12
 134:	c406                	sw	ra,8(sp)
 136:	c222                	sw	s0,4(sp)
 138:	0060                	addi	s0,sp,12
 13a:	fea42a23          	sw	a0,-12(s0)
 13e:	ff442783          	lw	a5,-12(s0)
 142:	40011737          	lui	a4,0x40011
 146:	41070713          	addi	a4,a4,1040 # 40011410 <__GPIOD_BSHR>
 14a:	4685                	li	a3,1
 14c:	c789                	beqz	a5,156 <led_ctrl+0x24>
 14e:	06c2                	slli	a3,a3,0x10
 150:	c314                	sw	a3,0(a4)
 152:	00000563          	beqz	zero,15c <led_ctrl+0x2a>
 156:	00069693          	slli	a3,a3,0x0
 15a:	c314                	sw	a3,0(a4)
 15c:	ff440113          	addi	sp,s0,-12
 160:	c222                	sw	s0,4(sp)
 162:	c406                	sw	ra,8(sp)
 164:	0131                	addi	sp,sp,12
 166:	8082                	ret

00000168 <led_gpio_cfg>:
 168:	1171                	addi	sp,sp,-4
 16a:	c006                	sw	ra,0(sp)
 16c:	400117b7          	lui	a5,0x40011
 170:	40078793          	addi	a5,a5,1024 # 40011400 <__GPIOD_CFGLR>
 174:	4398                	lw	a4,0(a5)
 176:	46bd                	li	a3,15
 178:	00069693          	slli	a3,a3,0x0
 17c:	fff6c693          	not	a3,a3
 180:	8f75                	and	a4,a4,a3
 182:	4689                	li	a3,2
 184:	00069693          	slli	a3,a3,0x0
 188:	8f55                	or	a4,a4,a3
 18a:	c398                	sw	a4,0(a5)
 18c:	400117b7          	lui	a5,0x40011
 190:	40c78793          	addi	a5,a5,1036 # 4001140c <__GPIOD_OUTDR>
 194:	4398                	lw	a4,0(a5)
 196:	4685                	li	a3,1
 198:	00069693          	slli	a3,a3,0x0
 19c:	fff6c693          	not	a3,a3
 1a0:	8f75                	and	a4,a4,a3
 1a2:	4685                	li	a3,1
 1a4:	00069693          	slli	a3,a3,0x0
 1a8:	8f55                	or	a4,a4,a3
 1aa:	00e79023          	sh	a4,0(a5)
 1ae:	4082                	lw	ra,0(sp)
 1b0:	0111                	addi	sp,sp,4
 1b2:	8082                	ret

000001b4 <led_rcc_cfg>:
 1b4:	1171                	addi	sp,sp,-4
 1b6:	c006                	sw	ra,0(sp)
 1b8:	400217b7          	lui	a5,0x40021
 1bc:	01878793          	addi	a5,a5,24 # 40021018 <__RCC_APB2PCENR>
 1c0:	4398                	lw	a4,0(a5)
 1c2:	4685                	li	a3,1
 1c4:	0696                	slli	a3,a3,0x5
 1c6:	fff6c693          	not	a3,a3
 1ca:	8f75                	and	a4,a4,a3
 1cc:	4685                	li	a3,1
 1ce:	0696                	slli	a3,a3,0x5
 1d0:	8f55                	or	a4,a4,a3
 1d2:	c398                	sw	a4,0(a5)
 1d4:	4082                	lw	ra,0(sp)
 1d6:	0111                	addi	sp,sp,4
 1d8:	8082                	ret

000001da <init_bss>:
 1da:	20000797          	auipc	a5,0x20000
 1de:	e6a78793          	addi	a5,a5,-406 # 20000044 <_data_section_vma_end>
 1e2:	20000717          	auipc	a4,0x20000
 1e6:	e6270713          	addi	a4,a4,-414 # 20000044 <_data_section_vma_end>
 1ea:	00f70763          	beq	a4,a5,1f8 <init_bss+0x1e>
 1ee:	0007a023          	sw	zero,0(a5)
 1f2:	0791                	addi	a5,a5,4
 1f4:	fee7cde3          	blt	a5,a4,1ee <init_bss+0x14>
 1f8:	8082                	ret

000001fa <load_data>:
 1fa:	41800793          	li	a5,1048
 1fe:	20000717          	auipc	a4,0x20000
 202:	e0270713          	addi	a4,a4,-510 # 20000000 <_data_section_vma_start>
 206:	20000697          	auipc	a3,0x20000
 20a:	e3e68693          	addi	a3,a3,-450 # 20000044 <_data_section_vma_end>
 20e:	00d70a63          	beq	a4,a3,222 <load_data+0x28>
 212:	0007a283          	lw	t0,0(a5)
 216:	00572023          	sw	t0,0(a4)
 21a:	0711                	addi	a4,a4,4
 21c:	0791                	addi	a5,a5,4
 21e:	fed74ae3          	blt	a4,a3,212 <load_data+0x18>
 222:	8082                	ret

00000224 <systick_cfg>:
 224:	1171                	addi	sp,sp,-4
 226:	c006                	sw	ra,0(sp)
 228:	e000f7b7          	lui	a5,0xe000f
 22c:	00878793          	addi	a5,a5,8 # e000f008 <__STK_CMPR+0xfffffff8>
 230:	0007a023          	sw	zero,0(a5)
 234:	e000f7b7          	lui	a5,0xe000f
 238:	01078793          	addi	a5,a5,16 # e000f010 <__STK_CMPR+0x0>
 23c:	6711                	lui	a4,0x4
 23e:	c398                	sw	a4,0(a5)
 240:	e000f7b7          	lui	a5,0xe000f
 244:	4398                	lw	a4,0(a5)
 246:	46bd                	li	a3,15
 248:	8f55                	or	a4,a4,a3
 24a:	00176713          	ori	a4,a4,1
 24e:	c398                	sw	a4,0(a5)
 250:	4082                	lw	ra,0(sp)
 252:	0111                	addi	sp,sp,4
 254:	8082                	ret

00000256 <watch_systick_reg>:
 256:	1161                	addi	sp,sp,-8
 258:	c022                	sw	s0,0(sp)
 25a:	c206                	sw	ra,4(sp)
 25c:	0020                	addi	s0,sp,8
 25e:	20000797          	auipc	a5,0x20000
 262:	dd278793          	addi	a5,a5,-558 # 20000030 <systick_struct>
 266:	e000f737          	lui	a4,0xe000f
 26a:	4314                	lw	a3,0(a4)
 26c:	c394                	sw	a3,0(a5)
 26e:	e000f737          	lui	a4,0xe000f
 272:	00470713          	addi	a4,a4,4 # e000f004 <__STK_CMPR+0xfffffff4>
 276:	4314                	lw	a3,0(a4)
 278:	c3d4                	sw	a3,4(a5)
 27a:	e000f737          	lui	a4,0xe000f
 27e:	00870713          	addi	a4,a4,8 # e000f008 <__STK_CMPR+0xfffffff8>
 282:	4314                	lw	a3,0(a4)
 284:	c794                	sw	a3,8(a5)
 286:	e000f737          	lui	a4,0xe000f
 28a:	01070713          	addi	a4,a4,16 # e000f010 <__STK_CMPR+0x0>
 28e:	4314                	lw	a3,0(a4)
 290:	c7d4                	sw	a3,12(a5)
 292:	4402                	lw	s0,0(sp)
 294:	4092                	lw	ra,4(sp)
 296:	0121                	addi	sp,sp,8
 298:	8082                	ret
	...

Disassembly of section .isr_vector:

0000029c <unified_entry-0x164>:
	...

00000400 <unified_entry>:
 400:	20000297          	auipc	t0,0x20000
 404:	c4028293          	addi	t0,t0,-960 # 20000040 <systick_count>
 408:	0002a303          	lw	t1,0(t0)
 40c:	0305                	addi	t1,t1,1
 40e:	0062a023          	sw	t1,0(t0)
 412:	30200073          	mret
	...

Disassembly of section .data:

20000000 <_data_section_vma_start>:
	...

20000024 <gpiod_struct>:
	...

20000030 <systick_struct>:
	...

20000040 <systick_count>:
20000040:	0000                	unimp
	...

Disassembly of section .my_stack:

20000700 <_my_stack_start-0x100>:
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	02fe                	slli	t0,t0,0x1f
   2:	0000                	unimp
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
  1c:	6f697067          	0x6f697067
  20:	532e                	lw	t1,232(sp)
  22:	0000                	unimp
  24:	0000                	unimp
  26:	0000                	unimp
  28:	0205                	addi	tp,tp,1
  2a:	005c                	addi	a5,sp,4
  2c:	0000                	unimp
  2e:	0100d703          	lhu	a4,16(ra)
  32:	02090103          	lb	sp,32(s2)
  36:	0100                	addi	s0,sp,128
  38:	02090203          	lb	tp,32(s2)
  3c:	0100                	addi	s0,sp,128
  3e:	08090203          	lb	tp,128(s2)
  42:	0100                	addi	s0,sp,128
  44:	04090103          	lb	sp,64(s2)
  48:	0100                	addi	s0,sp,128
  4a:	02090103          	lb	sp,32(s2)
  4e:	0100                	addi	s0,sp,128
  50:	02090103          	lb	sp,32(s2)
  54:	0100                	addi	s0,sp,128
  56:	08090103          	lb	sp,128(s2)
  5a:	0100                	addi	s0,sp,128
  5c:	02090103          	lb	sp,32(s2)
  60:	0100                	addi	s0,sp,128
  62:	02090103          	lb	sp,32(s2)
  66:	0100                	addi	s0,sp,128
  68:	08090103          	lb	sp,128(s2)
  6c:	0100                	addi	s0,sp,128
  6e:	02090103          	lb	sp,32(s2)
  72:	0100                	addi	s0,sp,128
  74:	02090103          	lb	sp,32(s2)
  78:	0100                	addi	s0,sp,128
  7a:	08090103          	lb	sp,128(s2)
  7e:	0100                	addi	s0,sp,128
  80:	02090103          	lb	sp,32(s2)
  84:	0100                	addi	s0,sp,128
  86:	02090103          	lb	sp,32(s2)
  8a:	0100                	addi	s0,sp,128
  8c:	08090103          	lb	sp,128(s2)
  90:	0100                	addi	s0,sp,128
  92:	02090103          	lb	sp,32(s2)
  96:	0100                	addi	s0,sp,128
  98:	02090103          	lb	sp,32(s2)
  9c:	0100                	addi	s0,sp,128
  9e:	08090103          	lb	sp,128(s2)
  a2:	0100                	addi	s0,sp,128
  a4:	02090103          	lb	sp,32(s2)
  a8:	0100                	addi	s0,sp,128
  aa:	02090103          	lb	sp,32(s2)
  ae:	0100                	addi	s0,sp,128
  b0:	08090103          	lb	sp,128(s2)
  b4:	0100                	addi	s0,sp,128
  b6:	02090103          	lb	sp,32(s2)
  ba:	0100                	addi	s0,sp,128
  bc:	02090103          	lb	sp,32(s2)
  c0:	0100                	addi	s0,sp,128
  c2:	08090103          	lb	sp,128(s2)
  c6:	0100                	addi	s0,sp,128
  c8:	02090103          	lb	sp,32(s2)
  cc:	0100                	addi	s0,sp,128
  ce:	02090103          	lb	sp,32(s2)
  d2:	0100                	addi	s0,sp,128
  d4:	08090103          	lb	sp,128(s2)
  d8:	0100                	addi	s0,sp,128
  da:	02090103          	lb	sp,32(s2)
  de:	0100                	addi	s0,sp,128
  e0:	02090203          	lb	tp,32(s2)
  e4:	0100                	addi	s0,sp,128
  e6:	02090103          	lb	sp,32(s2)
  ea:	0100                	addi	s0,sp,128
  ec:	02090103          	lb	sp,32(s2)
  f0:	0100                	addi	s0,sp,128
  f2:	02090603          	lb	a2,32(s2)
  f6:	0100                	addi	s0,sp,128
  f8:	02090103          	lb	sp,32(s2)
  fc:	0100                	addi	s0,sp,128
  fe:	02090203          	lb	tp,32(s2)
 102:	0100                	addi	s0,sp,128
 104:	08090203          	lb	tp,128(s2)
 108:	0100                	addi	s0,sp,128
 10a:	08090103          	lb	sp,128(s2)
 10e:	0100                	addi	s0,sp,128
 110:	02090103          	lb	sp,32(s2)
 114:	0100                	addi	s0,sp,128
 116:	02090203          	lb	tp,32(s2)
 11a:	0100                	addi	s0,sp,128
 11c:	08090103          	lb	sp,128(s2)
 120:	0100                	addi	s0,sp,128
 122:	04090103          	lb	sp,64(s2)
 126:	0100                	addi	s0,sp,128
 128:	04090203          	lb	tp,64(s2)
 12c:	0100                	addi	s0,sp,128
 12e:	08090103          	lb	sp,128(s2)
 132:	0100                	addi	s0,sp,128
 134:	04090103          	lb	sp,64(s2)
 138:	0100                	addi	s0,sp,128
 13a:	04090203          	lb	tp,64(s2)
 13e:	0100                	addi	s0,sp,128
 140:	04090103          	lb	sp,64(s2)
 144:	0100                	addi	s0,sp,128
 146:	04090103          	lb	sp,64(s2)
 14a:	0100                	addi	s0,sp,128
 14c:	02090103          	lb	sp,32(s2)
 150:	0100                	addi	s0,sp,128
 152:	02090103          	lb	sp,32(s2)
 156:	0100                	addi	s0,sp,128
 158:	02090503          	lb	a0,32(s2)
 15c:	0100                	addi	s0,sp,128
 15e:	02090103          	lb	sp,32(s2)
 162:	0100                	addi	s0,sp,128
 164:	02090203          	lb	tp,32(s2)
 168:	0100                	addi	s0,sp,128
 16a:	02090203          	lb	tp,32(s2)
 16e:	0100                	addi	s0,sp,128
 170:	02090203          	lb	tp,32(s2)
 174:	0100                	addi	s0,sp,128
 176:	02090403          	lb	s0,32(s2)
 17a:	0100                	addi	s0,sp,128
 17c:	02090203          	lb	tp,32(s2)
 180:	0100                	addi	s0,sp,128
 182:	02090203          	lb	tp,32(s2)
 186:	0100                	addi	s0,sp,128
 188:	02090303          	lb	t1,32(s2)
 18c:	0100                	addi	s0,sp,128
 18e:	02090103          	lb	sp,32(s2)
 192:	0100                	addi	s0,sp,128
 194:	02090103          	lb	sp,32(s2)
 198:	0100                	addi	s0,sp,128
 19a:	02090703          	lb	a4,32(s2)
 19e:	0100                	addi	s0,sp,128
 1a0:	02090103          	lb	sp,32(s2)
 1a4:	0100                	addi	s0,sp,128
 1a6:	02090103          	lb	sp,32(s2)
 1aa:	0100                	addi	s0,sp,128
 1ac:	02090103          	lb	sp,32(s2)
 1b0:	0100                	addi	s0,sp,128
 1b2:	02090103          	lb	sp,32(s2)
 1b6:	0100                	addi	s0,sp,128
 1b8:	04090203          	lb	tp,64(s2)
 1bc:	0100                	addi	s0,sp,128
 1be:	04090203          	lb	tp,64(s2)
 1c2:	0100                	addi	s0,sp,128
 1c4:	08090503          	lb	a0,128(s2)
 1c8:	0100                	addi	s0,sp,128
 1ca:	02090203          	lb	tp,32(s2)
 1ce:	0100                	addi	s0,sp,128
 1d0:	02090303          	lb	t1,32(s2)
 1d4:	0100                	addi	s0,sp,128
 1d6:	02090303          	lb	t1,32(s2)
 1da:	0100                	addi	s0,sp,128
 1dc:	02090203          	lb	tp,32(s2)
 1e0:	0100                	addi	s0,sp,128
 1e2:	04090403          	lb	s0,64(s2)
 1e6:	0100                	addi	s0,sp,128
 1e8:	04090203          	lb	tp,64(s2)
 1ec:	0100                	addi	s0,sp,128
 1ee:	02090303          	lb	t1,32(s2)
 1f2:	0100                	addi	s0,sp,128
 1f4:	04090103          	lb	sp,64(s2)
 1f8:	0100                	addi	s0,sp,128
 1fa:	02090103          	lb	sp,32(s2)
 1fe:	0100                	addi	s0,sp,128
 200:	02090103          	lb	sp,32(s2)
 204:	0100                	addi	s0,sp,128
 206:	02090203          	lb	tp,32(s2)
 20a:	0100                	addi	s0,sp,128
 20c:	02090603          	lb	a2,32(s2)
 210:	0100                	addi	s0,sp,128
 212:	02090103          	lb	sp,32(s2)
 216:	0100                	addi	s0,sp,128
 218:	02090203          	lb	tp,32(s2)
 21c:	0100                	addi	s0,sp,128
 21e:	08090103          	lb	sp,128(s2)
 222:	0100                	addi	s0,sp,128
 224:	02090303          	lb	t1,32(s2)
 228:	0100                	addi	s0,sp,128
 22a:	02090103          	lb	sp,32(s2)
 22e:	0100                	addi	s0,sp,128
 230:	04090103          	lb	sp,64(s2)
 234:	0100                	addi	s0,sp,128
 236:	04090103          	lb	sp,64(s2)
 23a:	0100                	addi	s0,sp,128
 23c:	02090303          	lb	t1,32(s2)
 240:	0100                	addi	s0,sp,128
 242:	02090103          	lb	sp,32(s2)
 246:	0100                	addi	s0,sp,128
 248:	04090203          	lb	tp,64(s2)
 24c:	0100                	addi	s0,sp,128
 24e:	02090303          	lb	t1,32(s2)
 252:	0100                	addi	s0,sp,128
 254:	02090303          	lb	t1,32(s2)
 258:	0100                	addi	s0,sp,128
 25a:	08090103          	lb	sp,128(s2)
 25e:	0100                	addi	s0,sp,128
 260:	02090303          	lb	t1,32(s2)
 264:	0100                	addi	s0,sp,128
 266:	02090103          	lb	sp,32(s2)
 26a:	0100                	addi	s0,sp,128
 26c:	04090103          	lb	sp,64(s2)
 270:	0100                	addi	s0,sp,128
 272:	04090103          	lb	sp,64(s2)
 276:	0100                	addi	s0,sp,128
 278:	02090303          	lb	t1,32(s2)
 27c:	0100                	addi	s0,sp,128
 27e:	02090103          	lb	sp,32(s2)
 282:	0100                	addi	s0,sp,128
 284:	04090203          	lb	tp,64(s2)
 288:	0100                	addi	s0,sp,128
 28a:	02090303          	lb	t1,32(s2)
 28e:	0100                	addi	s0,sp,128
 290:	04090203          	lb	tp,64(s2)
 294:	0100                	addi	s0,sp,128
 296:	02090103          	lb	sp,32(s2)
 29a:	0100                	addi	s0,sp,128
 29c:	02090103          	lb	sp,32(s2)
 2a0:	0100                	addi	s0,sp,128
 2a2:	02090603          	lb	a2,32(s2)
 2a6:	0100                	addi	s0,sp,128
 2a8:	02090103          	lb	sp,32(s2)
 2ac:	0100                	addi	s0,sp,128
 2ae:	02090203          	lb	tp,32(s2)
 2b2:	0100                	addi	s0,sp,128
 2b4:	08090103          	lb	sp,128(s2)
 2b8:	0100                	addi	s0,sp,128
 2ba:	02090303          	lb	t1,32(s2)
 2be:	0100                	addi	s0,sp,128
 2c0:	02090103          	lb	sp,32(s2)
 2c4:	0100                	addi	s0,sp,128
 2c6:	02090103          	lb	sp,32(s2)
 2ca:	0100                	addi	s0,sp,128
 2cc:	04090103          	lb	sp,64(s2)
 2d0:	0100                	addi	s0,sp,128
 2d2:	02090303          	lb	t1,32(s2)
 2d6:	0100                	addi	s0,sp,128
 2d8:	02090103          	lb	sp,32(s2)
 2dc:	0100                	addi	s0,sp,128
 2de:	02090103          	lb	sp,32(s2)
 2e2:	0100                	addi	s0,sp,128
 2e4:	02090303          	lb	t1,32(s2)
 2e8:	0100                	addi	s0,sp,128
 2ea:	02090203          	lb	tp,32(s2)
 2ee:	0100                	addi	s0,sp,128
 2f0:	02090103          	lb	sp,32(s2)
 2f4:	0100                	addi	s0,sp,128
 2f6:	02090103          	lb	sp,32(s2)
 2fa:	0100                	addi	s0,sp,128
 2fc:	0209                	addi	tp,tp,2
 2fe:	0000                	unimp
 300:	0101                	addi	sp,sp,0
 302:	0000005b          	0x5b
 306:	00210003          	lb	zero,2(sp)
 30a:	0000                	unimp
 30c:	0101                	addi	sp,sp,0
 30e:	000d0efb          	0xd0efb
 312:	0101                	addi	sp,sp,0
 314:	0101                	addi	sp,sp,0
 316:	0000                	unimp
 318:	0100                	addi	s0,sp,128
 31a:	0000                	unimp
 31c:	0001                	nop
 31e:	6e69                	lui	t3,0x1a
 320:	7469                	lui	s0,0xffffa
 322:	625f 7373 532e      	0x532e7373625f
 328:	0000                	unimp
 32a:	0000                	unimp
 32c:	0000                	unimp
 32e:	0205                	addi	tp,tp,1
 330:	01da                	slli	gp,gp,0x16
 332:	0000                	unimp
 334:	03010c03          	lb	s8,48(sp)
 338:	0901                	addi	s2,s2,0
 33a:	0008                	0x8
 33c:	0301                	addi	t1,t1,0
 33e:	0901                	addi	s2,s2,0
 340:	0008                	0x8
 342:	0301                	addi	t1,t1,0
 344:	00040903          	lb	s2,0(s0) # ffffa000 <__STK_CMPR+0x1ffeaff0>
 348:	0301                	addi	t1,t1,0
 34a:	0901                	addi	s2,s2,0
 34c:	0004                	0x4
 34e:	0301                	addi	t1,t1,0
 350:	0901                	addi	s2,s2,0
 352:	0002                	c.slli64	zero
 354:	0301                	addi	t1,t1,0
 356:	00040903          	lb	s2,0(s0)
 35a:	0901                	addi	s2,s2,0
 35c:	0002                	c.slli64	zero
 35e:	0100                	addi	s0,sp,128
 360:	6e01                	0x6e01
 362:	0000                	unimp
 364:	0300                	addi	s0,sp,384
 366:	2200                	fld	fs0,0(a2)
 368:	0000                	unimp
 36a:	0100                	addi	s0,sp,128
 36c:	fb01                	bnez	a4,27c <watch_systick_reg+0x26>
 36e:	0d0e                	slli	s10,s10,0x3
 370:	0100                	addi	s0,sp,128
 372:	0101                	addi	sp,sp,0
 374:	0001                	nop
 376:	0000                	unimp
 378:	0001                	nop
 37a:	0100                	addi	s0,sp,128
 37c:	6c00                	flw	fs0,24(s0)
 37e:	5f64616f          	jal	sp,46974 <__sram_size+0x46274>
 382:	6164                	flw	fs1,68(a0)
 384:	6174                	flw	fa3,68(a0)
 386:	532e                	lw	t1,232(sp)
 388:	0000                	unimp
 38a:	0000                	unimp
 38c:	0000                	unimp
 38e:	0205                	addi	tp,tp,1
 390:	01fa                	slli	gp,gp,0x1e
 392:	0000                	unimp
 394:	03011003          	lh	zero,48(sp)
 398:	0901                	addi	s2,s2,0
 39a:	0004                	0x4
 39c:	0301                	addi	t1,t1,0
 39e:	0901                	addi	s2,s2,0
 3a0:	0008                	0x8
 3a2:	0301                	addi	t1,t1,0
 3a4:	0908                	addi	a0,sp,144
 3a6:	0008                	0x8
 3a8:	0301                	addi	t1,t1,0
 3aa:	00040907          	0x40907
 3ae:	0301                	addi	t1,t1,0
 3b0:	0901                	addi	s2,s2,0
 3b2:	0004                	0x4
 3b4:	0301                	addi	t1,t1,0
 3b6:	0901                	addi	s2,s2,0
 3b8:	0004                	0x4
 3ba:	0301                	addi	t1,t1,0
 3bc:	0901                	addi	s2,s2,0
 3be:	0002                	c.slli64	zero
 3c0:	0301                	addi	t1,t1,0
 3c2:	0901                	addi	s2,s2,0
 3c4:	0002                	c.slli64	zero
 3c6:	0301                	addi	t1,t1,0
 3c8:	0902                	c.slli64	s2
 3ca:	0004                	0x4
 3cc:	0901                	addi	s2,s2,0
 3ce:	0002                	c.slli64	zero
 3d0:	0100                	addi	s0,sp,128
 3d2:	e201                	bnez	a2,3d2 <watch_systick_reg+0x17c>
 3d4:	0000                	unimp
 3d6:	0300                	addi	s0,sp,384
 3d8:	1e00                	addi	s0,sp,816
 3da:	0000                	unimp
 3dc:	0100                	addi	s0,sp,128
 3de:	fb01                	bnez	a4,2ee <watch_systick_reg+0x98>
 3e0:	0d0e                	slli	s10,s10,0x3
 3e2:	0100                	addi	s0,sp,128
 3e4:	0101                	addi	sp,sp,0
 3e6:	0001                	nop
 3e8:	0000                	unimp
 3ea:	0001                	nop
 3ec:	0100                	addi	s0,sp,128
 3ee:	7300                	flw	fs0,32(a4)
 3f0:	6174                	flw	fa3,68(a0)
 3f2:	7472                	flw	fs0,60(sp)
 3f4:	532e                	lw	t1,232(sp)
 3f6:	0000                	unimp
 3f8:	0000                	unimp
 3fa:	0000                	unimp
 3fc:	0205                	addi	tp,tp,1
 3fe:	0000                	unimp
 400:	0000                	unimp
 402:	03010a03          	lb	s4,48(sp)
 406:	0901                	addi	s2,s2,0
 408:	0002                	c.slli64	zero
 40a:	0301                	addi	t1,t1,0
 40c:	0901                	addi	s2,s2,0
 40e:	0002                	c.slli64	zero
 410:	0301                	addi	t1,t1,0
 412:	0901                	addi	s2,s2,0
 414:	0002                	c.slli64	zero
 416:	0301                	addi	t1,t1,0
 418:	0901                	addi	s2,s2,0
 41a:	0002                	c.slli64	zero
 41c:	0301                	addi	t1,t1,0
 41e:	0901                	addi	s2,s2,0
 420:	0002                	c.slli64	zero
 422:	0301                	addi	t1,t1,0
 424:	0901                	addi	s2,s2,0
 426:	0002                	c.slli64	zero
 428:	0301                	addi	t1,t1,0
 42a:	0901                	addi	s2,s2,0
 42c:	0002                	c.slli64	zero
 42e:	0301                	addi	t1,t1,0
 430:	0901                	addi	s2,s2,0
 432:	0002                	c.slli64	zero
 434:	0301                	addi	t1,t1,0
 436:	0901                	addi	s2,s2,0
 438:	0002                	c.slli64	zero
 43a:	0301                	addi	t1,t1,0
 43c:	0901                	addi	s2,s2,0
 43e:	0002                	c.slli64	zero
 440:	0301                	addi	t1,t1,0
 442:	0901                	addi	s2,s2,0
 444:	0002                	c.slli64	zero
 446:	0301                	addi	t1,t1,0
 448:	0901                	addi	s2,s2,0
 44a:	0002                	c.slli64	zero
 44c:	0301                	addi	t1,t1,0
 44e:	0901                	addi	s2,s2,0
 450:	0002                	c.slli64	zero
 452:	0301                	addi	t1,t1,0
 454:	0901                	addi	s2,s2,0
 456:	0002                	c.slli64	zero
 458:	0301                	addi	t1,t1,0
 45a:	00020903          	lb	s2,0(tp) # 0 <my_start>
 45e:	0301                	addi	t1,t1,0
 460:	00080903          	lb	s2,0(a6)
 464:	0301                	addi	t1,t1,0
 466:	0901                	addi	s2,s2,0
 468:	0002                	c.slli64	zero
 46a:	0301                	addi	t1,t1,0
 46c:	00040903          	lb	s2,0(s0)
 470:	0301                	addi	t1,t1,0
 472:	00040903          	lb	s2,0(s0)
 476:	0301                	addi	t1,t1,0
 478:	0901                	addi	s2,s2,0
 47a:	0004                	0x4
 47c:	0301                	addi	t1,t1,0
 47e:	0901                	addi	s2,s2,0
 480:	0004                	0x4
 482:	0301                	addi	t1,t1,0
 484:	0902                	c.slli64	s2
 486:	0004                	0x4
 488:	0301                	addi	t1,t1,0
 48a:	00040903          	lb	s2,0(s0)
 48e:	0301                	addi	t1,t1,0
 490:	0902                	c.slli64	s2
 492:	0004                	0x4
 494:	0301                	addi	t1,t1,0
 496:	00040903          	lb	s2,0(s0)
 49a:	0301                	addi	t1,t1,0
 49c:	0902                	c.slli64	s2
 49e:	0004                	0x4
 4a0:	0301                	addi	t1,t1,0
 4a2:	0902                	c.slli64	s2
 4a4:	0004                	0x4
 4a6:	0301                	addi	t1,t1,0
 4a8:	0905                	addi	s2,s2,1
 4aa:	0004                	0x4
 4ac:	0301                	addi	t1,t1,0
 4ae:	0901                	addi	s2,s2,0
 4b0:	0002                	c.slli64	zero
 4b2:	0901                	addi	s2,s2,0
 4b4:	0004                	0x4
 4b6:	0100                	addi	s0,sp,128
 4b8:	0e01                	addi	t3,t3,0
 4ba:	0001                	nop
 4bc:	0300                	addi	s0,sp,384
 4be:	2000                	fld	fs0,0(s0)
 4c0:	0000                	unimp
 4c2:	0100                	addi	s0,sp,128
 4c4:	fb01                	bnez	a4,3d4 <watch_systick_reg+0x17e>
 4c6:	0d0e                	slli	s10,s10,0x3
 4c8:	0100                	addi	s0,sp,128
 4ca:	0101                	addi	sp,sp,0
 4cc:	0001                	nop
 4ce:	0000                	unimp
 4d0:	0001                	nop
 4d2:	0100                	addi	s0,sp,128
 4d4:	7300                	flw	fs0,32(a4)
 4d6:	7379                	lui	t1,0xffffe
 4d8:	6974                	flw	fa3,84(a0)
 4da:	532e6b63          	bltu	t3,s2,a10 <__sram_size+0x310>
 4de:	0000                	unimp
 4e0:	0000                	unimp
 4e2:	0000                	unimp
 4e4:	0205                	addi	tp,tp,1
 4e6:	0224                	addi	s1,sp,264
 4e8:	0000                	unimp
 4ea:	03012103          	lw	sp,48(sp)
 4ee:	0901                	addi	s2,s2,0
 4f0:	0002                	c.slli64	zero
 4f2:	0301                	addi	t1,t1,0
 4f4:	0902                	c.slli64	s2
 4f6:	0002                	c.slli64	zero
 4f8:	0301                	addi	t1,t1,0
 4fa:	0901                	addi	s2,s2,0
 4fc:	0008                	0x8
 4fe:	0301                	addi	t1,t1,0
 500:	0902                	c.slli64	s2
 502:	0004                	0x4
 504:	0301                	addi	t1,t1,0
 506:	0901                	addi	s2,s2,0
 508:	0008                	0x8
 50a:	0301                	addi	t1,t1,0
 50c:	0901                	addi	s2,s2,0
 50e:	0002                	c.slli64	zero
 510:	0301                	addi	t1,t1,0
 512:	0902                	c.slli64	s2
 514:	0002                	c.slli64	zero
 516:	0301                	addi	t1,t1,0
 518:	0901                	addi	s2,s2,0
 51a:	0004                	0x4
 51c:	0301                	addi	t1,t1,0
 51e:	0901                	addi	s2,s2,0
 520:	0002                	c.slli64	zero
 522:	0301                	addi	t1,t1,0
 524:	0901                	addi	s2,s2,0
 526:	0002                	c.slli64	zero
 528:	0301                	addi	t1,t1,0
 52a:	0902                	c.slli64	s2
 52c:	0002                	c.slli64	zero
 52e:	0301                	addi	t1,t1,0
 530:	0901                	addi	s2,s2,0
 532:	0004                	0x4
 534:	0301                	addi	t1,t1,0
 536:	0902                	c.slli64	s2
 538:	0002                	c.slli64	zero
 53a:	0301                	addi	t1,t1,0
 53c:	0901                	addi	s2,s2,0
 53e:	0002                	c.slli64	zero
 540:	0301                	addi	t1,t1,0
 542:	0902                	c.slli64	s2
 544:	0002                	c.slli64	zero
 546:	0301                	addi	t1,t1,0
 548:	0908                	addi	a0,sp,144
 54a:	0002                	c.slli64	zero
 54c:	0301                	addi	t1,t1,0
 54e:	0901                	addi	s2,s2,0
 550:	0002                	c.slli64	zero
 552:	0301                	addi	t1,t1,0
 554:	0901                	addi	s2,s2,0
 556:	0002                	c.slli64	zero
 558:	0301                	addi	t1,t1,0
 55a:	0901                	addi	s2,s2,0
 55c:	0002                	c.slli64	zero
 55e:	0301                	addi	t1,t1,0
 560:	0905                	addi	s2,s2,1
 562:	0002                	c.slli64	zero
 564:	0301                	addi	t1,t1,0
 566:	0901                	addi	s2,s2,0
 568:	0008                	0x8
 56a:	0301                	addi	t1,t1,0
 56c:	0901                	addi	s2,s2,0
 56e:	0004                	0x4
 570:	0301                	addi	t1,t1,0
 572:	0901                	addi	s2,s2,0
 574:	0002                	c.slli64	zero
 576:	0301                	addi	t1,t1,0
 578:	0901                	addi	s2,s2,0
 57a:	0002                	c.slli64	zero
 57c:	0301                	addi	t1,t1,0
 57e:	0901                	addi	s2,s2,0
 580:	0008                	0x8
 582:	0301                	addi	t1,t1,0
 584:	0901                	addi	s2,s2,0
 586:	0002                	c.slli64	zero
 588:	0301                	addi	t1,t1,0
 58a:	0901                	addi	s2,s2,0
 58c:	0002                	c.slli64	zero
 58e:	0301                	addi	t1,t1,0
 590:	0901                	addi	s2,s2,0
 592:	0008                	0x8
 594:	0301                	addi	t1,t1,0
 596:	0901                	addi	s2,s2,0
 598:	0002                	c.slli64	zero
 59a:	0301                	addi	t1,t1,0
 59c:	0901                	addi	s2,s2,0
 59e:	0002                	c.slli64	zero
 5a0:	0301                	addi	t1,t1,0
 5a2:	0901                	addi	s2,s2,0
 5a4:	0008                	0x8
 5a6:	0301                	addi	t1,t1,0
 5a8:	0901                	addi	s2,s2,0
 5aa:	0002                	c.slli64	zero
 5ac:	0301                	addi	t1,t1,0
 5ae:	00020903          	lb	s2,0(tp) # 0 <my_start>
 5b2:	0301                	addi	t1,t1,0
 5b4:	0901                	addi	s2,s2,0
 5b6:	0002                	c.slli64	zero
 5b8:	0301                	addi	t1,t1,0
 5ba:	0901                	addi	s2,s2,0
 5bc:	0002                	c.slli64	zero
 5be:	0301                	addi	t1,t1,0
 5c0:	0902                	c.slli64	s2
 5c2:	0002                	c.slli64	zero
 5c4:	0901                	addi	s2,s2,0
 5c6:	0002                	c.slli64	zero
 5c8:	0100                	addi	s0,sp,128
 5ca:	4d01                	li	s10,0
 5cc:	0000                	unimp
 5ce:	0300                	addi	s0,sp,384
 5d0:	1f00                	addi	s0,sp,944
 5d2:	0000                	unimp
 5d4:	0100                	addi	s0,sp,128
 5d6:	fb01                	bnez	a4,4e6 <_data_section_lma_start+0xce>
 5d8:	0d0e                	slli	s10,s10,0x3
 5da:	0100                	addi	s0,sp,128
 5dc:	0101                	addi	sp,sp,0
 5de:	0001                	nop
 5e0:	0000                	unimp
 5e2:	0001                	nop
 5e4:	0100                	addi	s0,sp,128
 5e6:	7600                	flw	fs0,40(a2)
 5e8:	6365                	lui	t1,0x19
 5ea:	6f74                	flw	fa3,92(a4)
 5ec:	2e72                	fld	ft8,280(sp)
 5ee:	00000053          	fadd.s	ft0,ft0,ft0,rne
 5f2:	0000                	unimp
 5f4:	0500                	addi	s0,sp,640
 5f6:	0002                	c.slli64	zero
 5f8:	0004                	0x4
 5fa:	0300                	addi	s0,sp,384
 5fc:	0131                	addi	sp,sp,12
 5fe:	08090103          	lb	sp,128(s2)
 602:	0100                	addi	s0,sp,128
 604:	04090103          	lb	sp,64(s2)
 608:	0100                	addi	s0,sp,128
 60a:	02090103          	lb	sp,32(s2)
 60e:	0100                	addi	s0,sp,128
 610:	04090303          	lb	t1,64(s2)
 614:	0100                	addi	s0,sp,128
 616:	0409                	addi	s0,s0,2
 618:	0000                	unimp
 61a:	0101                	addi	sp,sp,0

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	0022                	c.slli	zero,0x8
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0104                	addi	s1,sp,128
   c:	0000                	unimp
   e:	0000                	unimp
  10:	005c                	addi	a5,sp,4
  12:	0000                	unimp
  14:	01da                	slli	gp,gp,0x16
  16:	0000                	unimp
  18:	0000                	unimp
  1a:	0000                	unimp
  1c:	00000007          	0x7
  20:	0095                	addi	ra,ra,5
  22:	0000                	unimp
  24:	8001                	c.srli64	s0
  26:	0022                	c.slli	zero,0x8
  28:	0000                	unimp
  2a:	0002                	c.slli64	zero
  2c:	0014                	0x14
  2e:	0000                	unimp
  30:	0104                	addi	s1,sp,128
  32:	0302                	c.slli64	t1
  34:	0000                	unimp
  36:	01da                	slli	gp,gp,0x16
  38:	0000                	unimp
  3a:	01fa                	slli	gp,gp,0x1e
  3c:	0000                	unimp
  3e:	00a1                	addi	ra,ra,8
  40:	0000                	unimp
  42:	00000007          	0x7
  46:	0095                	addi	ra,ra,5
  48:	0000                	unimp
  4a:	8001                	c.srli64	s0
  4c:	0022                	c.slli	zero,0x8
  4e:	0000                	unimp
  50:	0002                	c.slli64	zero
  52:	0028                	addi	a0,sp,8
  54:	0000                	unimp
  56:	0104                	addi	s1,sp,128
  58:	0361                	addi	t1,t1,24
  5a:	0000                	unimp
  5c:	01fa                	slli	gp,gp,0x1e
  5e:	0000                	unimp
  60:	0224                	addi	s1,sp,264
  62:	0000                	unimp
  64:	00ac                	addi	a1,sp,72
  66:	0000                	unimp
  68:	00000007          	0x7
  6c:	0095                	addi	ra,ra,5
  6e:	0000                	unimp
  70:	8001                	c.srli64	s0
  72:	0022                	c.slli	zero,0x8
  74:	0000                	unimp
  76:	0002                	c.slli64	zero
  78:	003c                	addi	a5,sp,8
  7a:	0000                	unimp
  7c:	0104                	addi	s1,sp,128
  7e:	000003d3          	fadd.s	ft7,ft0,ft0,rne
  82:	0000                	unimp
  84:	0000                	unimp
  86:	005a                	c.slli	zero,0x16
  88:	0000                	unimp
  8a:	00b8                	addi	a4,sp,72
  8c:	0000                	unimp
  8e:	00000007          	0x7
  92:	0095                	addi	ra,ra,5
  94:	0000                	unimp
  96:	8001                	c.srli64	s0
  98:	0022                	c.slli	zero,0x8
  9a:	0000                	unimp
  9c:	0002                	c.slli64	zero
  9e:	0050                	addi	a2,sp,4
  a0:	0000                	unimp
  a2:	0104                	addi	s1,sp,128
  a4:	04b9                	addi	s1,s1,14
  a6:	0000                	unimp
  a8:	0224                	addi	s1,sp,264
  aa:	0000                	unimp
  ac:	029a                	slli	t0,t0,0x6
  ae:	0000                	unimp
  b0:	00c0                	addi	s0,sp,68
  b2:	0000                	unimp
  b4:	00000007          	0x7
  b8:	0095                	addi	ra,ra,5
  ba:	0000                	unimp
  bc:	8001                	c.srli64	s0
  be:	0022                	c.slli	zero,0x8
  c0:	0000                	unimp
  c2:	0002                	c.slli64	zero
  c4:	0064                	addi	s1,sp,12
  c6:	0000                	unimp
  c8:	0104                	addi	s1,sp,128
  ca:	000005cb          	fnmsub.s	fa1,ft0,ft0,ft0,rne
  ce:	0400                	addi	s0,sp,512
  d0:	0000                	unimp
  d2:	0416                	slli	s0,s0,0x5
  d4:	0000                	unimp
  d6:	00ca                	slli	ra,ra,0x12
  d8:	0000                	unimp
  da:	00000007          	0x7
  de:	0095                	addi	ra,ra,5
  e0:	0000                	unimp
  e2:	8001                	c.srli64	s0

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	1101                	addi	sp,sp,-32
   2:	1000                	addi	s0,sp,32
   4:	1106                	slli	sp,sp,0x21
   6:	1201                	addi	tp,tp,-32
   8:	0301                	addi	t1,t1,0
   a:	1b0e                	slli	s6,s6,0x23
   c:	250e                	fld	fa0,192(sp)
   e:	130e                	slli	t1,t1,0x23
  10:	0005                	c.nop	1
  12:	0000                	unimp
  14:	1101                	addi	sp,sp,-32
  16:	1000                	addi	s0,sp,32
  18:	1106                	slli	sp,sp,0x21
  1a:	1201                	addi	tp,tp,-32
  1c:	0301                	addi	t1,t1,0
  1e:	1b0e                	slli	s6,s6,0x23
  20:	250e                	fld	fa0,192(sp)
  22:	130e                	slli	t1,t1,0x23
  24:	0005                	c.nop	1
  26:	0000                	unimp
  28:	1101                	addi	sp,sp,-32
  2a:	1000                	addi	s0,sp,32
  2c:	1106                	slli	sp,sp,0x21
  2e:	1201                	addi	tp,tp,-32
  30:	0301                	addi	t1,t1,0
  32:	1b0e                	slli	s6,s6,0x23
  34:	250e                	fld	fa0,192(sp)
  36:	130e                	slli	t1,t1,0x23
  38:	0005                	c.nop	1
  3a:	0000                	unimp
  3c:	1101                	addi	sp,sp,-32
  3e:	1000                	addi	s0,sp,32
  40:	1106                	slli	sp,sp,0x21
  42:	1201                	addi	tp,tp,-32
  44:	0301                	addi	t1,t1,0
  46:	1b0e                	slli	s6,s6,0x23
  48:	250e                	fld	fa0,192(sp)
  4a:	130e                	slli	t1,t1,0x23
  4c:	0005                	c.nop	1
  4e:	0000                	unimp
  50:	1101                	addi	sp,sp,-32
  52:	1000                	addi	s0,sp,32
  54:	1106                	slli	sp,sp,0x21
  56:	1201                	addi	tp,tp,-32
  58:	0301                	addi	t1,t1,0
  5a:	1b0e                	slli	s6,s6,0x23
  5c:	250e                	fld	fa0,192(sp)
  5e:	130e                	slli	t1,t1,0x23
  60:	0005                	c.nop	1
  62:	0000                	unimp
  64:	1101                	addi	sp,sp,-32
  66:	1000                	addi	s0,sp,32
  68:	1106                	slli	sp,sp,0x21
  6a:	1201                	addi	tp,tp,-32
  6c:	0301                	addi	t1,t1,0
  6e:	1b0e                	slli	s6,s6,0x23
  70:	250e                	fld	fa0,192(sp)
  72:	130e                	slli	t1,t1,0x23
  74:	0005                	c.nop	1
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	001c                	0x1c
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0004                	0x4
   c:	0000                	unimp
   e:	0000                	unimp
  10:	005c                	addi	a5,sp,4
  12:	0000                	unimp
  14:	017e                	slli	sp,sp,0x1f
	...
  1e:	0000                	unimp
  20:	001c                	0x1c
  22:	0000                	unimp
  24:	0002                	c.slli64	zero
  26:	0026                	c.slli	zero,0x9
  28:	0000                	unimp
  2a:	0004                	0x4
  2c:	0000                	unimp
  2e:	0000                	unimp
  30:	01da                	slli	gp,gp,0x16
  32:	0000                	unimp
  34:	0020                	addi	s0,sp,8
	...
  3e:	0000                	unimp
  40:	001c                	0x1c
  42:	0000                	unimp
  44:	0002                	c.slli64	zero
  46:	004c                	addi	a1,sp,4
  48:	0000                	unimp
  4a:	0004                	0x4
  4c:	0000                	unimp
  4e:	0000                	unimp
  50:	01fa                	slli	gp,gp,0x1e
  52:	0000                	unimp
  54:	002a                	c.slli	zero,0xa
	...
  5e:	0000                	unimp
  60:	001c                	0x1c
  62:	0000                	unimp
  64:	0002                	c.slli64	zero
  66:	0072                	c.slli	zero,0x1c
  68:	0000                	unimp
  6a:	0004                	0x4
	...
  74:	005a                	c.slli	zero,0x16
	...
  7e:	0000                	unimp
  80:	001c                	0x1c
  82:	0000                	unimp
  84:	0002                	c.slli64	zero
  86:	0098                	addi	a4,sp,64
  88:	0000                	unimp
  8a:	0004                	0x4
  8c:	0000                	unimp
  8e:	0000                	unimp
  90:	0224                	addi	s1,sp,264
  92:	0000                	unimp
  94:	0076                	c.slli	zero,0x1d
	...
  9e:	0000                	unimp
  a0:	001c                	0x1c
  a2:	0000                	unimp
  a4:	0002                	c.slli64	zero
  a6:	00be                	slli	ra,ra,0xf
  a8:	0000                	unimp
  aa:	0004                	0x4
  ac:	0000                	unimp
  ae:	0000                	unimp
  b0:	0400                	addi	s0,sp,512
  b2:	0000                	unimp
  b4:	0016                	c.slli	zero,0x5
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6f697067          	0x6f697067
   4:	532e                	lw	t1,232(sp)
   6:	2f00                	fld	fs0,24(a4)
   8:	6f68                	flw	fa0,92(a4)
   a:	656d                	lui	a0,0x1b
   c:	7462722f          	0x7462722f
  10:	7061682f          	0x7061682f
  14:	7970                	flw	fa2,116(a0)
  16:	6b726f77          	0x6b726f77
  1a:	2d35302f          	0x2d35302f
  1e:	6972                	flw	fs2,28(sp)
  20:	2d766373          	csrrsi	t1,0x2d7,12
  24:	7361                	lui	t1,0xffff8
  26:	2f6d                	jal	7e0 <__sram_size+0xe0>
  28:	3130                	fld	fa2,96(a0)
  2a:	692d                	lui	s2,0xb
  2c:	736e                	flw	ft6,248(sp)
  2e:	7274                	flw	fa3,100(a2)
  30:	6375                	lui	t1,0x1d
  32:	6974                	flw	fa3,84(a0)
  34:	662d6e6f          	jal	t3,d6696 <__sram_size+0xd5f96>
  38:	6e75                	lui	t3,0x1d
  3a:	6974                	flw	fa3,84(a0)
  3c:	312f6e6f          	jal	t3,f634e <__sram_size+0xf5c4e>
  40:	2d31                	jal	65c <_data_section_lma_start+0x244>
  42:	7865                	lui	a6,0xffff9
  44:	7265                	lui	tp,0xffff9
  46:	65736963          	bltu	t1,s7,698 <_data_section_lma_start+0x280>
  4a:	2d34302f          	0x2d34302f
  4e:	6570                	flw	fa2,76(a0)
  50:	6972                	flw	fs2,28(sp)
  52:	6870                	flw	fa2,84(s0)
  54:	7265                	lui	tp,0xffff9
  56:	6c61                	lui	s8,0x18
  58:	2d31302f          	0x2d31302f
  5c:	65726f63          	bltu	tp,s7,6ba <_data_section_lma_start+0x2a2>
  60:	702d                	c.lui	zero,0xfffeb
  62:	7265                	lui	tp,0xffff9
  64:	7069                	c.lui	zero,0xffffa
  66:	6568                	flw	fa0,76(a0)
  68:	6172                	flw	ft2,28(sp)
  6a:	2f6c                	fld	fa1,216(a4)
  6c:	3330                	fld	fa2,96(a4)
  6e:	652d                	lui	a0,0xb
  70:	6378                	flw	fa4,68(a4)
  72:	7065                	c.lui	zero,0xffff9
  74:	6974                	flw	fa3,84(a0)
  76:	692d6e6f          	jal	t3,d6708 <__sram_size+0xd6008>
  7a:	746e                	flw	fs0,248(sp)
  7c:	7265                	lui	tp,0xffff9
  7e:	7572                	flw	fa0,60(sp)
  80:	7470                	flw	fa2,108(s0)
  82:	2d31302f          	0x2d31302f
  86:	74737973          	csrrci	s2,0x747,6
  8a:	6369                	lui	t1,0x1a
  8c:	61682d6b          	0x61682d6b
  90:	646e                	flw	fs0,216(sp)
  92:	656c                	flw	fa1,76(a0)
  94:	4700                	lw	s0,8(a4)
  96:	554e                	lw	a0,240(sp)
  98:	4120                	lw	s0,64(a0)
  9a:	2e322053          	0x2e322053
  9e:	69003233          	0x69003233
  a2:	696e                	flw	fs2,216(sp)
  a4:	5f74                	lw	a3,124(a4)
  a6:	7362                	flw	ft6,56(sp)
  a8:	00532e73          	csrrs	t3,utvec,t1
  ac:	6f6c                	flw	fa1,92(a4)
  ae:	6461                	lui	s0,0x18
  b0:	645f 7461 2e61      	0x2e617461645f
  b6:	74730053          	0x74730053
  ba:	7261                	lui	tp,0xffff8
  bc:	2e74                	fld	fa3,216(a2)
  be:	79730053          	0x79730053
  c2:	63697473          	csrrci	s0,0x636,18
  c6:	00532e6b          	0x532e6b
  ca:	6576                	flw	fa0,92(sp)
  cc:	726f7463          	bgeu	t5,t1,7f4 <__sram_size+0xf4>
  d0:	532e                	lw	t1,232(sp)
	...
