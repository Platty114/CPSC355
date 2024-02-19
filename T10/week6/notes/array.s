//declaring a string and boiler plate
string1: .string "The value of a[%d] is %d \n"

        .balign 4
        .global main

main:
        //we are going to need 4 x 5 bytes for the array, since it is an array of ints
        //and the array is of size 5. So we need 20 bytes of space, the closest multiple 
        //of 16 that can store 20 bytes of data is 32. therefore, we need -16 + -32 = -48
        stp x29, x30, [sp, -48]!
        mov x29, sp

        //now we are going to do our first loop

        //first well grab the address of the start of our array
        //and store it in x19
        add x19, x29, 16

        //then initialize i to 0 in w20
        mov x20, 0


for_1_top:
        //multiply i * 4 so we have our offset for the location in the array
        lsl x21, x20, 2
        
        //storing the address of array[i] in x 22       
        add x22, x21, x19 
        
        //now store i at array[i]
        str x20, [x22]
        
        //increment i by 1      
        add x20, x20, 1
        cmp x20, 5
        b.lt for_1_top


	// intialize i to 0 in x25
	mov x25, 0

for_2_top:
        //now using basically the same loop as above, we are going to load the value back from the array and print
        //multiply i * 4 so we have our offset for the location in the array
        lsl x21, x25, 2

        //storing the address of array[i] in x 22       
        add x22, x21, x19

        //now load value from array[i]
        ldr x23, [x22]

        //now print
        adrp x0, string1
        add x0, x0, :lo12:string1

        mov w1, w25
        mov w2, w23

        bl printf


        //increment i by 1 and check condition  
        add x25, x25, 1
        cmp x25, 5
        b.lt for_2_top

	ldp x29, x30, [sp], 48
	ret




