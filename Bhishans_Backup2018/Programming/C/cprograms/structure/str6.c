//topic:
//ref     : http://www.programiz.com/c-programming/c-structures-pointers
//terminal: clear; gcc str6.c && ./a.out

/*
Structure's member through pointer can be used in two ways:

    1. Referencing pointer to another address to access memory
    2. Using dynamic memory allocation
*/

#include <stdio.h>
struct name
{
   int      a;
   float    b;
};
int main()
{
    struct name *ptr,p;
    
    ptr=&p;            // Referencing pointer to memory address of p
    
    printf("Enter integer: ");
    scanf("%d",&(*ptr).a);
    
    printf("Enter number: ");
    scanf("%f",&(*ptr).b);
    
    printf("Displaying: ");
    printf("%d  \t %.2f",(*ptr).a,(*ptr).b);
    
    printf("\n");
    return 0;
}
