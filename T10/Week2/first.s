// int x =42;
// int y =8;
// int z = 50;

output_string:  .string "the number is %d the second number is %d\n"

        .balign 4
        .global main

main:

     	stp x29, x30, [sp, -16]!
        mov x29, sp

break1:

       	// were gonna use w23, w24, w25
        mov w23, 42 //int x = 42
        mov w24, 8 // int y = 8
        add w25, w23, w24 // int z = x + y

break2:

       	adrp x0, output_string //copying address of output_string into x0 
        add x0, x0, :lo12:output_string

       	mov w1, w25 //move z into args for printf
        mov w2, 72

        bl printf

// int t = 0;
// while(t >= 4) { do something}
//

       	// im gonna use w26 for t
        mov w26, 0

startLoop:
	cmp     w26, 4 //check if t < 4
        b.ge    endLoop // if t >= 4, leave

        adrp    x0, output_string
        add     x0, x0, :lo12:output_string

        mov     w1, w26 //first arg is t
        mov     w2, w26 //second arg is also t

        bl	printf

        //incrementing t
        add     w26, w26, 1
        b	startLoop
endLoop:


        //if t < 5 { do something} next {}
        cmp     w26, 7
        b.ge    next
        adrp    x0, output_string
        add     x0, x0, :lo12:output_string

        add     w26, w26, 1     

        mov     w1, w26
        mov     w2, w26

        bl	printf

next:


        ldp x29, x30, [sp], 16
        ret

