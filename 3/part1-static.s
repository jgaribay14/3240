// Read and write static memory segment
.data				// four variables: badger, eagle, coyote, fox, hello
.global badger			// int badger = 7;
badger:
    .word   7

.global eagle			// int eagle = 0;
eagle:
    .word 0

.global coyote			// int cayote[] = { 0, 2, 4, 6, 8, 10 };
coyote:
    .word   0
    .word   2
    .word   4
    .word   6
    .word   8
    .word   10

.global fox			// int fox[50];
.comm fox, 200, 4		// allocates the array, doesnt initialize values

.section .rodata		// Read only static memory segment
.global hello			// char *hello = "Hello, world!\n"
hello: 
    .asciz "Hello, world!\n"

// Instruction segment
.text
.global main
main:

//_a1:
	ldr x0, =badger		// x0 = &badger (x0 = address of badger)
        ldr w2, [x0]		// x2 = *x0 (dereference x0 ^ and put value in x2)
        add w2, w2, 3		// w2 += 3
        str x2, [x0]

	ldr x1, =coyote
	ldr w2, [x1,#8]
	add w2, w2, #100
	str w2, [x1,#8]

	mov x0, 0
   	ret

