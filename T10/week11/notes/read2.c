#include <stdio.h>
#include <fcntl.h> //open at comes from here
#include <unistd.h> //close and read come from here


int main(){
	
	//create a buffer of 8 bytes
	//this may seem counter intuitive to do this this way
	//
	double number;


	//int openat (int dirfd, const char * path, int flag, node_t node)
	int file_descriptor = openat(-100, "input.bin", 0, 0);

	if(file_descriptor <= -1){
		printf("Error opening file! \n");
		return -1;
	}


	long bytes_read;


	bytes_read = read(file_descriptor, &number, 8);

	while(bytes_read == 8){
	
	
		printf("Num is %lf\n", number);

		
		bytes_read = read(file_descriptor, &number, 8);

	}



	close(file_descriptor);

	return 0;




}
