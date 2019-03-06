// if statement in c program 
// terminal: clear; gcc ifStatement.c && ./a.out

#include<stdio.h>

int main(){

	int status1 = 0;
	int status2 = 5;
	
	if (-5)
	    printf("1: if statement is -5\n");
	
	if (0)
		printf("2: if statement is 0\n\n");  // this will not be printed
	
	if (1)
		printf("3: if statement is 1\n\n");		
	
		
	if (2)
		printf("4: if statement is 2\n");
		
	if (3>5)
	{ 
		printf("5: three is greater than 5\n"); // only one line works for if
		printf("5: this is second line\n"); // we should give {} for multiline
	                                     // statement block inside if statement
	}
	
	//******************************************************************
			
	int a = 5;
	if (a <= 2, a > 10, a !=15) // comma and logical OR are same
	    printf("6: comma: it is printed and a = %d\n\n",a);
	    
	if (a <= 2 || a > 10 || a !=15)
	    printf("7: logical OR: it is printed and a = %d\n\n",a);
	    
	    
	//******************************************************************
	int b = 5;   
	if (b <= 2 && b > 10 && b !=15)
	    printf("8: logical AND: it is printed and b = %d\n",a);
	else if ( b == 5)
	    printf("b is 5\n");
	else if ( ((b%2)==0) )
	    printf("%d is an even number\n",b);
	else 
	    printf ("all above statements are false\n");
	//******************************************************************
	//note if (0<a<2) is not allowed  , use 0<a && a<2
	//     if (a==b==c) is not allowed, true only when all are 1	
	

	return 0;
}
