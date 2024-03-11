
output_string: .string "The sum is %d \n"

	.balign 4
	.global main

add2:
	stp x29, x30, [sp, -16]!
	mov x29, sp
	
	//move arguments out into temp regs
	mov w9, w0
	mov w10, w1
	//add args and store in w1
	add w1, w9, w10

 	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf	
	
	ldp x29, x30, [sp], 16
	ret
	
main:

	stp x29, x30, [sp, -16]!
	mov x29, sp

	//this should print 5	
	mov w0, 2
	mov w1, 3
	
	bl add2
	
	//this should print 7
	mov w0, 3
	mov w1, 4
	bl add2

	
	
	ldp x29, x30, [sp], 16
	ret
