//int = 4B = word
//long int = 8B = doubleword => dword
//double = 8B = dword
//short = 2B = half word => hword
//char = 1B = byte 
	.data

//global vars	intialized with values
globalInteger: .word 10

globalLongInt: .dword 100	

	.bss
//0 intialized array of 4 ints
globalIntArray: .skip 4 * 4

	.text

output_string: .string "The value is %d\n"

	.balign 4
	.global main

main:
	stp x29, x30, [sp, -16]!
	mov x29, sp


	//grabing the values of globalInteger in x19
	adrp x19, globalInteger
	add x19, x19, :lo12:globalInteger

	ldr w1, [x19]

	//setting up printf
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf

	//changing globalInteger to 500
	mov w22, 500
	str w22, [x19]

	//grabing the values of globalInteger again
	adrp x19, globalInteger
	add x19, x19, :lo12:globalInteger

	ldr w1, [x19]

	//setting up printf
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf

	//grabing the values of globalLongInteger in x19
	adrp x19, globalLongInt
	add x19, x19, :lo12:globalLongInt

	ldr x1, [x19]

	//setting up printf
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf

	//changing globalInteger to 500
	mov x22, 125
	str x22, [x19]

	//grabing the values of globalInteger again
	adrp x19, globalLongInt
	add x19, x19, :lo12:globalLongInt

	ldr w1, [x19]

	//setting up printf
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf

	//grabing the first value of globalIntArray of globalInteger again
	adrp x19, globalIntArray
	add x19, x19, :lo12:globalIntArray

	ldr w1, [x19]

	//setting up printf
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf



	ldp x29, x30, [sp], 16
	ret 







