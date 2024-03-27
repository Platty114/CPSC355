//Credit: Akash 
#include<stdio.h>

char * season[4] = {"spring", "summer", "fall", "winter"};

int main() {
	register int i;

	for (i = 0; i < 4; i++) {

		printf("season[%d] = %s\n", i, season[i]);
	}

	return 0;
}
