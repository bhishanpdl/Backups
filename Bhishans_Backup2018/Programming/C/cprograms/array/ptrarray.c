/* 	program : array pointer
 *	author  : Bhishan Poudel
 *  terminal: clear; gcc ptrarray.c && ./a.out
 */

#include <stdio.h>
 
 
int main ()
{

     
    //pointer array
	//note: *ptr1 = 1.0, we get segmentation fault
	double  *ptr1, *ptr2, *ptr3;

	
	
    double  *newptr[3] =   {  ptr1,  ptr2,  ptr3 };  
   
   
   
   return 0;
}
