// Instruction segment
.text
.global main
main:
    // Allocate an integer on the heap 
    mov x8, 222            // Syscall number for mmap
    mov x0, 0              // Let the kernel choose the address
    mov x1, 4              // Allocate 4 bytes
    mov x2, 7              // Read/Write access
    mov x3, 0x22           // Default flags
    mov x4, 0              // File descriptor (irrelevant for MAP_ANONYMOUS)
    mov x5, 0              // Offset (irrelevant)
    svc 0                  // Make the syscall
    
    // THE POINTER IS NOW IN X0 DO NOT LOSE IT 
    // We do so by copying it into x9 so we can use x0 for other purposes
    mov x9, x0

    // Set the integer to 7
    mov w0, 7
    str w0, [x9]
    
    // It is not necessary to set a pointer since we already did above
    ldr w2, [x9]
    add w2, w2, 3
    str w2, [x9]

    mov x8, 215             // Syscall number for munmap
    mov x0, x9             // Address of the memory region to deallocate
    mov x1, 16              // Size of the region (e.g., 1024 bytes)
    svc 0                  // Make the system call

    mov x0, 0
    ret

