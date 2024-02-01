
output_string: .string "the output is %ld\n"

	.balign 4
	.global main

main:
	stp	x29, x30, [sp, -16]!
	mov	x29, sp

AND:
	//And example
	mov	x19, 0x7F //x19 = 1111 1111
	mov	x20, 0x87 //x20 = 1000 0111
	and	x21, x19, x20

	adrp	x0, output_string
	add 	x0, x0, :lo12:output_string
	
	mov	x1, x21

	bl	printf

ANDS:
	//tests if first bit in number is 1
	ands	x22, x21, 0x7 //x21 = 1000 0111
	// 0x1 0000 0001
	
	adrp	x0, output_string
	add 	x0, x0, :lo12:output_string
	
	mov	x1, x22

	bl	printf

OR:
	//orr example
	mov	x19, 0xF0 //x19 = 1111 0000
	mov	x20, 0x7 //x20 = 0000 0111
	orr	x21, x20, x19 //x21 = 1111 0111

	adrp	x0, output_string
	add 	x0, x0, :lo12:output_string
	
	mov	x1, x21

	bl	printf

EOR:
	//eor example
	mov	x19, 0x87 //x19 = 1000 0111
	eor	x21, x19, x19 //x21 = 0000 0000

	adrp	x0, output_string
	add 	x0, x0, :lo12:output_string
	
	mov	x1, x21

	bl	printf

BIC:
	// clear bits example
	mov	x19, 0xFF // 1111 1111
	mov	x20, 0xC3 // 1100 0011
	bic	x21, x19, x20 // x21 = 0011 1100

	adrp	x0, output_string
	add 	x0, x0, :lo12:output_string
	
	mov	x1, x21

	bl	printf


	ldp	x29, x30, [sp], 16
	ret	




