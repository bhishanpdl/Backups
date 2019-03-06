//topic    : for loop in c program
//note     : loops are = for loop, while loop and dowhile loop
//compile  : gcc forLoop.c
//compile  : gcc forLoop.c -std=c99     when we initialize for loop inside the argument
//run      : ./a.out
//terminal : clear; gcc forLoop.c -std=c99 && ./a.out

#include <stdio.h>

int main()
{
    int i; // counter for for loop
    
    //example 1
    //for loop has 3 arguments separated by ;
    for ( i=0; i<= 5; i++) 
        printf("i = %d\n\n", i);
     
    //******************************************************************   
    //example 2
    int a = 4;  
        
    for ( i=0, a=3; i<5; i = i+2) // comma is logical OR
    {
        printf("this is %dth value:\n", i);
        printf("i = %d\n", i);
    }
    
    
    //*****************************************************************
    //example 3
    printf("\n\n");
    for ( int j=0; j<= 5; j++) //for loop has 3 arguments separated by ;
        printf("j = %d\n", j);

    // gcc forLoop.c -std=c99   or, gcc forLoop.c -std=gnu99
    
    //******************************************************************
    //example 4
    // for (0<a<3) is not allowed
        
    return 0;
} 
