.text
.global main
main:
	mov x0, 0xffffffffffffffff
	mov w0, 0xffffffff

done:
	mov x0, 0      		// return 0;
	ret

