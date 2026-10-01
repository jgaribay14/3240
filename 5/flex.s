// static memory segment
.data
.global string1
string1:
	.ascii "The mc91orial of %d is %d!\n\0"
string2:
	.ascii "Entering mc91() with n=%d\n\0" // lets us know we entered a func

.text
.extern printf
.global main
main:
	stp 	x29, x30, [sp, -16]! 	// save frame pointer and link
									// register, add 16 bytes for the
									// temp
									// this does:
									// sub 		sp, sp, 16
									// sw 		x29, [sp]
									// sw 		x30, [sp, 8]
	add 	x29, sp, 0 				// set frame pointer

	// MAIN()
	// leaf functions: functions that don't call other functions
	mov 	x0, 50 					// Call mc91(8), put in x0 for argument
	bl 		mc91

	add 	x2, x0, 0 			// Respond with prompt
	mov 	x1, 50
	ldr 	x0, =string1 		// load the address of string1 string
	bl 		printf

### TAKE DOWN FRAME RECORD ###
	ldp 	x29, x30, [sp], 16
	mov 	w0, 0
	ret

// int mc91(int n)
// 		if (n > 100)
// 			return n - 10;
// 		else
// 			return mc91(mc91(n + 11))
.global mc91
mc91:
	// int mc91(int n)
	stp 	x29, x30, [sp, -32]! 	// Save FP and LR
	add 	x29, sp, 0 				// set frame pointer

	str 	w0, [sp, 16] 			// shadow copy n

	ldr 	x0, =string2 			// printf(...)
	ldr 	x1, [sp, 16]
	bl 		printf

	// logic for mc91()
	ldr 	w0, [sp, 16] 			// load input (n)
	cmp 	w0, 100 				// if (n >= 100)
	bgt 	returnn

	// else 
	// 		return mc91(mc91(n + 11))
	// call mc91(n+11)
	add 	w0, w0, 11 
	bl 		mc91
	str 	w0, [sp, 20]

	ldr 	w0, [sp, 20]
	bl 		mc91

	b 		return 					// call mc91(n-1)

returnn: 							// return0 falls through to return code
	ldr 	w0, [sp, 16] 			// load input (n)
	sub 	w0, w0, 10

// this is the epilogue
return:
	ldp 	x29, x30, [sp], 32
	ret

