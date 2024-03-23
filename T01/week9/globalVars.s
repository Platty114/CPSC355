
	.data

globalInteger: .word 10
globalLongInt: .dword 100

	.bss

globalIntArray: .skip 4 *4

	.text

output_string: .string "The value is %d\n"

	.balign 4
	.global main

main:

	stp x29, x30, [sp, -16]!
	mov x29, sp

	//grabbing the value of globalInteger
	adrp x19, globalInteger
	add x19, x19, :lo12:globalInteger

	ldr w1, [x19]

	//printf
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf
	
	//modifying globalInteger and 
	mov w22, 500
	str w22, [x19]	

	//grabbing the value of globalInteger
	adrp x19, globalInteger
	add x19, x19, :lo12:globalInteger

	ldr w1, [x19]

	//printf
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf


	//---------------------------------------
	//globalIntArray
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	adrp x19, globalIntArray
	add x19, x19, :lo12:globalIntArray

	ldr w1, [x19]

	bl printf

	//moving -64 into w22, and then storing that value
	//at globalIntArray[0]
	mov w22, -64
	str w22, [x19]

	adrp x0, output_string
	add x0, x0, :lo12:output_string

	ldr w1, [x19]

	bl printf
	
	
	ldp x29, x30, [sp], 16
	ret
