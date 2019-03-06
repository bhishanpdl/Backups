/* Example program for without arguments & without return value:

In this program, no values are passed to the function “test” 
and no values are returned from this function to main function.
*/

#include<stdio.h>

void test();          

int main()
{
    test(); 	// function call                        
    return 0;
}
//********************function definition
void test()  
{ 
       int a = 50, b = 80;   
       printf("\nvalues : a = %d and b = %d\n", a, b);
}
