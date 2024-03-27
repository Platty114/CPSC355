#include <stdio.h>
#include <stdlib.h>

int main(int argc, char ** argv){

	int temp;

	for(int i =0; i < argc; i++){
		temp = atoi(argv[i]);
		printf("%d\n", temp);
	}
	return 0;
}
