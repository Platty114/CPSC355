#include <stdio.h>
#include <string.h>

int main(){

       	char c;

       	char string[15];

        while(1){
                printf("Please input a character\n");

                //c = getchar();

               	scanf("%s", string);

                        //printf("the char inputed was %c", c);
                printf("the string is %s", string);

                putchar(c);
        }
}

