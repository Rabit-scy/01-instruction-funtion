
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
  26:	22f5                	jal	212 <load_data>
  28:	1ca000ef          	jal	ra,1f2 <init_bss>
  2c:	804022f3          	csrr	t0,0x804
  30:	40000293          	li	t0,1024
  34:	30529073          	csrw	mtvec,t0
  38:	30502373          	csrr	t1,mtvec
  3c:	0f8000ef          	jal	ra,134 <led_cfg>
  40:	1fc000ef          	jal	ra,23c <systick_cfg>
  44:	000022b7          	lui	t0,0x2
  48:	88028293          	addi	t0,t0,-1920 # 1880 <__sram_size+0x1180>
  4c:	300292f3          	csrrw	t0,mstatus,t0
  50:	00000297          	auipc	t0,0x0
  54:	01028293          	addi	t0,t0,16 # 60 <my_main>
  58:	34129073          	csrw	mepc,t0
  5c:	30200073          	mret

00000060 <my_main>:
  60:	21a000ef          	jal	ra,27a <watch_systick_reg>
  64:	80402473          	csrr	s0,0x804
  68:	342024f3          	csrr	s1,mcause
  6c:	0001                	nop
  6e:	fe0009e3          	beqz	zero,60 <my_main>
	...

00000074 <watch_rcc_reg>:
  74:	1171                	addi	sp,sp,-4
  76:	c006                	sw	ra,0(sp)
  78:	20000797          	auipc	a5,0x20000
  7c:	f8878793          	addi	a5,a5,-120 # 20000000 <_data_section_vma_start>
  80:	40021737          	lui	a4,0x40021
  84:	4314                	lw	a3,0(a4)
  86:	c394                	sw	a3,0(a5)
  88:	40021737          	lui	a4,0x40021
  8c:	00470713          	addi	a4,a4,4 # 40021004 <__RCC_CFGR0>
  90:	4314                	lw	a3,0(a4)
  92:	c3d4                	sw	a3,4(a5)
  94:	40021737          	lui	a4,0x40021
  98:	00870713          	addi	a4,a4,8 # 40021008 <__RCC_INTR>
  9c:	4314                	lw	a3,0(a4)
  9e:	c794                	sw	a3,8(a5)
  a0:	40021737          	lui	a4,0x40021
  a4:	00c70713          	addi	a4,a4,12 # 4002100c <__RCC_APB2PRSTR>
  a8:	4314                	lw	a3,0(a4)
  aa:	c7d4                	sw	a3,12(a5)
  ac:	40021737          	lui	a4,0x40021
  b0:	01070713          	addi	a4,a4,16 # 40021010 <__RCC_APB1PRSTR>
  b4:	4314                	lw	a3,0(a4)
  b6:	cb94                	sw	a3,16(a5)
  b8:	40021737          	lui	a4,0x40021
  bc:	01470713          	addi	a4,a4,20 # 40021014 <__RCC_AHBPCENR>
  c0:	4314                	lw	a3,0(a4)
  c2:	cbd4                	sw	a3,20(a5)
  c4:	40021737          	lui	a4,0x40021
  c8:	01870713          	addi	a4,a4,24 # 40021018 <__RCC_APB2PCENR>
  cc:	4314                	lw	a3,0(a4)
  ce:	cf94                	sw	a3,24(a5)
  d0:	40021737          	lui	a4,0x40021
  d4:	01c70713          	addi	a4,a4,28 # 4002101c <__RCC_APB1PCENR>
  d8:	4314                	lw	a3,0(a4)
  da:	cfd4                	sw	a3,28(a5)
  dc:	40021737          	lui	a4,0x40021
  e0:	02470713          	addi	a4,a4,36 # 40021024 <__RCC_RSTSCKR>
  e4:	4314                	lw	a3,0(a4)
  e6:	d394                	sw	a3,32(a5)
  e8:	4082                	lw	ra,0(sp)
  ea:	0111                	addi	sp,sp,4
  ec:	8082                	ret

000000ee <watch_gpiod_reg>:
  ee:	1171                	addi	sp,sp,-4
  f0:	c006                	sw	ra,0(sp)
  f2:	20000797          	auipc	a5,0x20000
  f6:	f3278793          	addi	a5,a5,-206 # 20000024 <gpiod_struct>
  fa:	40011737          	lui	a4,0x40011
  fe:	40070713          	addi	a4,a4,1024 # 40011400 <__GPIOD_CFGLR>
 102:	4314                	lw	a3,0(a4)
 104:	c394                	sw	a3,0(a5)
 106:	40011737          	lui	a4,0x40011
 10a:	40c70713          	addi	a4,a4,1036 # 4001140c <__GPIOD_OUTDR>
 10e:	00075683          	lhu	a3,0(a4)
 112:	00d79223          	sh	a3,4(a5)
 116:	40011737          	lui	a4,0x40011
 11a:	41070713          	addi	a4,a4,1040 # 40011410 <__GPIOD_BSHR>
 11e:	00075683          	lhu	a3,0(a4)
 122:	00d79323          	sh	a3,6(a5)
 126:	00275683          	lhu	a3,2(a4)
 12a:	00d79423          	sh	a3,8(a5)
 12e:	4082                	lw	ra,0(sp)
 130:	0111                	addi	sp,sp,4
 132:	8082                	ret

00000134 <led_cfg>:
 134:	1171                	addi	sp,sp,-4
 136:	c006                	sw	ra,0(sp)
 138:	3f35                	jal	74 <watch_rcc_reg>
 13a:	2849                	jal	1cc <led_rcc_cfg>
 13c:	3f25                	jal	74 <watch_rcc_reg>
 13e:	3f45                	jal	ee <watch_gpiod_reg>
 140:	2081                	jal	180 <led_gpio_cfg>
 142:	3775                	jal	ee <watch_gpiod_reg>
 144:	4082                	lw	ra,0(sp)
 146:	0111                	addi	sp,sp,4
 148:	8082                	ret

0000014a <led_ctrl>:
 14a:	1151                	addi	sp,sp,-12
 14c:	c406                	sw	ra,8(sp)
 14e:	c222                	sw	s0,4(sp)
 150:	0060                	addi	s0,sp,12
 152:	fea42a23          	sw	a0,-12(s0)
 156:	ff442783          	lw	a5,-12(s0)
 15a:	40011737          	lui	a4,0x40011
 15e:	41070713          	addi	a4,a4,1040 # 40011410 <__GPIOD_BSHR>
 162:	4685                	li	a3,1
 164:	c789                	beqz	a5,16e <led_ctrl+0x24>
 166:	06c2                	slli	a3,a3,0x10
 168:	c314                	sw	a3,0(a4)
 16a:	00000563          	beqz	zero,174 <led_ctrl+0x2a>
 16e:	00069693          	slli	a3,a3,0x0
 172:	c314                	sw	a3,0(a4)
 174:	ff440113          	addi	sp,s0,-12
 178:	c222                	sw	s0,4(sp)
 17a:	c406                	sw	ra,8(sp)
 17c:	0131                	addi	sp,sp,12
 17e:	8082                	ret

00000180 <led_gpio_cfg>:
 180:	1171                	addi	sp,sp,-4
 182:	c006                	sw	ra,0(sp)
 184:	400117b7          	lui	a5,0x40011
 188:	40078793          	addi	a5,a5,1024 # 40011400 <__GPIOD_CFGLR>
 18c:	4398                	lw	a4,0(a5)
 18e:	46bd                	li	a3,15
 190:	00069693          	slli	a3,a3,0x0
 194:	fff6c693          	not	a3,a3
 198:	8f75                	and	a4,a4,a3
 19a:	4689                	li	a3,2
 19c:	00069693          	slli	a3,a3,0x0
 1a0:	8f55                	or	a4,a4,a3
 1a2:	c398                	sw	a4,0(a5)
 1a4:	400117b7          	lui	a5,0x40011
 1a8:	40c78793          	addi	a5,a5,1036 # 4001140c <__GPIOD_OUTDR>
 1ac:	4398                	lw	a4,0(a5)
 1ae:	4685                	li	a3,1
 1b0:	00069693          	slli	a3,a3,0x0
 1b4:	fff6c693          	not	a3,a3
 1b8:	8f75                	and	a4,a4,a3
 1ba:	4685                	li	a3,1
 1bc:	00069693          	slli	a3,a3,0x0
 1c0:	8f55                	or	a4,a4,a3
 1c2:	00e79023          	sh	a4,0(a5)
 1c6:	4082                	lw	ra,0(sp)
 1c8:	0111                	addi	sp,sp,4
 1ca:	8082                	ret

000001cc <led_rcc_cfg>:
 1cc:	1171                	addi	sp,sp,-4
 1ce:	c006                	sw	ra,0(sp)
 1d0:	400217b7          	lui	a5,0x40021
 1d4:	01878793          	addi	a5,a5,24 # 40021018 <__RCC_APB2PCENR>
 1d8:	4398                	lw	a4,0(a5)
 1da:	4685                	li	a3,1
 1dc:	0696                	slli	a3,a3,0x5
 1de:	fff6c693          	not	a3,a3
 1e2:	8f75                	and	a4,a4,a3
 1e4:	4685                	li	a3,1
 1e6:	0696                	slli	a3,a3,0x5
 1e8:	8f55                	or	a4,a4,a3
 1ea:	c398                	sw	a4,0(a5)
 1ec:	4082                	lw	ra,0(sp)
 1ee:	0111                	addi	sp,sp,4
 1f0:	8082                	ret

000001f2 <init_bss>:
 1f2:	20000797          	auipc	a5,0x20000
 1f6:	e5278793          	addi	a5,a5,-430 # 20000044 <_data_section_vma_end>
 1fa:	20000717          	auipc	a4,0x20000
 1fe:	e4a70713          	addi	a4,a4,-438 # 20000044 <_data_section_vma_end>
 202:	00f70763          	beq	a4,a5,210 <init_bss+0x1e>
 206:	0007a023          	sw	zero,0(a5)
 20a:	0791                	addi	a5,a5,4
 20c:	fee7cde3          	blt	a5,a4,206 <init_bss+0x14>
 210:	8082                	ret

00000212 <load_data>:
 212:	48000793          	li	a5,1152
 216:	20000717          	auipc	a4,0x20000
 21a:	dea70713          	addi	a4,a4,-534 # 20000000 <_data_section_vma_start>
 21e:	20000697          	auipc	a3,0x20000
 222:	e2668693          	addi	a3,a3,-474 # 20000044 <_data_section_vma_end>
 226:	00d70a63          	beq	a4,a3,23a <load_data+0x28>
 22a:	0007a283          	lw	t0,0(a5)
 22e:	00572023          	sw	t0,0(a4)
 232:	0711                	addi	a4,a4,4
 234:	0791                	addi	a5,a5,4
 236:	fed74ae3          	blt	a4,a3,22a <load_data+0x18>
 23a:	8082                	ret

0000023c <systick_cfg>:
 23c:	1171                	addi	sp,sp,-4
 23e:	c006                	sw	ra,0(sp)
 240:	e000e7b7          	lui	a5,0xe000e
 244:	10078793          	addi	a5,a5,256 # e000e100 <__STK_CMPR+0xfffff0f0>
 248:	6705                	lui	a4,0x1
 24a:	c398                	sw	a4,0(a5)
 24c:	e000f7b7          	lui	a5,0xe000f
 250:	00878793          	addi	a5,a5,8 # e000f008 <__STK_CMPR+0xfffffff8>
 254:	0007a023          	sw	zero,0(a5)
 258:	e000f7b7          	lui	a5,0xe000f
 25c:	01078793          	addi	a5,a5,16 # e000f010 <__STK_CMPR+0x0>
 260:	6741                	lui	a4,0x10
 262:	c398                	sw	a4,0(a5)
 264:	e000f7b7          	lui	a5,0xe000f
 268:	4398                	lw	a4,0(a5)
 26a:	46bd                	li	a3,15
 26c:	8f55                	or	a4,a4,a3
 26e:	00176713          	ori	a4,a4,1
 272:	c398                	sw	a4,0(a5)
 274:	4082                	lw	ra,0(sp)
 276:	0111                	addi	sp,sp,4
 278:	8082                	ret

0000027a <watch_systick_reg>:
 27a:	1161                	addi	sp,sp,-8
 27c:	c022                	sw	s0,0(sp)
 27e:	c206                	sw	ra,4(sp)
 280:	0020                	addi	s0,sp,8
 282:	20000797          	auipc	a5,0x20000
 286:	dae78793          	addi	a5,a5,-594 # 20000030 <systick_struct>
 28a:	e000f737          	lui	a4,0xe000f
 28e:	4314                	lw	a3,0(a4)
 290:	c394                	sw	a3,0(a5)
 292:	e000f737          	lui	a4,0xe000f
 296:	00470713          	addi	a4,a4,4 # e000f004 <__STK_CMPR+0xfffffff4>
 29a:	4314                	lw	a3,0(a4)
 29c:	c3d4                	sw	a3,4(a5)
 29e:	e000f737          	lui	a4,0xe000f
 2a2:	00870713          	addi	a4,a4,8 # e000f008 <__STK_CMPR+0xfffffff8>
 2a6:	4314                	lw	a3,0(a4)
 2a8:	c794                	sw	a3,8(a5)
 2aa:	e000f737          	lui	a4,0xe000f
 2ae:	01070713          	addi	a4,a4,16 # e000f010 <__STK_CMPR+0x0>
 2b2:	4314                	lw	a3,0(a4)
 2b4:	c7d4                	sw	a3,12(a5)
 2b6:	4402                	lw	s0,0(sp)
 2b8:	4092                	lw	ra,4(sp)
 2ba:	0121                	addi	sp,sp,8
 2bc:	8082                	ret
	...

Disassembly of section .isr_vector:

000002c0 <unified_entry-0x140>:
	...

00000400 <unified_entry>:
 400:	342022f3          	csrr	t0,mcause
 404:	80000337          	lui	t1,0x80000
 408:	0062f333          	and	t1,t0,t1
 40c:	00030463          	beqz	t1,414 <unified_entry+0x14>
 410:	02031063          	bnez	t1,430 <unified_entry+0x30>
 414:	80000337          	lui	t1,0x80000
 418:	fff30313          	addi	t1,t1,-1 # 7fffffff <__STK_CMPR+0x9fff0fef>
 41c:	00537433          	and	s0,t1,t0
 420:	e000e337          	lui	t1,0xe000e
 424:	02030313          	addi	t1,t1,32 # e000e020 <__STK_CMPR+0xfffff010>
 428:	00032483          	lw	s1,0(t1)
 42c:	fe0004e3          	beqz	zero,414 <unified_entry+0x14>
 430:	80000337          	lui	t1,0x80000
 434:	fff30313          	addi	t1,t1,-1 # 7fffffff <__STK_CMPR+0x9fff0fef>
 438:	00537433          	and	s0,t1,t0
 43c:	4331                	li	t1,12
 43e:	02641e63          	bne	s0,t1,47a <unified_entry+0x7a>
 442:	20000297          	auipc	t0,0x20000
 446:	bfe28293          	addi	t0,t0,-1026 # 20000040 <systick_count>
 44a:	0002a303          	lw	t1,0(t0)
 44e:	0305                	addi	t1,t1,1
 450:	0062a023          	sw	t1,0(t0)
 454:	00737333          	and	t1,t1,t2
 458:	00137313          	andi	t1,t1,1
 45c:	00030563          	beqz	t1,466 <unified_entry+0x66>
 460:	4501                	li	a0,0
 462:	00000363          	beqz	zero,468 <unified_entry+0x68>
 466:	4505                	li	a0,1
 468:	ce3ff0ef          	jal	ra,14a <led_ctrl>
 46c:	e000f2b7          	lui	t0,0xe000f
 470:	00428293          	addi	t0,t0,4 # e000f004 <__STK_CMPR+0xfffffff4>
 474:	4305                	li	t1,1
 476:	0062a023          	sw	t1,0(t0)
 47a:	30200073          	mret
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
  2a:	0074                	addi	a3,sp,12
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
 330:	01f2                	slli	gp,gp,0x1c
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
 36c:	fb01                	bnez	a4,27c <watch_systick_reg+0x2>
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
 390:	0212                	slli	tp,tp,0x4
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
 3d2:	fa01                	bnez	a2,2e2 <watch_systick_reg+0x68>
 3d4:	0000                	unimp
 3d6:	0300                	addi	s0,sp,384
 3d8:	1e00                	addi	s0,sp,816
 3da:	0000                	unimp
 3dc:	0100                	addi	s0,sp,128
 3de:	fb01                	bnez	a4,2ee <watch_systick_reg+0x74>
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
 478:	0902                	c.slli64	s2
 47a:	0004                	0x4
 47c:	0301                	addi	t1,t1,0
 47e:	0902                	c.slli64	s2
 480:	0004                	0x4
 482:	0301                	addi	t1,t1,0
 484:	00040903          	lb	s2,0(s0)
 488:	0301                	addi	t1,t1,0
 48a:	00040903          	lb	s2,0(s0)
 48e:	0301                	addi	t1,t1,0
 490:	00040903          	lb	s2,0(s0)
 494:	0301                	addi	t1,t1,0
 496:	0901                	addi	s2,s2,0
 498:	0008                	0x8
 49a:	0301                	addi	t1,t1,0
 49c:	090a                	slli	s2,s2,0x2
 49e:	0004                	0x4
 4a0:	0301                	addi	t1,t1,0
 4a2:	0901                	addi	s2,s2,0
 4a4:	0008                	0x8
 4a6:	0301                	addi	t1,t1,0
 4a8:	0901                	addi	s2,s2,0
 4aa:	0004                	0x4
 4ac:	0301                	addi	t1,t1,0
 4ae:	00040907          	0x40907
 4b2:	0301                	addi	t1,t1,0
 4b4:	0901                	addi	s2,s2,0
 4b6:	0004                	0x4
 4b8:	0301                	addi	t1,t1,0
 4ba:	0901                	addi	s2,s2,0
 4bc:	0004                	0x4
 4be:	0301                	addi	t1,t1,0
 4c0:	0901                	addi	s2,s2,0
 4c2:	0004                	0x4
 4c4:	0301                	addi	t1,t1,0
 4c6:	0901                	addi	s2,s2,0
 4c8:	0002                	c.slli64	zero
 4ca:	0901                	addi	s2,s2,0
 4cc:	0004                	0x4
 4ce:	0100                	addi	s0,sp,128
 4d0:	2001                	jal	4d0 <_data_section_lma_start+0x50>
 4d2:	0001                	nop
 4d4:	0300                	addi	s0,sp,384
 4d6:	2000                	fld	fs0,0(s0)
 4d8:	0000                	unimp
 4da:	0100                	addi	s0,sp,128
 4dc:	fb01                	bnez	a4,3ec <watch_systick_reg+0x172>
 4de:	0d0e                	slli	s10,s10,0x3
 4e0:	0100                	addi	s0,sp,128
 4e2:	0101                	addi	sp,sp,0
 4e4:	0001                	nop
 4e6:	0000                	unimp
 4e8:	0001                	nop
 4ea:	0100                	addi	s0,sp,128
 4ec:	7300                	flw	fs0,32(a4)
 4ee:	7379                	lui	t1,0xffffe
 4f0:	6974                	flw	fa3,84(a0)
 4f2:	532e6b63          	bltu	t3,s2,a28 <__sram_size+0x328>
 4f6:	0000                	unimp
 4f8:	0000                	unimp
 4fa:	0000                	unimp
 4fc:	0205                	addi	tp,tp,1
 4fe:	023c                	addi	a5,sp,264
 500:	0000                	unimp
 502:	03012103          	lw	sp,48(sp)
 506:	0901                	addi	s2,s2,0
 508:	0002                	c.slli64	zero
 50a:	0301                	addi	t1,t1,0
 50c:	00020903          	lb	s2,0(tp) # 0 <my_start>
 510:	0301                	addi	t1,t1,0
 512:	0901                	addi	s2,s2,0
 514:	0008                	0x8
 516:	0301                	addi	t1,t1,0
 518:	0901                	addi	s2,s2,0
 51a:	0002                	c.slli64	zero
 51c:	0301                	addi	t1,t1,0
 51e:	0902                	c.slli64	s2
 520:	0002                	c.slli64	zero
 522:	0301                	addi	t1,t1,0
 524:	0901                	addi	s2,s2,0
 526:	0008                	0x8
 528:	0301                	addi	t1,t1,0
 52a:	0902                	c.slli64	s2
 52c:	0004                	0x4
 52e:	0301                	addi	t1,t1,0
 530:	0901                	addi	s2,s2,0
 532:	0008                	0x8
 534:	0301                	addi	t1,t1,0
 536:	0901                	addi	s2,s2,0
 538:	0002                	c.slli64	zero
 53a:	0301                	addi	t1,t1,0
 53c:	0902                	c.slli64	s2
 53e:	0002                	c.slli64	zero
 540:	0301                	addi	t1,t1,0
 542:	0901                	addi	s2,s2,0
 544:	0004                	0x4
 546:	0301                	addi	t1,t1,0
 548:	0901                	addi	s2,s2,0
 54a:	0002                	c.slli64	zero
 54c:	0301                	addi	t1,t1,0
 54e:	0901                	addi	s2,s2,0
 550:	0002                	c.slli64	zero
 552:	0301                	addi	t1,t1,0
 554:	0902                	c.slli64	s2
 556:	0002                	c.slli64	zero
 558:	0301                	addi	t1,t1,0
 55a:	0901                	addi	s2,s2,0
 55c:	0004                	0x4
 55e:	0301                	addi	t1,t1,0
 560:	0902                	c.slli64	s2
 562:	0002                	c.slli64	zero
 564:	0301                	addi	t1,t1,0
 566:	0901                	addi	s2,s2,0
 568:	0002                	c.slli64	zero
 56a:	0301                	addi	t1,t1,0
 56c:	0902                	c.slli64	s2
 56e:	0002                	c.slli64	zero
 570:	0301                	addi	t1,t1,0
 572:	0908                	addi	a0,sp,144
 574:	0002                	c.slli64	zero
 576:	0301                	addi	t1,t1,0
 578:	0901                	addi	s2,s2,0
 57a:	0002                	c.slli64	zero
 57c:	0301                	addi	t1,t1,0
 57e:	0901                	addi	s2,s2,0
 580:	0002                	c.slli64	zero
 582:	0301                	addi	t1,t1,0
 584:	0901                	addi	s2,s2,0
 586:	0002                	c.slli64	zero
 588:	0301                	addi	t1,t1,0
 58a:	0905                	addi	s2,s2,1
 58c:	0002                	c.slli64	zero
 58e:	0301                	addi	t1,t1,0
 590:	0901                	addi	s2,s2,0
 592:	0008                	0x8
 594:	0301                	addi	t1,t1,0
 596:	0901                	addi	s2,s2,0
 598:	0004                	0x4
 59a:	0301                	addi	t1,t1,0
 59c:	0901                	addi	s2,s2,0
 59e:	0002                	c.slli64	zero
 5a0:	0301                	addi	t1,t1,0
 5a2:	0901                	addi	s2,s2,0
 5a4:	0002                	c.slli64	zero
 5a6:	0301                	addi	t1,t1,0
 5a8:	0901                	addi	s2,s2,0
 5aa:	0008                	0x8
 5ac:	0301                	addi	t1,t1,0
 5ae:	0901                	addi	s2,s2,0
 5b0:	0002                	c.slli64	zero
 5b2:	0301                	addi	t1,t1,0
 5b4:	0901                	addi	s2,s2,0
 5b6:	0002                	c.slli64	zero
 5b8:	0301                	addi	t1,t1,0
 5ba:	0901                	addi	s2,s2,0
 5bc:	0008                	0x8
 5be:	0301                	addi	t1,t1,0
 5c0:	0901                	addi	s2,s2,0
 5c2:	0002                	c.slli64	zero
 5c4:	0301                	addi	t1,t1,0
 5c6:	0901                	addi	s2,s2,0
 5c8:	0002                	c.slli64	zero
 5ca:	0301                	addi	t1,t1,0
 5cc:	0901                	addi	s2,s2,0
 5ce:	0008                	0x8
 5d0:	0301                	addi	t1,t1,0
 5d2:	0901                	addi	s2,s2,0
 5d4:	0002                	c.slli64	zero
 5d6:	0301                	addi	t1,t1,0
 5d8:	00020903          	lb	s2,0(tp) # 0 <my_start>
 5dc:	0301                	addi	t1,t1,0
 5de:	0901                	addi	s2,s2,0
 5e0:	0002                	c.slli64	zero
 5e2:	0301                	addi	t1,t1,0
 5e4:	0901                	addi	s2,s2,0
 5e6:	0002                	c.slli64	zero
 5e8:	0301                	addi	t1,t1,0
 5ea:	0902                	c.slli64	s2
 5ec:	0002                	c.slli64	zero
 5ee:	0901                	addi	s2,s2,0
 5f0:	0002                	c.slli64	zero
 5f2:	0100                	addi	s0,sp,128
 5f4:	dd01                	beqz	a0,50c <_data_section_lma_start+0x8c>
 5f6:	0000                	unimp
 5f8:	0300                	addi	s0,sp,384
 5fa:	1f00                	addi	s0,sp,944
 5fc:	0000                	unimp
 5fe:	0100                	addi	s0,sp,128
 600:	fb01                	bnez	a4,510 <_data_section_lma_start+0x90>
 602:	0d0e                	slli	s10,s10,0x3
 604:	0100                	addi	s0,sp,128
 606:	0101                	addi	sp,sp,0
 608:	0001                	nop
 60a:	0000                	unimp
 60c:	0001                	nop
 60e:	0100                	addi	s0,sp,128
 610:	7600                	flw	fs0,40(a2)
 612:	6365                	lui	t1,0x19
 614:	6f74                	flw	fa3,92(a4)
 616:	2e72                	fld	ft8,280(sp)
 618:	00000053          	fadd.s	ft0,ft0,ft0,rne
 61c:	0000                	unimp
 61e:	0500                	addi	s0,sp,640
 620:	0002                	c.slli64	zero
 622:	0004                	0x4
 624:	0300                	addi	s0,sp,384
 626:	0130                	addi	a2,sp,136
 628:	04090203          	lb	tp,64(s2)
 62c:	0100                	addi	s0,sp,128
 62e:	04090203          	lb	tp,64(s2)
 632:	0100                	addi	s0,sp,128
 634:	04090103          	lb	sp,64(s2)
 638:	0100                	addi	s0,sp,128
 63a:	04090103          	lb	sp,64(s2)
 63e:	0100                	addi	s0,sp,128
 640:	04090403          	lb	s0,64(s2)
 644:	0100                	addi	s0,sp,128
 646:	08090103          	lb	sp,128(s2)
 64a:	0100                	addi	s0,sp,128
 64c:	04090103          	lb	sp,64(s2)
 650:	0100                	addi	s0,sp,128
 652:	08090103          	lb	sp,128(s2)
 656:	0100                	addi	s0,sp,128
 658:	04090103          	lb	sp,64(s2)
 65c:	0100                	addi	s0,sp,128
 65e:	04090203          	lb	tp,64(s2)
 662:	0100                	addi	s0,sp,128
 664:	08090103          	lb	sp,128(s2)
 668:	0100                	addi	s0,sp,128
 66a:	04090103          	lb	sp,64(s2)
 66e:	0100                	addi	s0,sp,128
 670:	02090103          	lb	sp,32(s2)
 674:	0100                	addi	s0,sp,128
 676:	04090203          	lb	tp,64(s2)
 67a:	0100                	addi	s0,sp,128
 67c:	08090103          	lb	sp,128(s2)
 680:	0100                	addi	s0,sp,128
 682:	04090103          	lb	sp,64(s2)
 686:	0100                	addi	s0,sp,128
 688:	02090103          	lb	sp,32(s2)
 68c:	0100                	addi	s0,sp,128
 68e:	04090303          	lb	t1,64(s2)
 692:	0100                	addi	s0,sp,128
 694:	04090103          	lb	sp,64(s2)
 698:	0100                	addi	s0,sp,128
 69a:	04090103          	lb	sp,64(s2)
 69e:	0100                	addi	s0,sp,128
 6a0:	04090103          	lb	sp,64(s2)
 6a4:	0100                	addi	s0,sp,128
 6a6:	02090103          	lb	sp,32(s2)
 6aa:	0100                	addi	s0,sp,128
 6ac:	04090203          	lb	tp,64(s2)
 6b0:	0100                	addi	s0,sp,128
 6b2:	02090303          	lb	t1,32(s2)
 6b6:	0100                	addi	s0,sp,128
 6b8:	04090303          	lb	t1,64(s2)
 6bc:	0100                	addi	s0,sp,128
 6be:	08090103          	lb	sp,128(s2)
 6c2:	0100                	addi	s0,sp,128
 6c4:	02090103          	lb	sp,32(s2)
 6c8:	0100                	addi	s0,sp,128
 6ca:	04090203          	lb	tp,64(s2)
 6ce:	0100                	addi	s0,sp,128
 6d0:	0409                	addi	s0,s0,2
 6d2:	0000                	unimp
 6d4:	0101                	addi	sp,sp,0

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
  10:	0074                	addi	a3,sp,12
  12:	0000                	unimp
  14:	01f2                	slli	gp,gp,0x1c
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
  36:	01f2                	slli	gp,gp,0x1c
  38:	0000                	unimp
  3a:	0212                	slli	tp,tp,0x4
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
  5c:	0212                	slli	tp,tp,0x4
  5e:	0000                	unimp
  60:	023c                	addi	a5,sp,264
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
  86:	0072                	c.slli	zero,0x1c
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
  a4:	04d1                	addi	s1,s1,20
  a6:	0000                	unimp
  a8:	023c                	addi	a5,sp,264
  aa:	0000                	unimp
  ac:	02be                	slli	t0,t0,0xf
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
  ca:	05f5                	addi	a1,a1,29
  cc:	0000                	unimp
  ce:	0400                	addi	s0,sp,512
  d0:	0000                	unimp
  d2:	047e                	slli	s0,s0,0x1f
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
  10:	0074                	addi	a3,sp,12
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
  30:	01f2                	slli	gp,gp,0x1c
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
  50:	0212                	slli	tp,tp,0x4
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
  74:	0072                	c.slli	zero,0x1c
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
  90:	023c                	addi	a5,sp,264
  92:	0000                	unimp
  94:	0082                	c.slli64	ra
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
  b4:	007e                	c.slli	zero,0x1f
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
  40:	2d31                	jal	65c <_data_section_lma_start+0x1dc>
  42:	7865                	lui	a6,0xffff9
  44:	7265                	lui	tp,0xffff9
  46:	65736963          	bltu	t1,s7,698 <_data_section_lma_start+0x218>
  4a:	2d34302f          	0x2d34302f
  4e:	6570                	flw	fa2,76(a0)
  50:	6972                	flw	fs2,28(sp)
  52:	6870                	flw	fa2,84(s0)
  54:	7265                	lui	tp,0xffff9
  56:	6c61                	lui	s8,0x18
  58:	2d31302f          	0x2d31302f
  5c:	65726f63          	bltu	tp,s7,6ba <_data_section_lma_start+0x23a>
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
