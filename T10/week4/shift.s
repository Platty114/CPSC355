
output_string: .string "twoBytes is : 0x%x \n and reverse bytes is : 0x%x"

	.balign 4
	.global main

main:

	stp	x29, x30, [sp, -16]!
	mov	x29, sp

	//creating twoBytes and reverseBytes
	//in w19, w20
	mov	w19, 0xd9d8
	mov	w20, 0x0

	//reversing first 8 bits / 2 hex
	and	w20, w19, 0xff00
	lsr	w20, w20, 8
	// w19 = 1101 1001 1101 1000
	// w20 = 0000 0000 1101 1000

	and	w21, w19, 0x00ff
	lsl	w21, w21, 8
	// w21 = 1101 1000 0000 0000

	orr	w20, w21, w20

	//w20 = 1101 1000 1101 1001
	//setting up print f with outputString
	adrp	x0, output_string
	add	x0, x0, :lo12:output_string

	//copying twoBytes and reverse into function
	//args
	mov	w1, w19
	mov	w2, w20
	
	bl	printf


	ldp	x29, x30, [sp], 16
	ret









