define(add1, `adrp x0, output_string
		add x0, x0, :lo12:output_string
		mov w1, $1
		add w1, w1, $2
		bl printf ')

output_string: .string "The sum is %d \n"

	.balign 4
	.global main

main:
	stp x29, x30, [sp, -16]!
	mov x29, sp

	//this should print 5
	add1(2, 3)
	//this should print 7	
	add1(3,4)

	
	ldp x29, x30, [sp], 16
	ret
