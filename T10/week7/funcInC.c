
#include <stdio.h>

int divideByEight(int number){
	return number / 8;
}

void divideAndPrint(int * array, int size){
	int temp = 0;


	for(int i =0; i < size; i++){
		temp = divideByEight(array[i]);
		printf("%d ", temp);
	}

	printf("\n");
}


int main(){

	int array[5] = { 10, 20, 30, 40, 50};

	divideAndPrint(array, 5);

	return 0;
}
