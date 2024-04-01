#include <stdio.h>


double power(double base, int power){
	
	double result = base;

	for(int i =1; i < power; i++){
		result = result * base;
	}
	

	return result;
}


int main(){
	
	double result1, result2, finalResult;

	result1 = power(5.5, 2);

	result2 = power(5.5, 4);

	result1 = result1 - 5.0;

	result2 = result2 + 5.0;

	finalResult = result2 / result1;

	if(finalResult > 10.0){
		printf("The final result is %0.10lf \n", finalResult);
	}


	return 0;
}
