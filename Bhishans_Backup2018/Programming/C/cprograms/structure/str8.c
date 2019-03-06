//topic:
//ref     : http://www.c4learn.com/c-programming/c-pointer-within-structure/
//terminal: clear; gcc str8.c && ./a.out

#include<stdio.h>

struct Student
{
   int  *ptr;  //Stores address of integer Variable 
   char *name; //Stores address of Character String
}s1;

int main() 
{

    int roll = 20;
    s1.ptr   = &roll;
    s1.name  = "Pritesh";

    printf("\nRoll Number of Student : %d\n",*s1.ptr);
    printf("\nName of Student        : %s\n",s1.name);

return(0);
}

