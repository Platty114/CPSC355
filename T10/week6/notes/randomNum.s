string1: .string "the random value is %d\n"


        .balign 4
        .global main

main:

        stp x29, x30, [sp, -16]!
        mov x29, sp


//rand is a psuedo random number generator. This means it will generate the same 'random' numbers every time the program is ran, in the same order
//This is some code that calls the rand function and prints the value it gets several times. If you run the program, the same numbers will be shown
//each time, which is why it is psuedo random.


//Basically, the way it works is you call rand, and then the return value is stored in x0. I am then taking the mod of the result with 256, giving us a
//a 'random' number between 0 and 256

	//calling rand
        bl rand
	//copying return values and doing modulo
        mov x19, x0
        and x20, x0, 0xFF

        adrp x0, string1
        add x0, x0, :lo12:string1

        mov x1, x20

        bl printf

//random num 2
	bl rand

        mov x19, x0

        and x20, x0, 0xFF

        adrp x0, string1
        add x0, x0, :lo12:string1

        mov x1, x20

        bl printf

	
//random num 3
	bl rand

        mov x19, x0

        and x20, x0, 0xFF

        adrp x0, string1
        add x0, x0, :lo12:string1

        mov x1, x20

        bl printf


//random num 4
	bl rand

        mov x19, x0

        and x20, x0, 0xFF

        adrp x0, string1
        add x0, x0, :lo12:string1

        mov x1, x20

        bl printf

        ldp x29, x30, [sp], 16
        ret

