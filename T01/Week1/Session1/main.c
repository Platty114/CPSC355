#include <stdio.h>

int main(){

    char temp[] = "Hello world!\n";
    int a;
	  char userInput[15];

    scanf("%s", userInput);

    char someName[2];
    someName[2]  = temp[2];
    someName[3] = '\0';

    printf(someName);



    return 0;

}

