/* qn1 lowest number among 3 values */

#include<stdio.h>   // printf and scanf functions.


int main()
{
	float x,y,z;   // number of float type eg 5.6

	printf("Enter the first number/n");
	scanf ("%f", &x);
	printf("Enter the second number/n");
	scanf ("%f", &y);
	printf("Enter the third number/n");
	scanf ("%f", &z);

	if (x==y==z)  // eg. 3=3=3
	printf("All numbers are same/n"); 

	else if (x==y && x<z)
	printf("first number and second number are equal and lower than third number/n");

	else if (y==z && y<x)
	printf("second number and third number are equal and first than third number/n");
	
	else if (z==x && x<y)
	printf("third number and first number are equal and lower than second number/n");

	else if (x<y && x<z)
	printf(" the lowest number is %f", x);

	else if (y<x && y<z)
	printf(" the lowest number is %f", y);

	else if (z<x && z<y)
	printf(" the lowest number is %f", z);

	

return 0;
}
