//topic: structure
//ref  : http://stackoverflow.com/questions/15397728/c-pointer-to-array-of-pointers-to-structures-allocation-deallocation-issues
//terminal: clear; gcc str4.c && ./a.out


#include<stdio.h>
#include<stdlib.h>

//defining structure called TestType
typedef struct Test 
{
   int data;
} TestType;

typedef  TestType * PTestType;

//This will create two new types, one for the struct 
//and one for a pointer to the struct.

int main()
{
    TestType array[2];  // creates an array of 2 of the structs
    
    PTestType array2[2];  // creates an array of 2 of pointers to the struct
    
    
    //Then if you want to allocate structs into the array 
    //you would do something like:
    
    PTestType  array3[2];  // creates an array of 2 of pointers to the struct
    
    
    // allocate memory for the structs and put their addresses into the array of pointers.
    int i;
    for (i = 0; i < 2; i++) 
    {
    array2 [i] = malloc (sizeof(TestType));
    printf("\nEnter the Roll Number : "); //eg. 1,2,3
    scanf("%d",&ptr[i]->roll);
    }
    
    free(array2);
    return 0;
}
    
