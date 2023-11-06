	.file	"user.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	exit
	.type	exit, @function
exit:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a1,0
	li	a0,0
	call	call_to_emu
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	exit, .-exit
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	mv	a5,a0
	sb	a5,-17(s0)
	lbu	a5,-17(s0)
	mv	a1,a5
	li	a0,1
	call	call_to_emu
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	putchar, .-putchar
	.align	2
	.globl	puts
	.type	puts, @function
puts:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	j	.L4
.L5:
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	putchar
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L4:
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L5
	nop
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	puts, .-puts
	.globl	__modsi3
	.globl	__divsi3
	.align	2
	.globl	putint
	.type	putint, @function
putint:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	lw	a5,-52(s0)
	bne	a5,zero,.L7
	li	a0,48
	call	putchar
	j	.L6
.L7:
	sw	zero,-36(s0)
	sw	zero,-32(s0)
	sh	zero,-28(s0)
	lw	a5,-52(s0)
	bge	a5,zero,.L9
	li	a0,45
	call	putchar
	lw	a5,-52(s0)
	neg	a5,a5
	sw	a5,-52(s0)
.L9:
	sw	zero,-20(s0)
	j	.L10
.L11:
	lw	a5,-52(s0)
	li	a1,10
	mv	a0,a5
	call	__modsi3
	mv	a5,a0
	andi	a5,a5,0xff
	addi	a5,a5,48
	andi	a3,a5,0xff
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	slli	a4,a3,24
	srai	a4,a4,24
	addi	a5,a5,-16
	add	a5,a5,s0
	sb	a4,-20(a5)
	lw	a5,-52(s0)
	li	a1,10
	mv	a0,a5
	call	__divsi3
	mv	a5,a0
	sw	a5,-52(s0)
.L10:
	lw	a5,-52(s0)
	bne	a5,zero,.L11
	li	a5,9
	sw	a5,-24(s0)
	j	.L12
.L15:
	lw	a5,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lb	a5,-20(a5)
	beq	a5,zero,.L16
	lw	a5,-24(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lb	a5,-20(a5)
	andi	a5,a5,0xff
	mv	a0,a5
	call	putchar
	j	.L14
.L16:
	nop
.L14:
	lw	a5,-24(s0)
	addi	a5,a5,-1
	sw	a5,-24(s0)
.L12:
	lw	a5,-24(s0)
	bge	a5,zero,.L15
.L6:
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	putint, .-putint
	.align	2
	.globl	puthex_L
	.type	puthex_L, @function
puthex_L:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	zero,-44(s0)
	sw	zero,-40(s0)
	li	a5,15
	sw	a5,-32(s0)
	sw	zero,-36(s0)
	sw	zero,-20(s0)
	j	.L18
.L21:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-32(s0)
	sll	a4,a4,a5
	lw	a5,-52(s0)
	and	a4,a4,a5
	lw	a5,-20(s0)
	slli	a5,a5,2
	srl	a5,a4,a5
	sw	a5,-36(s0)
	lw	a4,-36(s0)
	li	a5,9
	bgtu	a4,a5,.L19
	lw	a5,-36(s0)
	andi	a5,a5,0xff
	addi	a5,a5,48
	andi	a5,a5,0xff
	slli	a5,a5,24
	srai	a5,a5,24
	j	.L20
.L19:
	lw	a5,-36(s0)
	andi	a5,a5,0xff
	addi	a5,a5,87
	andi	a5,a5,0xff
	slli	a5,a5,24
	srai	a5,a5,24
.L20:
	li	a3,7
	lw	a4,-20(s0)
	sub	a4,a3,a4
	addi	a4,a4,-16
	add	a4,a4,s0
	sb	a5,-28(a4)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L18:
	lw	a4,-20(s0)
	li	a5,7
	ble	a4,a5,.L21
	li	a5,1
	sb	a5,-21(s0)
	sw	zero,-28(s0)
	j	.L22
.L25:
	lbu	a5,-21(s0)
	beq	a5,zero,.L23
	lw	a5,-28(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lb	a4,-28(a5)
	li	a5,48
	beq	a4,a5,.L26
.L23:
	sb	zero,-21(s0)
	lw	a5,-28(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lb	a5,-28(a5)
	andi	a5,a5,0xff
	mv	a0,a5
	call	putchar
	j	.L24
.L26:
	nop
.L24:
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L22:
	lw	a4,-28(s0)
	li	a5,7
	ble	a4,a5,.L25
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	puthex_L, .-puthex_L
	.align	2
	.globl	puthex_U
	.type	puthex_U, @function
puthex_U:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	zero,-44(s0)
	sw	zero,-40(s0)
	li	a5,15
	sw	a5,-32(s0)
	sw	zero,-36(s0)
	sw	zero,-20(s0)
	j	.L28
.L31:
	lw	a5,-20(s0)
	slli	a5,a5,2
	lw	a4,-32(s0)
	sll	a4,a4,a5
	lw	a5,-52(s0)
	and	a4,a4,a5
	lw	a5,-20(s0)
	slli	a5,a5,2
	srl	a5,a4,a5
	sw	a5,-36(s0)
	lw	a4,-36(s0)
	li	a5,9
	bgtu	a4,a5,.L29
	lw	a5,-36(s0)
	andi	a5,a5,0xff
	addi	a5,a5,48
	andi	a5,a5,0xff
	slli	a5,a5,24
	srai	a5,a5,24
	j	.L30
.L29:
	lw	a5,-36(s0)
	andi	a5,a5,0xff
	addi	a5,a5,55
	andi	a5,a5,0xff
	slli	a5,a5,24
	srai	a5,a5,24
.L30:
	li	a3,7
	lw	a4,-20(s0)
	sub	a4,a3,a4
	addi	a4,a4,-16
	add	a4,a4,s0
	sb	a5,-28(a4)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L28:
	lw	a4,-20(s0)
	li	a5,7
	ble	a4,a5,.L31
	li	a5,1
	sb	a5,-21(s0)
	sw	zero,-28(s0)
	j	.L32
.L35:
	lbu	a5,-21(s0)
	beq	a5,zero,.L33
	lw	a5,-28(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lb	a4,-28(a5)
	li	a5,48
	beq	a4,a5,.L36
.L33:
	sb	zero,-21(s0)
	lw	a5,-28(s0)
	addi	a5,a5,-16
	add	a5,a5,s0
	lb	a5,-28(a5)
	andi	a5,a5,0xff
	mv	a0,a5
	call	putchar
	j	.L34
.L36:
	nop
.L34:
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L32:
	lw	a4,-28(s0)
	li	a5,7
	ble	a4,a5,.L35
	nop
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	puthex_U, .-puthex_U
	.section	.rodata
	.align	2
.LC0:
	.string	"0x"
	.align	2
.LC1:
	.string	"0X"
	.text
	.align	2
	.globl	printf
	.type	printf, @function
printf:
	addi	sp,sp,-80
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,4(s0)
	sw	a2,8(s0)
	sw	a3,12(s0)
	sw	a4,16(s0)
	sw	a5,20(s0)
	sw	a6,24(s0)
	sw	a7,28(s0)
	addi	a5,s0,32
	sw	a5,-40(s0)
	lw	a5,-40(s0)
	addi	a5,a5,-28
	sw	a5,-20(s0)
	j	.L38
.L50:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,37
	bne	a4,a5,.L39
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,115
	bne	a4,a5,.L40
	lw	a5,-20(s0)
	addi	a4,a5,4
	sw	a4,-20(s0)
	lw	a5,0(a5)
	mv	a0,a5
	call	puts
	j	.L49
.L40:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,99
	bne	a4,a5,.L42
	lw	a5,-20(s0)
	addi	a4,a5,4
	sw	a4,-20(s0)
	lw	a5,0(a5)
	andi	a5,a5,0xff
	mv	a0,a5
	call	putchar
	j	.L49
.L42:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,100
	bne	a4,a5,.L43
	lw	a5,-20(s0)
	addi	a4,a5,4
	sw	a4,-20(s0)
	lw	a5,0(a5)
	mv	a0,a5
	call	putint
	j	.L49
.L43:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,120
	bne	a4,a5,.L44
	lw	a5,-20(s0)
	addi	a4,a5,4
	sw	a4,-20(s0)
	lw	a5,0(a5)
	mv	a0,a5
	call	puthex_L
	j	.L49
.L44:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,35
	bne	a4,a5,.L45
	lw	a5,-36(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	li	a5,120
	bne	a4,a5,.L45
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	lw	a5,-20(s0)
	addi	a4,a5,4
	sw	a4,-20(s0)
	lw	a5,0(a5)
	mv	a0,a5
	call	puthex_L
	j	.L49
.L45:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,88
	bne	a4,a5,.L46
	lw	a5,-20(s0)
	addi	a4,a5,4
	sw	a4,-20(s0)
	lw	a5,0(a5)
	mv	a0,a5
	call	puthex_U
	j	.L49
.L46:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,35
	bne	a4,a5,.L47
	lw	a5,-36(s0)
	addi	a5,a5,1
	lbu	a4,0(a5)
	li	a5,88
	bne	a4,a5,.L47
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	puts
	lw	a5,-20(s0)
	addi	a4,a5,4
	sw	a4,-20(s0)
	lw	a5,0(a5)
	mv	a0,a5
	call	puthex_U
	j	.L49
.L47:
	lw	a5,-36(s0)
	lbu	a4,0(a5)
	li	a5,37
	bne	a4,a5,.L48
	li	a0,37
	call	putchar
	j	.L49
.L48:
	lw	a5,-36(s0)
	addi	a5,a5,-1
	sw	a5,-36(s0)
	j	.L49
.L39:
	lw	a5,-36(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	call	putchar
.L49:
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
.L38:
	lw	a5,-36(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L50
	nop
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,80
	jr	ra
	.size	printf, .-printf
	.ident	"GCC: (g2ee5e430018) 12.2.0"
