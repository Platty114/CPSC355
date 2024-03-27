#include <stdio.h>

//all these go into .data section
int globalInteger = 10;

long int globalLongInt = 100;
//this one could be in either, but should probably be in .data

//this one goes into .bss
int globalIntArray[4];


void changeGlobalValues(){
	globalInteger = 56;
	globalIntArray[0] = 25;
	globalLongInt = 20;
}


int main(){
	//printing original values
	printf("globalInteger = %d\n", globalInteger);
	printf("globalIntArray[0] = %d\n", globalIntArray[0]);
	printf("globalIntLongInt = %d\n", globalLongInt);

	changeGlobalValues();

	printf("globalInteger = %d\n", globalInteger);
	printf("globalIntArray[0] = %d\n", globalIntArray[0]);
	printf("globalLongInt = %d\n", globalLongInt);
}
