#include<stdio.h>

struct temp {
	int a;
	int b;
	double c;
};

void add1(int a, int b){
	printf("The sum is %d \n", a+b);
}

void add2(int a, int b){
	int temp = a + b;

	printf("The sum is %d \n", temp);

	return 3;
}

int main(){

	struct temp myStruct;

	//calling add 1 using 2 and 3
	//should print 5
	add1(2, 3);

	//calling add2 using 5 and 2
	//should print 7
	add2(5, 2);

	return 0;
}
