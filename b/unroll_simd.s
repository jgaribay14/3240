	.arch armv8-a
	.file	"faxpyUnroll.c"
	.text
.Ltext0:
	.align	2
.global myFMA
.type myFMA, %function

myFMA:
.LFB0:
	.file 1 "faxpyUnroll.c"
	.loc 1 2 1
	.cfi_startproc
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	str	x2, [sp, 8]
.LBB2:
	.loc 1 4 10
	str	wzr, [sp, 44]

	mov x9, x1 		// copy input *a into x9
	mov x10, x2 	// copy input *b into x10
	mov x11, x3 	// copy input *c into x11
	.loc 1 4 2
	b	.L2
// void faxpyUnroll(int length, int *a, int *b)
// {
//     // Do some arbitrarily hard amount of work. 
//     for(int i = 0; i < length; i++) {
//         a[i] = b[i] * b[i];
//     }
// }

// w1 is pointer to a
// w2 is poitner to b
// w2 is pointer to c
// x9 is pointer to a
// x10 is pointer to b
.L3:
    ld1     {v0.4s}, [x9]
    ld1     {v1.4s}, [x10]
    ld1     {v2.4s}, [x11]

	fmul v3.4s, v0.4s, v1.4s
	fadd v3.4s, v3.4s, v2.4s

    st1     {v2.4s}, [x9], #16
    add     x10, x10, #16
    add     x11, x11, #16

    // unrolling
    ld1     {v0.4s}, [x9]
    ld1     {v1.4s}, [x10]
    ld1     {v2.4s}, [x11]

    fmla    v2.4s, v0.4s, v1.4s

    st1     {v2.4s}, [x9], #16
    add     x10, x10, #16
    add     x11, x11, #16

    // increment by 8
    ldr     w1, [sp, 44]
    add     w1, w1, #8
    str     w1, [sp, 44]
.L2:
	.loc 1 4 2 discriminator 1
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w1, w0
	blt	.L3
.LBE2:
	.loc 1 7 1
	nop
	nop
	add	sp, sp, 48
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size myFMA, .-myFMA
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x9c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0xc
	.4byte	.LASF1
	.4byte	.LASF2
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x92
	.uleb128 0x3
	.string	"n"
	.byte	0x1
	.byte	0x1
	.byte	0x14
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x3
	.string	"a"
	.byte	0x1
	.byte	0x1
	.byte	0x1c
	.4byte	0x99
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"b"
	.byte	0x1
	.byte	0x1
	.byte	0x24
	.4byte	0x99
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.uleb128 0x5
	.string	"i"
	.byte	0x1
	.byte	0x4
	.byte	0xa
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.byte	0x8
	.4byte	0x92
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"faxpyUnroll"
.LASF2:
	.string	"/home/jgaribay/3240/10"
.LASF1:
	.string	"faxpyUnroll.c"
.LASF0:
	.string	"GNU C17 9.4.0 -mlittle-endian -mabi=lp64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection"
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
