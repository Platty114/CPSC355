
#include <stdio.h>

int strLen(char string[]){

        int i =0;

        while(string[i] != '\0'){
                i = i +1;
        }

	return i;
}

void badCopy(char string1[], char string2[]){

       	string2 = string1;
}

void goodCopy(char string1[], char string2[]){

        char c;

        int i;

        while(string1[i] != '\0'){
                string2[i] = string1[i];
                i++;
        }
	string2[i] = '\0';
}

int main(){
        char string[] = "Hello!";

        int stringLength = strLen(string);

        printf("The length is %d", stringLength);


        char string2[] = "this is the new string";

        goodCopy(string, string2);

        printf("%s", string);
        return 0;
}

