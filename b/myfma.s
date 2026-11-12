
// void faxpyUnroll(int length, int *a, int *b)
// {
//     // Do some arbitrarily hard amount of work. 
//     for(int i = 0; i < length; i++) {
//         a[i] = b[i] * b[i];
//     }
// }

// w1 is pointer to a
// w2 is poitner to b
// w2 is pointer to c
// x9 is pointer to a
// x10 is pointer to b
.arch armv8-a
	.file	"myfma.c"
	.text
	.align	2
	.global	myFMA
	.type	myFMA, %function
myFMA:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	w0, [sp, 28]
	mov x9, x1
	mov x10, x2
	mov x11, x3

	str	wzr, [sp, 44]
	b	.L2
//.L3:
	// ldr     w2, [x10], 4        // load pointer to a into w2
	// mul     w1, w2, w2          // w1 = w2 * w2 => w1 = b[i] * c[i]
	// str     w1, [x9], 4         // store multiplication restult in array a

	// ldr     w2, [x10], 4        // load pointer to a into w2
	// mul     w1, w2, w2
	// str     w1, [x9], 4         // store mult result into array a

	// ldr w1, [sp, 44]
	// add w1, w1, 2
	// str w1, [sp, 44]

.L3:
    ldr s1, [x9]
    ldr s2, [x10]
    ldr s3, [x11]
    fmadd s0, s1, s2, s3
    str s0, [x9], 4
    add x10, x10, 4
    add x11, x11, 4

    ldr s1, [x9]
    ldr s2, [x10]
    ldr s3, [x11]
    fmadd s0, s1, s2, s3
    str s0, [x9], 4
    add x10, x10, 4
    add x11, x11, 4

    ldr w1, [sp, 44]
    add w1, w1, 2
    str w1, [sp, 44]
.L2:
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w1, w0
	blt	.L3
	nop
	nop
	add	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	myFMA, .-myFMA
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
