
output_string: .string "The value of the structs x is %d, and y is %ld"


	.balign 4
	.global main

printMyStruct:

	stp x29, x30, [sp, -16]!
	mov x29, sp

	//we are going to load x and y into argument registers
	//using x0 as the address
	mov x9, x0

	//loading x and y into w1 and x2
	ldr w1, [x9]
	ldr x2, [x9, 8]

	//loading our string in x0
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf


	ldp x29, x30, [sp], 16
	ret


myStructFactory:

	stp x29, x30, [sp, -32]!
	mov x29, sp

	//we are going to allocate the localStruct,
	//set it's values, and then copy those values
	//into the memory pointed to by x8

	//x9 is the pointer to our localStruct
	add x9, x29, 16
	

	//setting localStruct.x = x
	str w0, [x9]
	//setting localStruct.y = y
	str x1, [x9, 8]

	//now we have localStruct set up, and just
	//need to return the value using x8

	//copying values over to memory specified in x8

	//first we grab the values of localStruct
	ldr w10, [x9]
	ldr x11, [x9, 8]

	//now we store the values
	str w10, [x8]
	str x11, [x8, 8]

	//now we return
		
	ldp x29, x30, [sp], 32
	ret


main:
	stp x29, x30, [sp, -32]!
	mov x29, sp

	//moving address of temp into x8
	add x8, x29, 16
	
	//moving arguments into w0, and x1
	mov w0, 10
	mov x1, 20

	bl myStructFactory


	//now we need to pass a pointer to temp
	//to our printMyStruct function

	add x0, x29, 16

	bl printMyStruct


	ldp x29, x30, [sp], 32
	ret







