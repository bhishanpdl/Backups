//topic   : integer pointer
//terminal: clear; gcc intptr.c && ./a.out

#include<stdio.h>

int main()
{

	int 	a, b;
	int  	*p, *q;
	
	int		sum = 0;
	
	a = 5;
	b = 6;
	
	/* keyboard input method
	printf("Enter first number : ");
	scanf("%d", &a);                        //now a = 5, lets say we enter 5
	printf("enter second number: ");
	scanf("%d", &b);                        //now b = 6, lets say we enter 6
	*/
	p 	= &a; //now *p = a = 5 are equal
	q 	= &b; //now *q = b = 6 are equal
	
	sum = *p + *q;
	
	printf("the value of a    = %d\n", a );
	printf("the value of b    = %d\n", b );
	printf("the value of *p   = %d\n", *p);
	printf("the value of *q   = %d\n", *q);
	
	
	/*
	//WARNING:
	// warning: format ‘%d’ expects argument of type ‘int’,
	// but argument 2 has type ‘const int **’
	printf("the address is &p = %d\n", &p);
	printf("the address is &q = %d\n", &q);
	*/
	
	printf("\nThe sum is %d\n",sum);
	
	
	//pointer to pointer (double pointer)
	float num = 45.5; //now num = 45
	float *ptr ;
	float **doubleptr ;
	
	
	ptr 		= &num; //now, *ptr = num = 45
	doubleptr 	= &ptr; //now, **doubleptr = *ptr = num = 45
	
	printf("The value of double pointer is **doubleptr = %.2f\n\n",
	                                       **doubleptr);
	

	return 0;
}

