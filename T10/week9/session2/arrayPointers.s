	.text

test: .string "spring is the best season"
summer: .string "summer"
fall: .string "fall"
winter: .string "winter"

output_string: .string "season[%d] = %d \n"

	.data
	.balign 8
seasons: .dword test, summer, fall, winter


	.text
	.balign 4
	.global main

main:

	stp x29, x30, [sp, -16]!
	mov x29, sp

	//I'm gonna use w19 for i
	mov w19, 0

for_top:
	cmp w19, 4
	b.ge for_bottom

	//load address of output_string
	//into x0
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	//move i into first argument
	mov w1, w19

	//load addres of seasons into x20
	adrp x20, seasons
	add x20, x20, :lo12:seasons
	
	//load current indicy in seasons
	ldr x2, [x20, w19, SXTW 3]

	//print and increment i
	bl printf

	add w19, w19, 1	

	b for_top

for_bottom:	


	ldp x29, x30, [sp], 16
	ret

















