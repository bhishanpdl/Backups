// topic: pointer and array
// source: http://www.c4learn.com/c-programming/c-pointer-to-array-of-string/
// source: http://www.c4learn.com/c-programming/c-double-pointer/
// filepath: cd /Users/poudel/Copy/Programming/C/cprograms/pointer
// terminal: clear; gcc arrayptr.c && ./a.out

#include<stdio.h>

int main(){
		
	int num[2] = {10,20};
	const int *ptr;

	ptr = &num[0];

	printf("address of the pointer is = %d\n\n",*ptr);


	//example 2
	int line;

	char *array[] = {
						"C is a program language",
						"C++ is a program language",
						"Java is a program language",
						"VBA is a program language",
				
				     0}; 
					
					

	for(line = 0; array[line] !=0; line++)
    printf("%s\n", array[line]);
    
    
    //example 3

return 0;
}
