/* 	program : array pointer
 *	author  : Bhishan Poudel
 *  terminal: clear; gcc ptrarray2.c && ./a.out
 */

#include <stdio.h>
 
 
int main ()
{

     
    //pointer array
	double  a = 1.0, b = 2.0, c = 3.0;
	double  *ptr1, *ptr2, *ptr3; //pointer *ptr1 is type double
	
	
	//assigning values to the pointers
	ptr1 = &a; // now, *ptr1 = a
	ptr2 = &b;
	ptr3 = &c;

	
    //pointer to array
    double  *ptr[3] =   {  ptr1,  ptr2,  ptr3 }; //now, *ptr[0] = *ptr1 
    
    
    //printing array elements
    printf("*ptr[0] = %.2f\n", *ptr[0]);
    printf("*ptr[1] = %.2f\n", *ptr[1]);
    printf("*ptr[2] = %.2f\n", *ptr[2]);

    

   
   
   return 0;
}
