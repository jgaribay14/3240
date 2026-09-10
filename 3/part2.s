.data				// read and write static memory segment
.global coyote			// int cayote[] = { 0, 2, 4, 6, 8, 10 };
coyote:
    .word   0
    .word   2
    .word   4
    .word   6
    .word   8
    .word   10

.text				// instruction segment
.global main
main:
	// ALLOCATE AN ARRAY ON THE HEAP
	mov x8, 222            	// Syscall number for mmap
	mov x0, 0              	// Let the kernel choose the address
	mov x1, 24             	// Allocate 24 bytes
	mov x2, 7              	// Read/Write access
	mov x3, 0x22           	// Default flags
	mov x4, 0              	// File descriptor (irrelevant for MAP_ANONYMOUS)
	mov x5, 0              	// Offset (irrelevant)
	svc 0                  	// Make the syscall
	
	mov x9, x0		// save pointer in x9 = dynamic array pointer

	// i need to put x9[0] = x0[0]
	ldr x0, =coyote		// x0 = pointer to coyote
	ldr w0, [x0]		// x0 is an address set above
				// go to the address stored in x0, get the valuethere
				// put the value into w0
	str w0, [x9]		// put the value of w0 (coyote[0]) into the address
				// stored in x9 (dynamic array at index 0)
				// this GOES to the actual address stored in x9


	// DEALLOCATE THE ARRAY
    	mov x8, 215             // Syscall number for munmap
    	mov x0, x9             	// Address of the memory region to deallocate
    	mov x1, 24              // Size of the region
    	svc 0                  	// Make the system call

	mov x0, 0		// return 0;
   	ret

