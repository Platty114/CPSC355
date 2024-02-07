#include <stdio.h>

int main(){

	//creating two 16 bit variables (short means 16 bit integer)
	unsigned short twoBytes = 0xd8d9;
	unsigned short reverseTwo;



	
	//now lets reverse twoBytes
	reverseTwo = (twoBytes & 0xff00) >> 8;
  	reverseTwo |= (twoBytes & 0xff) << 8;




	//printing results
	printf("test: 0x%x \n", twoBytes);
	printf("reverseTwo: 0x%x \n", reverseTwo);

	return 0;

}
