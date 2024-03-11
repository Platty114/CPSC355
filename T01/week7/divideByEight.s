

output_string: .string "%d \n"

	.balign 4
	.global main

divideByEight:
	stp x29, x30, [sp, -16]!
	mov x29, sp

	//this will divide x0 by 8
	lsr x0, x0,  3	

	ldp x29, x30, [sp], 16
	ret

divideAndPrint:
	stp x29, x30, [sp, -48]!
	mov x29, sp

	//we are going to use x19 for temp
	str w19, [x29, 16]
	//and w20 for i
	str w20, [x29, 20]
	//well use x21 for our array address
	str x21, [x29, 24]
	//and well use w22 for size
	str w22, [x29, 32]

	//intialize temp as 0
	mov w19, 0
	//initialize i to 0
	mov w20, 0
	
	//copying x0 into x21
	//copying w1 into w22
	mov x21, x0
	mov w22, w1
	
for_top:
	cmp w20,  w22
	b.ge for_bottom
	
	//loading a value from our array
	ldr w19, [x21, w20, SXTW 2]
	mov w0, w19

	//calling divide by eight
	bl divideByEight

	//copying value back into temp
	mov w19, w0

	//moving value into w1 for printf
	mov w1, w19

	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf

	add w20, w20, 1

	b for_top


for_bottom:

	//we are going to use x19 for temp
	ldr w19, [x29, 16]
	//and w20 for i
	ldr w20, [x29, 20]
	//well use x21 for our array address
	ldr x21, [x29, 24]
	//and well use w22 for size
	ldr w22, [x29, 32]


	ldp x29, x30, [sp], 48
	ret

main:

	stp x29, x30, [sp, -48]!
	mov x29, sp

	//x19 = address of our array
	add x19, x29, 16
	
	//intializing the array  with three values
	mov w20, 10
	str w20, [x19]
	mov w20, 20
	str w20, [x19, 4]
	mov w20, 30
	str w20, [x19, 8]

	//copy address of array into x0
	mov x0, x19
	//copy size value into w1
	mov w1, 3

	bl divideAndPrint

	ldp x29, x30, [sp], 48
	ret








