// in this example, we are going to create an array, loop through it and fill it with values, and then loop through it and print those values.


#include <stdio.h>

//this is a c macro
#define SIZE 5

int main(){

	int array[SIZE];


	for(int i = 0; i < SIZE; i++){
		array[i] = i + 1;
	}	

	for(int i =0; i < SIZE; i++){
		printf("The value of array[%d] is %d \n", i, array[i]);
	}

	return 0;
}
