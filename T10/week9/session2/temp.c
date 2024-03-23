
#include <stdio.h>

extern int globalInt = 10;


int assemblyFunction(int globalInt);

int main(){


	printf("This is a c program\n");

	printf("This is the value of gloablInt = %d\n", globalInt);

	//call a assembly function
	//

	globalInt = assemblyFunction(globalInt);

	printf("This is it again %d\n", globalInt);
		
}
