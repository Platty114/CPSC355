output_string: .string "a is %d, b is %ld, and hex is %x \n"
part_2_string: .string "c is %d \n"

	.balign 4
	.global main

main:

	stp x29, x30, [sp, -32]!
	mov x29, sp

	fp .req x29

	//a =10
	mov w19, 10
	str w19, [fp, 16]

	//b = 100
	mov x20, 100
	str x20, [fp, 20]

	//hex = dfd8
	mov w21, 0xdfd8
	strh w21, [fp, 28]	

	//grabbing a
	ldr w22, [fp, 16]

	//grabbing b
	ldr x23, [fp, 20]
	
	//grabbing hex
	ldrh w24, [fp, 28]

	//printint original variables
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	mov w1, w19
	mov x2, x20
	mov w3, w21

	bl printf
	
	//printing new variables
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	mov w1, w22
	mov x2, x23
	mov w3, w24

	bl printf
temp:
	cmp w22, 5
	b.le else	

	//allocating an extra 16 bytes on stack
	//creating c =15
	add sp, sp, -16
	mov w25, 15

	str w25, [sp, 16]

	//loading value of c back from stack
	ldr w26, [sp, 32]
	
	adrp x0, part_2_string
	add x0, x0, :lo12:part_2_string

	mov w1, w26
	bl printf
	
	add sp, sp, 16
else:
	ldp x29, x30, [sp], 32
	ret















