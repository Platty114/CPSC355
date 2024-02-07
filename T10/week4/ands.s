

bitIsOn: .string "The bit is on!\n"
bitIsOff: .string "The bit is off! \n"

	.balign 4
	.global main

main:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp

	// creating a var in x19 = 0xff78
	// 0xff78 = 1111 1111 0111 1000
	// im going to test if bit 3 (position 4) is a 1

	mov	x19, 0xff78

	// 0x8 == 1000

	ands	x20, x19, 0x8 // checking if bit 3 is on
	b.ne	bitOn
	b	bitOff

bitOn:
	adrp x0, bitIsOn
	add x0, x0, :lo12:bitIsOn

	bl	printf
	
	b	exit

bitOff:
	adrp x0, bitIsOff
	add x0, x0, :lo12:bitIsOff
	
	bl	printf
	
	b	exit


exit:
	ldp	x29, x30, [sp], 16
	ret
