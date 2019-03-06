/* topic: do while loop in c program
*  programmer: Bhishan Poudel
*  command   : clear; gcc whileLoop.c && ./a.out  
*  
*/

#include <stdio.h>
 
int main ()
{

    // while loop execution
    int a = 5;      //first a=5, 5<10, print a, then a++
    while( a < 10 ) //5,6,7,8,9
    {
        printf("%d\t", a);
        a++;
    }
    
    //example 2
    int b = 5;
    printf("\n");          //first, b++ = 6, then 6<10 true
    while( b++<10)         //6,7,8,9,10 same as while(b++, b<10)
        printf("%d\t", b);
   
   
    //example 3
    int c = 5;             //c-- post decrement operator
    printf("\n");
    while (c --> 0)        //4,3,2,1,0 
        printf("%d\t", c);
        
    //example 4
    int d = 5;              //--d is pre decrement operator      
    printf("\n");
    while (--d > 0) //4,3,2,1
        printf("%d\t", d);
        
        
        
        

    printf("\n\n");
    return 0;
}
