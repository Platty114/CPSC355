

	.text
	.global array_size
	.global array

output_string: .string "The value of array[%d] is %d\n"

	//now we define out subroutines 
	.balign 4
	.global fill_array

fill_array:
	stp x29, x30, [sp, -48]!
	mov x29, sp

	//were gonna use x19, x20, w21, w22
	str x19, [x29, 16]
	str x20, [x29, 24]
	str w21, [x29, 32]
	str w22, [x29, 36]

	//now we can do whatever we want
	//we are gonna use x19 for the address of array
	//x20 for the address of array_size
	//and w21 for the value of array_size
	
	//load address of array into x19
	adrp x19, array
	add x19, x19, :lo12:array

	//load address of array_size into x20
	adrp x20, array_size
	add x20, x20, :lo12:array_size

	//grab the value of array_size, put it in w21
	ldr w21, [x20]
	
	//use w22 for i
	mov w22, 0

for_top:
	//if i >= array_size leave
	cmp w22, w21
	b.ge for_bottom

	//shift i by 2, and put it in w9
	lsl w9, w22, 2

	str w22, [x19, w9, SXTW]

	add w22, w22, 1

	b for_top

for_bottom:	

	//loading the orignal values of x19, x20, w21, and w22 back
	ldr x19, [x29, 16]
	ldr x20, [x29, 24]
	ldr w21, [x29, 32]
	ldr w22, [x29, 36]
	
	ldp x29, x30, [sp], 48
	ret



	.global print_array

print_array:
	stp x29, x30, [sp, -48]!
	mov x29, sp

	//were gonna use x19, x20, w21, w22
	str x19, [x29, 16]
	str x20, [x29, 24]
	str w21, [x29, 32]
	str w22, [x29, 36]

	//use x19 for the address of the array
	adrp x19, array
	add x19, x19, :lo12:array

	//use x20 for address of array_size
	adrp x20, array_size
	add x20, x20, :lo12:array_size
	
	//load value of array_size into w21
	ldr w21, [x20]
	
	//use w22 for i 
	mov w22, 0

for_top_print:
	cmp w22, w21
	b.ge for_bottom_print

	//load address of output_string into x0
	adrp x0, output_string
	add x0, x0, :lo12:output_string
	
	//mov i into w1 for printf
	mov w1, w22
	
	//using w9 for i * 4
	lsl w9, w22, 2

	//load array[i] into w2
	ldr w2, [x19, w9, SXTW]

	bl printf
	
	add w22, w22, 1

	b for_top_print

for_bottom_print:

	//loading the orignal values of x19, x20, w21, and w22 back
	ldr x19, [x29, 16]
	ldr x20, [x29, 24]
	ldr w21, [x29, 32]
	ldr w22, [x29, 36]
	
	ldp x29, x30, [sp], 48
	ret
























