//topic: pointer to pointers
//terminal: clear; gcc doubleptr.c && ./a.out

#include<stdio.h>

int main()
{

	
	//pointer to pointer
	int num         = 45;
	int *ptr        = NULL ;         // initializing is optional
	int **doubleptr = NULL ; //initializing
	
	ptr 		        = &num ;   // &num + 5 gives some address 
	doubleptr 	    = &ptr;   // &ptr + 5 gives segmentation fault
	
	printf("The value of num is            num         = %d\n", num);
	printf("The value of pointer is        *ptr        = %d\n", *ptr);
	printf("The value of double pointer is **doubleptr = %d\n\n",
	                                       **doubleptr);
	

	return 0;
}

