/* topic: do while loop in c program
*  programmer: Bhishan Poudel
*  command   : clear; gcc dowhileLoop.c && ./a.out  
*
*/

#include <stdio.h>
 
int main ()
{
    //local variable
    int a = 10;

   // do loop execution
   //first prints a = 10, then executes while loop
   do
   {
       printf("value of a: %d\n", a);
       a = a + 1;
   }
   while( a < 12 );
   
   
    //while loop
    //first check b<10, then prints values
    printf("\n");
    int b = 10;
    while( b < 12 )
    {
       printf("value of b: %d\n", b);
       b++;
   }

        
        
        
        

    printf("\n\n");
    return 0;
}
