



	.text
	
output_string: .string "The final result is %0.10lf \n"


	.balign 4

power:
	stp x29, x30, [sp, -16]!
	mov x29, sp

	// floating point registers 16-31 are temporary registers,
	// which we will use for this subroutine since it  dosen't use other funcs
	

	// I am going to use d16 for result, w9 for i, and we can keep base and power in argument registers 	
	fmov d16, d0
	// i = 1
	mov w9, 1

loop_top:
	cmp w9, w0
	b.ge loop_bottom
	
	//result = result * base	
	fmul d16, d16, d0

	//i++	
	add w9, w9, 1
	b loop_top
	

loop_bottom:	

	//return result in d0
	fmov d0, d16

	ldp x29, x30, [sp], 16
	ret


	.global main


main:

	stp x29, x30, [sp, -16]!
	mov x29, sp

	// floating point registers 8 - 15 are callee saved registers
	//I am going to use d8 for result1, d9 for result2, d10 for final result

	//power(5.5, 2)
	fmov d0, 5.5
	mov w0, 2

	bl power

	//move result into d8 / result1
	fmov d8, d0
	
	//power(5.5, 4)
	fmov d0, 5.5
	mov w0, 4

	bl power

	//move result into d9 / result2
	fmov d9, d0

	//fsub and fadd have no immediate versions
	//so must use temp registers 16 to hold the immediates

	//result1 = result1 - 5.0
	fmov d16, 5.0
	fsub d8, d8, d16
	
	//result2 = result2 + 5.0
	fadd d9, d9, d16


	//finalResult = result2 / result1
	fdiv d10, d9, d8

	//fcmp can only use immediates of 0.0, so again
	//we must use a temp register
		
	//if(finalResult > 10.0)
	fmov d16, 10.0
	fcmp d10, d16
	b.le end

	fmov d0, d10	

	adrp x0, output_string
	add x0, x0, :lo12:output_string

	bl printf 
	
end:

	ldp x29, x30, [sp], 16
	ret
