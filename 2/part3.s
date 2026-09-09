.text
.global main
main:
	mov x0, #1
	mov x1, #2
	mov x2, #0
	mov x3, #0
	mov x4, #6
	mov x5, #0

// 6 / 2 (1 + 2) = 6 / 2 (3) = 3 (3) = 9
//                   ^ go from left to right

a1:
	add x2, x0, x1		// x2 = x0 + x1
	udiv x3, x4, x1		// x3 = 6 / 2
	mul x5, x3, x2		// x5 = x3 * x2

alldone:
	mov x0, 0      		// Prepare to return 0;
	ret            		// Return

