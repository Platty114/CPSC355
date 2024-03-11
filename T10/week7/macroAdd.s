

output_string: .string "The sum is %d \n"

	.balign 4
	.global main

main:
	stp x29, x30, [sp, -16]!
	mov x29, sp

	//this should print 5
	adrp x0, output_string
		add x0, x0, :lo12:output_string
		mov w1, 2
		add w1, w1, 3
		bl printf 
	//this should print 7	
	adrp x0, output_string
		add x0, x0, :lo12:output_string
		mov w1, 3
		add w1, w1, 4
		bl printf 

	
	ldp x29, x30, [sp], 16
	ret
