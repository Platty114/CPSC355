
	.text
output_string: .string "%d \n"

	.balign 4
	.global main

main:
	stp x29, x30, [sp, -16]!
	mov x29, sp
	
	//w19 = argc
	//x20 = argv
	mov w19, w0
	mov x20, x1

	// i = 0
	mov w21, 0
	// we are gonne use w22 for temp

for_top:
	cmp w21, w19
	b.ge for_end
	
	
	//load each string from argv into
	//x0 for atoi call
	ldr x0, [x20, w21, SXTW 3]

	bl atoi
	
	// move returned int from atoi 
	//into temp
	mov w22, w0

	//move temp into argument for printf
	mov w1, w22

	adrp x0, output_string
	add x0, x0, :lo12:output_string

	add w21, w21, 1

	bl printf
	b for_top


for_end:

	ldp x29, x30, [sp], 16
	ret


