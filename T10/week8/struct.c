
#include <stdio.h>

struct myStruct {
	int x;
	long int y;
};


struct myStruct myStructFactory(int x, long int y){
	struct myStruct localStruct;

	localStruct.x = x;
	localStruct.y = y;

	return localStruct;
}


void printMyStruct(struct myStruct * var){

	printf("the value of the stucts x is %d and y is %ld", var->x, var->y);

}


int main(){

	struct myStruct temp = myStructFactory(10, 20);

	
	printMyStruct(&temp);

	
	return 0;

}
