//
// int x = 42;
// int y = 8;
// int z = x + y;
//
//
// printf("this is a string %s")

output_string: .string "The number is %d\n"

        .balign 4
        .global main

main:
     	stp x29, x30, [sp, -16]!
        mov x29, sp

break1:
       	// were gonna use w23, w24, w25
        mov w23, 42 //int x = 42;
        mov w24, 8 //int y = 8;
        add w25, w23, w24 // int z = x + y;
break2:
       	adrp x0, output_string // copy first part of output_strings address into x0
        add x0, x0, :lo12:output_string //copy last 12 bits of output_string

        mov w1, w25 //copy z into second argument register

        bl printf	//call printf   

// int w = 0;
// while (w < 4) { w += 1 }

        mov w26, 0 // w = 0

startLoop:

	cmp w26, 4
        b.ge endLoop

        adrp x0, output_string
        add x0, x0, :lo12:output_string

        mov w1, w26

       	bl printf

        add w26, w26, 1 // w += 1
        b startLoop
endLoop:



break3:
       	ldp x29, x30, [sp], 16
        ret


