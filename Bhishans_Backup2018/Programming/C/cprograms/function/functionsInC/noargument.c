/* Example program for without arguments & with return value:

In this program, no arguments are passed to the function “sum”.
 But, values are returned from this function to main function. 
 Values of the variable a and b are summed up in the function “sum” 
 and the sum of these value is returned to the main function.
*/
#include<stdio.h>

int sum();          

int main()
{
    int addition;
    addition = sum();                  
    printf("\nSum of two given values = %d\n", addition);
    return 0;
}

int sum()  
{ 
       int a = 50, b = 80, sum;   

       sum = a + b;
       return sum;       
}
