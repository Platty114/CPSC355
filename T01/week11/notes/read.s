





	.text

inputFileName: .string "input.bin"
errorMessage: .string "falied to open file \n"
outputString: .string "The value is %lf \n"

	.balign 4
	.global main

main:
	//we need 8 bytes of space on the stack
	//for number, since we need to refer to it by address
	//bytes_read does not need to be on the stack, since
	//we are not refering to it by address
	stp x29, x30, [sp, -32]!
	mov x29, sp

	//using openat

	mov w0, -100 //use local directory 

	adrp x1, inputFileName
	add x1, x1, :lo12:inputFileName //move address of our input files name into x1

	mov w2, 0 //open in read only mode
	mov w3, 0 //since we are only reading, we dont need to care about this arg

	mov x8, 56 //use openat

	svc 0 //cause an exception


	//I'm going to use w19 for file_descriptor
	//and x20 for bytes_read

	mov w19, w0 //save value of file descriptor

	//check if file was opened correctly	
	cmp w19, -1
	b.gt openSuccess
	
	//need to print out error message and leave
	adrp x0, errorMessage
	add x0, x0, errorMessage

	bl printf
	mov w0, -1 //return -1
	b end
	
	

openSuccess:	


	//now we have a good file
	//we have to read from the file first, and then do it in a loop

	mov w0, w19 //move file_descriptor into w0
	add x1, x29, 16 //putting the address of x29 + 16 into x1,
			//this is where the read result will be written to
	mov w2, 8	//w2 takes the number of bytes we want to read, which is 8 bytes
			//since all values in the input.bin are 8 byte longs
	mov x8, 63 	//we want to read, so 63 must be used
	svc 0	

	mov x20, x0 	//the return is the number of bytes read, which we put in x20	


	loopTop:
		//we have to check if bytes_read == 8
		//and if so, print the last result, and do another read
		cmp x20, 8	
		b.lt loopEnd

		adrp x0, outputString
		add x0, x0, :lo12:outputString

		ldr d0, [x29, 16] 	//the read result is stored at x29 + 16, so load that value into d1	
		bl printf
			
		//now we have to read again

		mov w0, w19 //move file_descriptor into w0
		add x1, x29, 16 //putting the address of x29 + 16 into x1,
				//this is where the read result will be written to
		mov w2, 8	//w2 takes the number of bytes we want to read, which is 8 bytes
				//since all values in the input.bin are 8 byte longs
		mov x8, 63 	//we want to read, so 63 must be used
		svc 0	

		mov x20, x0 	//the return is the number of bytes read, which we put in x20	
		

		b loopTop

	loopEnd:



	//now we must close the file_descripter
	mov w0, w19 //move file_descriptor into w0
	mov x8, 57 //use code 57 to close file
	svc 0

	//return 0
	mov w0, 0


end:
	
	ldp x29, x30, [sp], 32
	ret
