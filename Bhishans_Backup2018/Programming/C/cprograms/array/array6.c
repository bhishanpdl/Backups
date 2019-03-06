/* 	program : array pointer
 *	author  : Bhishan Poudel
 *  ref     : https://www.google.com/search?q=array+of+pointers+in+c&ie=utf-8&oe=utf-8
 *  terminal: clear; gcc array6.c && ./a.out
 */

#include <stdio.h>
 
const int MAX = 3;
 
int main ()
{
    int  array[] = {10, 100, 200};
    int i;
    
    
    //accessing array elements
    for (i = 0; i < MAX; i++)
        printf("Value of var[%d] = %d\n", i, var[i] );
   
   
    //accessing array elements using pointer
    int  array2[] = {10, 100, 200};
    int  *ptr[3];
    
    
    // assign the address of integer.
    int j;
    for ( j = 0; j < 3; j++)
        ptr[j] = &var2[j];
        
         
    //printing values of array   
    for ( j = 0; j < 3; j++)
        printf("Value of var[%d] = %d\n", j, *ptr[j] );

      
      
   
   
   return 0;
}
