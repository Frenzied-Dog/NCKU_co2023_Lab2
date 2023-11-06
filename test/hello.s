	.file	"hello.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata
	.align	2
.LC0:
	.string	"Hello, World!\n"
	.align	2
.LC1:
	.string	"Meow~~"
	.align	2
.LC2:
	.string	"char: %c\nd: %d\nx: %x\nX: %X\nstr: %s\n"
	.align	2
.LC3:
	.string	"#x: %#x\n#X: %#X\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	puts
	li	a5,45056
	addi	a0,a5,1231
	call	putint
	li	a0,10
	call	putchar
	li	a5,-4096
	addi	a0,a5,-1770
	call	putint
	li	a0,10
	call	putchar
	li	a0,1511
	call	puthex_L
	li	a0,10
	call	putchar
	li	a0,1511
	call	puthex_U
	li	a0,10
	call	putchar
	li	a0,10
	call	putchar
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
	li	a4,12288
	addi	a4,a4,-1211
	li	a3,12288
	addi	a3,a3,-1211
	li	a2,12288
	addi	a2,a2,-1211
	li	a1,47
	lui	a0,%hi(.LC2)
	addi	a0,a0,%lo(.LC2)
	call	printf
	li	a5,12288
	addi	a2,a5,-1211
	li	a5,12288
	addi	a1,a5,-1211
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	printf
	call	exit
	nop
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (g2ee5e430018) 12.2.0"
