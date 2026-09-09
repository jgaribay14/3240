.text
.global main
main:
	mov x0, #1
	mov x1, #4
	mov x3, #3
	mov x4, #2
a1:
	mov x2, 1      		// Set a value 1
	mov x3, 2      		// Set a value 2
	mov x4, 3      		// Set a value 3
	eor x0, x2, x2 		// x0 <- 1 XOR 1
	eor x0, x0, x3 		// x0 <- x0 XOR 2
	eor x0, x0, x3 		// x0 <- x0 XOR 2
	eor x0, x0, x4 		// x0 <- x0 XOR 3

alldone:
	mov x0, 0      		// Prepare to return 0;
	ret            		// Return

