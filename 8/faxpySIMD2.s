# w0 - Arg 1 - Integer, length of the vectors 'n'. It is 'w' because of integer
#	type.
# x1 - Arg 2 - Single precision pointer to vector x. It is an 'x' register bc
#	pointers are 64 bit. Note that it starts at x1 because 'w' regs are the
#	lower half of an 'x' register. Using 'x0' here would be the same reg-
#	ister as the first argument. 
# x2 - Arg 3 - Single precision pointer to vector y
# x3 - Arg 4 - Single precision pointer to vector of result
#
# void faxpy( int length, float* x, float* y, float* result ) {
# 	for (int i = 0; i < length; i++)
# 		result[i] = x[i] + y[i];
# 		return;
# }
.global faxpy
# we dont neet to shadow copy the input argumnets because this is a leaf func
faxpy:
	stp		x29, x30, [sp, -16]!
	add		x29, sp, 0
	mov		w5, 0 				// int i counter

# x1 stores pointer to x[i]
# x2 stores pointer to y[i]
# s0 stores the sum of x[i] + y[i]
# we will use vt.2S
_looptop:
	cmp 	w5, w0
	beq 	_loopquit
	//ldr 	s1, [x1], 4 		// access the pointer, perform the operation,
								// then add 4 to the pointer
	ld1 	{v1.2s}, [x1], 8
	ld1 	{v2.2s}, [x2], 8

	//fadd	s0, s1, s2 			// s0 = x[i] + y[i]
	fadd	v0.2s, v1.2s, v0.2s 			// s0 = x[i] + y[i]

	st1		{v0.2s}, [x3], 8
	//add 	w5, w5, 1
	add 	w5, w5, 2 			// i += 2 instead of i++

	b 		_looptop

_loopquit:
	ldp		x29, x30, [sp], 16
	ret	
