//topic   : function pointer
//terminal: clear; gcc fnptr.c && ./a.out





#include<stdio.h> 

int myfunction (int a, int b);

int main()
{
    int(*fnptr)(int,int); // Function pointer 

    fnptr = myfunction; // Assign address to function pointer 

    myfunction(2,3); //invoking the function
    fnptr(5,6);      //invoking the function using function pointer 

    return 0;
}
//writing the function
int myfunction (int a, int b)
{
    printf("squares are: %d and  %d\n",a*a, b*b);

    return 0;
} 
