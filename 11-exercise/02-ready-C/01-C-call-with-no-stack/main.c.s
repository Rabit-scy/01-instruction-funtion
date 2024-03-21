
target.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <sum>:

   0:	1131                	addi	sp,sp,-20     # sp = sp-20
   2:	c822                	sw	s0,16(sp)       # int* (sp+16)[0] = s0 
   4:	0840                	addi	s0,sp,20      # s0 = sp+20

   6:	fea42823          	sw	a0,-16(s0)        # int* (s0-16)[0] = a0  = buffer
   a:	feb42623          	sw	a1,-20(s0)        # int* (s0-20)[0] = a1  = n
   e:	fe042c23          	sw	zero,-8(s0)       # int* (s0-8)[0] = 0    = s
  12:	fe042a23          	sw	zero,-12(s0)      # int* (s0-12)[0] = 0   = i
  # do{
  16:	a01d                	j	0x3c <sum+0x3c>
  # buffer[i]
  18:	ff442783          	lw	a5,-12(s0)        # a5 = int* (s0-12)[0]  ->  i
  1c:	ff042703          	lw	a4,-16(s0)        # a4 = int* (s0-16)[0] = a0 = &buffer[0]
  20:	97ba                	add	a5,a5,a4        # a5 = a5 + a4      ->  buffer + i
  22:	00078783          	lb	a5,0(a5)          # a5 = char* a5[0]  -> char* buffer[i]
  26:	873e                	mv	a4,a5           # a4 = a5
  # s = s + buffer[i]
  28:	ff842783          	lw	a5,-8(s0)         # a5 = int* (s0-8)[0]  ->  s
  2c:	97ba                	add	a5,a5,a4        # a5 = a5+a4        ->  s = s+buffer[i]
  2e:	fef42c23          	sw	a5,-8(s0)         # int* (s0-8)[0] = s
  # i++
  32:	ff442783          	lw	a5,-12(s0)        # a5 = int* (s0-12)[0]
  36:	0785                	addi	a5,a5,1       # a5 = a5+1
  38:	fef42a23          	sw	a5,-12(s0)        # int* (s0-12)[0] = a5;

  3c:	ff442703          	lw	a4,-12(s0)            # a4 = int* (s0-12)[0]
  40:	fec42783          	lw	a5,-20(s0)            # a5 = int* (s0-20)[0]  ->  n
  44:	fcf74ae3          	blt	a4,a5,0x18 <sum+0x18> # a4 < a5, then pc = 0x18
  # }while(i<n)

  48:	ff842783          	lw	a5,-8(s0)     # a5 = int* (s0-8)[0] = s
  4c:	853e                	mv	a0,a5       # a0 = s
  4e:	4442                	lw	s0,16(sp)   # s0 = int* (sp+16)[0]  recover s0
  50:	0151                	addi	sp,sp,20  # sp = sp+20
  52:	8082                	ret

00000054 <main>:
  # alloc 40bytes
  54:	fd810113          	addi	sp,sp,-40
  # push ra and s0  why?
  58:	d206                	sw	ra,36(sp)
  5a:	d022                	sw	s0,32(sp)   # save s0
  5c:	1020                	addi	s0,sp,40  # s0 = sp + 40
  # i = 0
  5e:	fe042823          	sw	zero,-16(s0)  # int* (s0 -16)[0] = 0
  #   see target.bin!!!
  62:	0dc02703          	lw	a4,220(zero)  # dc <main+0x88>    a4 = int* data[0]
  # int* (s0-28)[0] = int* data[0]
  66:	fee42223          	sw	a4,-28(s0)    # int* (s0-28)[0] = int* data[0]
  # int* (s0-24)[0] = int* data[4]
  6a:	0dc00713          	li	a4,220        # a4 = &data[0]
  6e:	4358                	lw	a4,4(a4)    # a4 = int* (a4+4)[0]   -? pc+4?
  70:	fee42423          	sw	a4,-24(s0)    # int* (s0-24)[0] = a4
  # short* (s0-20)[0] = unsigned short* data[8]
  74:	0dc00793          	li	a5,220        # a5 = 0xdc
  78:	0087d783          	lhu	a5,8(a5)      # a5 = unsigned short* (a5+8)[0]
  7c:	fef41623          	sh	a5,-20(s0)    # short* (s0-20)[0] = a5
  
  80:	fc042c23          	sw	zero,-40(s0)  # int* (s0-40)[0] = 0
  84:	fc042e23          	sw	zero,-36(s0)  # int* (s0-36)[0] = 0
  88:	fe041023          	sh	zero,-32(s0)  # int* (s0-32)[0] = 0
  8c:	fe042823          	sw	zero,-16(s0)  # int* (s0-16)[0] = 0
  #do{
  90:	a025                	j	b8 <main+0x64>
  # data[i] = char* (((s0-12)+i)-16)[0]
  92:	ff042783          	lw	a5,-16(s0)    # a5 = int* (s0-16)[0]    a5 = i
  96:	ff440713          	addi	a4,s0,-12   # a4 = s0-12    a4 = 
  9a:	97ba                	add	a5,a5,a4    # a5 = a5+a4
  9c:	ff078703          	lb	a4,-16(a5)    # a4 = char* (a5-16)[0]   char* (((s0-12)+i)-16)[0]
  # buffer[i] = char* (((s0-12)+i)-28)[0]
  a0:	ff042783          	lw	a5,-16(s0)    # a5 = int* (s0-16)[0]    a5 = i
  a4:	ff440693          	addi	a3,s0,-12   # a3 = s0-12    a3 = 
  a8:	97b6                	add	a5,a5,a3    # a5 = a5+a3    
  aa:	fee78223          	sb	a4,-28(a5)    # char* (a5-28)[0] = a4  ->  char* (((s0-12)+i)-28)[0] = a4
  # i++
  ae:	ff042783          	lw	a5,-16(s0)    # a5 = int* (s0-16)[0]    ->  int* (s0-16)[0] <--> int i
  b2:	0785                	addi	a5,a5,1   # a5++      -> i++
  b4:	fef42823          	sw	a5,-16(s0)  # (s0-16)[0] = a5
  # }while(9>=i)
  b8:	ff042703          	lw	a4,-16(s0)  # a4 = int* (s0-16)[0]  a4 = i
  bc:	47a5                	li	a5,9      # a5 = 9
  be:	fce7dae3          	bge	a5,a4,92 <main+0x3e>  # a5>=a4,then 92      9>=i then pc=92

  # caller need pass argument
  c2:	fd840793          	addi	a5,s0,-40  # a5 = s0-40 = &buffer[0]
  c6:	45a9                	li	a1,10   # a1 = 10 = n
  c8:	853e                	mv	a0,a5   # a0 = &buffer[0]
  # sum(buffer, 10)
  ca:	3f1d                	jal	0 <sum>

  cc:	4781                	li	a5,0        # a5 = 0
  ce:	853e                	mv	a0,a5       # a0 = a5
  d0:	5092                	lw	ra,36(sp)   # ra = sp+36    recover ra
  d2:	5402                	lw	s0,32(sp)   # s0 = sp+40    recover s0
  d4:	02810113          	addi	sp,sp,40    # sp = sp+40    free sp
  d8:	8082                	ret             
	...
