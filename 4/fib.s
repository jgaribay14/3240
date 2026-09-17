.text
.extern printf			// imports stdlib printf

.global main
main:				// initialize variables
	mov 	x2, #0 		// int a = 0;
	mov 	x3, #1 		// int b = 1;
	mov 	x4, #2 		// int i = 2;
	mov 	x5, #10 	// int n = 10;

loopTop:
	cmp 	x4, x5 		// negate condition (i <= n) = (i > n)
	bgt 	exit 		// jump to exit

// the code falls through into the loop body if the condition is true
// if the condition is false, the loop will break out and go to the end
loopBody:
	mov 	x6, #0		// int temp = 0;
	add 	x6, x2, x3 	// temp = a + b;
	mov 	x2, x3 		// a = b;
	mov 	x3, x6 		// b = temp;
	add 	x4, x4, #1	// i++;
	b 	loopTop 	// end of loop body, jump to loopTop

exit:
	ldr 	x0, =string1	// call to printf
	mov 	x1, x3
	bl 	printf

	mov x8, #93		// exit
	mov x0, #0
	svc #0

.data
.global string1
string1:
	.ascii	"%d\n"

