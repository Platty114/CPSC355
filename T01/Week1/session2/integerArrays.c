  GNU nano 7.2                                     integerArrays.c                                               


#include <stdio.h>

int main() {

	int a =10;

        int * b = &a;

        *b = 45;

        int array[2];

        array[0] =1;

        array[1] = 5;

        printf("The number is %d", *array);

       	return 0;
}



