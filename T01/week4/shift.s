
output_string: .string "twobytes is : 0x%x \n and reverseBytes is 0x%x \n"

	.balign 4
	.global main

main:

	stp	x29, x30, [sp, -16]!
	mov	x29, sp

	//creating variabls
	//w19 = twoBytes
	//w20 = reverseBytes
	mov	w19, 0xd8d9 // move 0xd8d9 into w19
	mov	w20, 0

	//grab left most 8 bits and shift right

	lsr	w20, w19, 8 // 0000 0000 1101 1000

	// grab right most 8 bits and left shift

	and	w21, w19, 0xff // w19 & 0000 0000 1111 1111
	lsl	w21, w21, 8 //1101 1001 0000 0000

	// now we need to or the two together

	orr	w20, w21, w20 // 0000 0000 1101 1000 | 1101 1001 0000 0000


	adrp	x0, output_string
	add	x0, x0, :lo12:output_string

	mov	w1, w19
	mov	w2, w20

	bl	printf

	ldp	x29, x30, [sp], 16
	ret	

















