// static memory segment
.data
.global string1
string1:
	.ascii "The factorial of %d is %d!\n\0"
string2:
	.ascii "Entering fact() with n=%d\n\0"

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
	mov 	x0, 8 					// Call fact(8), put in x0 for argument
	bl 		fact

	add 	x2, x0, 0 			// Respond with prompt
	mov 	x1, 8
	ldr 	x0, =string1 		// load the address of string1 string
	bl 		printf

### TAKE DOWN FRAME RECORD ###
	ldp 	x29, x30, [sp], 16
	mov 	w0, 0
	ret

// int fact(long int n) {
// 	printf(...)
// 	if (n <= 1)
// 		return 1;
// 	else
// 		return fact(n-1) * n;
.global fact
fact:
	stp 	x29, x30, [sp, -32]! 	// Save FP and LR
	add 	x29, sp, 0 				// set frame pointer

	str 	x0, [sp, 16] 			// shadow input argument

	ldr 	x0, =string2 			// prompt
	ldr 	x1, [sp, 16]
	bl 		printf

	ldr 	x0, [sp, 16] 			// logic for fact()
	cmp 	x0, 1
	ble 	return1 				// if n <= 1, jump to return1

	sub 	x0, x0, 1 				// do n-1 for next line
	bl 		fact 					// call fact(n-1)

	ldr 	x1, [sp, 16] 			// refresh the value of n

	mul 	x0, x0, x1 				// do mult, result goes in x0
	b 	return 						// prevent it from falling into return1

return1:
	mov 	x0, 1 					// return1 falls through to return code

// this is the epilogue
return:
	ldp 	x29, x30, [sp], 32
	ret

