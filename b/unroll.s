// void myfma_unroll(int length, int *a, int *b)
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
.global myFMA
myFMA:
.LFB0:
	sub	sp, sp, #48
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	str	x2, [sp, 8]
.LBB2:
	str	wzr, [sp, 44]

	mov x9, x1 		// copy input *a into x9
	mov x10, x2 	// copy input *b into x10
	mov x11, x3 	// copy input *c into x11
	b	.L2

.L3:
	ldr 	w2, [x10], 4 		// load pointer to a into w2
	mul 	w1, w2, w3 			// w1 = w2 * w2 => w1 = b[i] * c[i]
	str 	w1, [x9], 4 		// store multiplication restult in array a

	ldr 	w2, [x10], 4 		// load pointer to a into w2
	mul 	w1, w2, w3
	str 	w1, [x9], 4 		// store mult result into array a

	ldr	w0, [sp, 44]
	add	w0, w0, 2
	str	w0, [sp, 44]
.L2:
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w1, w0
	blt	.L3
	add	sp, sp, 48
	ret
