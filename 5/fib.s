// static memory segment
.data
.global string1
string1:
	.ascii "The fiborial of %d is %d!\n\0"
string2:
	.ascii "Entering fib() with n=%d\n\0" // lets us know we entered a func

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
	mov 	x0, 8 					// Call fib(8), put in x0 for argument
	bl 		fib

	add 	x2, x0, 0 			// Respond with prompt
	mov 	x1, 8
	ldr 	x0, =string1 		// load the address of string1 string
	bl 		printf

### TAKE DOWN FRAME RECORD ###
	ldp 	x29, x30, [sp], 16
	mov 	w0, 0
	ret

// int fib(int n) {
// 	printf(...)
// 	if (n <= 1)
// 		return n;
// 	else
// 		return fib(n-2) + fib(n-1);
.global fib
fib:
	// int fib(int n)
	stp 	x29, x30, [sp, -32]! 	// Save FP and LR
	add 	x29, sp, 0 				// set frame pointer

	str 	w0, [sp, 16] 			// shadow copy n

	ldr 	x0, =string2 			// printf(...)
	ldr 	x1, [sp, 16]
	bl 		printf

	// logic for fib()
	ldr 	w0, [sp, 16] 			// load input (n)
	cmp 	w0, 0 					// if (n == 0)
	beq 	return0

	cmp 	w0, 1 					// if (n == 1)
	beq 	return1

	// else return fib(n-2) + fib(n-1)
	sub 	w0, w0, 2 				// do n-2
	bl 		fib 					// call fib(n-2)
									// w0 now contains the result of fact(n-2)
									// it was modified during the fcuntion cal
									// to fib, like we are doing aboverightnow
									// this is the same as when we tried to
									// put printf in the loop and it wasntwork
	str  	w0, [sp, 20] 			// store this back on the stack

	ldr 	w0, [sp, 16] 			// refresh the value of n
	sub 	w0, w0, 1 				// do n-1
	bl 		fib 					// call fib(n-1)

	ldr 	w1, [sp, 20] 			// refresh the value of n
	add 	w0, w1, w0 				// add the fib results together
	b 		return 					// call fib(n-1)

return1:
	mov 	w0, 1 		 			// load input value (n)
	b 		return 					// prevent return1 from falling inreturn0

return0: 							// return0 falls through to return code
	mov 	w0, 0

// this is the epilogue
return:
	ldp 	x29, x30, [sp], 32
	ret

