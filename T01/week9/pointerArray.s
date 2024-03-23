	.text
	
spring: .string "spring"
summer: .string "summer"
fall: .string "fall"
winter: .string "winter"

output_string: .string "season[%d] = %s \n"

	.data
	.balign 8
seasons: .dword spring, summer, fall, winter

	

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
	b.ge for_end

	//I'm gonna load the address
	//of ouput_string into x0
	adrp x0, output_string
	add x0, x0, :lo12:output_string

	mov w1, w19
	
	//now load the address of seasons
	//into x20
	adrp x20, seasons
	add x20, x20, :lo12:seasons

	//load the address of the current indicy of seasons
	//if i = 0, we load the address of spring, etc
	ldr x2, [x20, w19, SXTW 3]

	bl printf

	add w19, w19, 1
	
	b for_top

for_end:


	ldp x29, x30, [sp], 16
	ret
