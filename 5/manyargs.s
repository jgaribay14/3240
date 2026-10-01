	.arch armv8-a
	.file	"manyargs.c"
	.text
	.align	2
	.global	manyargs
	.type	manyargs, %function
manyargs:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	str	x0, [sp, 56]
	str	x1, [sp, 48]
	str	x2, [sp, 40]
	str	x3, [sp, 32]
	str	x4, [sp, 24]
	str	x5, [sp, 16]
	str	x6, [sp, 8]
	str	x7, [sp]
	ldr	x1, [sp, 56]
	ldr	x0, [sp, 48]
	add	x1, x1, x0
	ldr	x0, [sp, 40]
	add	x1, x1, x0
	ldr	x0, [sp, 32]
	add	x1, x1, x0
	ldr	x0, [sp, 24]
	add	x1, x1, x0
	ldr	x0, [sp, 16]
	add	x1, x1, x0
	ldr	x0, [sp, 8]
	add	x1, x1, x0
	ldr	x0, [sp]
	add	x1, x1, x0
	ldr	x0, [sp, 64]
	add	x1, x1, x0
	ldr	x0, [sp, 72]
	add	x1, x1, x0
	ldr	x0, [sp, 80]
	add	x0, x1, x0
	add	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	manyargs, .-manyargs
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
