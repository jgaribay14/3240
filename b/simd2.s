// void myFMA( int length, float* a, float* b, float* c ) {
//     for( int i = 0; i < length; i++ )
//         a[i] = a[i] * b[i] + c[i];
// }
.global myFMA
# we dont neet to shadow copy the input argumnets because this is a leaf func
myFMA:
	stp		x29, x30, [sp, -16]!
	add		x29, sp, 0
	mov		w5, 0 				// int i counter

// w0 stores input length
// x1 stores pointer to a[i]
// x2 stores pointer to b[i]
// x3 stores pointer to c[i]
// v0 = x[i] * y[i] + z[i]
// v0 stores the results
// w5 is i
_looptop:
	cmp 	w5, w0 				// if (i == input length)
	beq 	_loopquit
	ld1 	{v1.2s}, [x1] 		// load 2 values from input a into reg v1
								// but DONT increment yet
	ld1 	{v2.2s}, [x2], 8 	// input b
	ld1 	{v3.2s}, [x3], 8 	// input c

	fmul v0.2s, v1.2s, v2.2s 				// v0 = a[i] * b[i]
	fadd v0.2s, v0.2s, v3.2s 				// v0 = v0[i] + c[i]
	//fmadd	v0.2s, v1.2s, v2.2s, v3.2s 		// v0 = a[i] * b[i] + c[i]

	st1		{v0.2s}, [x1], 8 				// save 4 64-bit values
											// to [x1] which is array a
	add 	w5, w5, 2 			// i += 2

	b 		_looptop

_loopquit:
	ldp		x29, x30, [sp], 16
	ret	
