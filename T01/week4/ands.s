

bitIsOn:	.string "The bit is on!\n"
bitIsOff:	.string "The bit is off!\n"

	.balign 4
	.global main

main:

	stp	x29, x30, [sp, -16]!
	mov	x29, sp

	//create a var x19 = 0xff78 1111 1111 0111 1000
	// test if bit 3 is a 1, if so , jump to a location, else jump somwhere else

	mov	x19, 0xff88
	
	ands	x20, x19, 0x7 //check if bit 3 is a 1
	// use .ne if  you want to check ==
	// use .eq if you want to check !=
	b.ne	bitOn
	b	bitOff

bitOn:
	adrp	x0, bitIsOn
	add	x0, x0, :lo12:bitIsOn

	bl	printf

	b 	end
	
bitOff:
	adrp	x0, bitIsOff
	add	x0, x0, :lo12:bitIsOff

	bl	printf
	
	b	end

end:
	ldp	x29, x30, [sp], 16
	ret
















