#include <stdio.h>

int main(){

	int a = 10;

        int * b = &a;

        *b = 45;

        char myString[] = "this is a string";

        char test[10];

        test = myString;

        test[4] = '!';


        char mySecondString[3];

        mySecondString[0] = 'h';
        mySecondString[1] = 'i';
        mySecondString[2] = '\0';

        printf("%s", myString);

        return 0;
}

