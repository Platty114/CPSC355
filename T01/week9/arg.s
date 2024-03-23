

	.text 
output_string: .string "%d \n"

	.balign 4
	.global main

main:

	stp x29, x30, [sp, -16]!
	mov x29, sp

	//we know argc is in w0, and argv is in x1
	mov w19, w0
	mov x20, x1

	//w21 = i
	mov w21, 1

	// we are gonna use w22 for temp

for_top:
	cmp w21, w19
	b.ge for_end

	//Loading the address of each
	//string in the argv array
	//and then calling printf
	ldr x0, [x20, w21, SXTW 3]

	bl atoi

	//copying returned value from wo to temp
	mov w22, w0

	//moving temp into argument for printf
	mov w1, w22

	adrp x0, output_string
	add x0, x0, :lo12:output_string

	
	add w21, w21, 1

	bl printf
	b for_top

for_end:

	ldp x29, x30, [sp], 16
	ret
