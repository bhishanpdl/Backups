#include<stdio.h>
#include<stdlib.h>
#include<string.h>	//for memset

int main(int argc, char** argv) {
    	int age;
    	char* buffer;
    	
    	buffer = malloc(200 * sizeof(char));
    
    	//example1:
    	sscanf("19 cool kid", "%d %s", &age, buffer);
    	printf("%s is %d years old\n", buffer, age); 		//  	output : cool is 19 years old
   
    	
    	
    	//example2:    	
    	sscanf("19 cool kid", "%d %[^\t\n]", &age, buffer); //The following line will start reading a number 
	printf("%s is %d years old\n", buffer, age);			// (%d) followed by anything
														//different from tabs or newlines (%[^\t\n]).
	
	//example3:
	/*You want the %c conversion specifier, which just reads a sequence of characters
	without special handling for whitespace.
	Note that you need to fill the buffer with zeroes first, because the %c specifier doesn't
	write a nul-terminator. You also need to specify the number of characters to read 
	(otherwise it defaults to only 1): */
	
	char* buffer2;
	memset(buffer2, 0, 200);
	sscanf("19 cool kid", "%d %199c", &age, buffer2);
	printf("%s is %d years old\n", buffer2, age);

	
    return 0;
}
