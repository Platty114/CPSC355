
output_string: .string "a is %d, b is %ld, hex is %x \n"
part_2_string: .string "c is %d \n"

	.balign 4
	.global main

main:
	//we need 4 bytes for a
	//for b we need 8 bytes
	//we need 2 bytes for hex
	// lets say we have an extra int
	//so we need atleast 18bytes of space
	stp x29, x30, [sp, -32]!
	mov x29, sp
	
	fp .req x29

	//int a =10
	mov w19, 10
	str w19, [fp, 16]

	//long int b = 100
	mov x20, 100
	str x20, [fp, 20]

	// hex = 0xdfd8
	mov w21, 0xdfd8
	strh w21, [fp, 28]

	//now lets access all the variables from the stack\
	//and store them in different registers

	//grabbing a
	ldr w22, [fp, 16]

	//grabbing b
	ldr x23, [fp, 20]

	//grabbing hex
	ldrh w24, [fp, 28]

	adrp x0, output_string
	add x0, x0, :lo12:output_string

	mov w1, w19
	mov x2, x20
	mov w3, w21

	bl printf

	adrp x0, output_string
	add x0, x0, :lo12:output_string

	mov w1, w22
	mov x2, x23
	mov w3, w24

	bl printf

	cmp w22, 5
	b.le else
test:

	add sp, sp, -16
	mov w25, 15
	str w25, [sp, 16]

	//now we can load c back into a different
	//register and print

	ldr w26, [sp, 32]
	
	adrp x0, part_2_string
	add x0, x0, :lo12:part_2_string

	mov w1, w26
	bl printf

	add sp, sp, 16
else:
	
	ldp x29, x30, [sp], 32
	ret















	










