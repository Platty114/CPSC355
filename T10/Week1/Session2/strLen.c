#include <stdio.h>

int stringLength(char string[]){

       	int i =0;

        while(string[i] != '\0'){
                i += 1;
        }

	return i;
}

void badCopy(char string1[], char string2[]){
        string2 = string1;
}

void goodCopy(char string1[], char string2[]){

        int i =0;

        while(string1[i] != '\0'){
                string2[i] = string1[i];
                i += 1;
        }

	string2[i] = '\0';

}

int main(){

        char string[] = "hello!";

        int lenght = stringLength(string);

       	char copyString[] = "this is not the same!";

        goodCopy(string, copyString);

       	//printf("the length is %d", lenght);


        printf("%s", copyString);
        return 0;

}

int a = 5;
int b =10;

int added = add(&a,&b);

int add(int * a , int b){

        *a = 25;

        return a + b;
}

