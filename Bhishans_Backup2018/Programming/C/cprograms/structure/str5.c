//topic   : structure
//ref     : http://stackoverflow.com/questions/15397728/c-pointer-to-array-of-pointers-to-structures-allocation-deallocation-issues
//terminal: clear; gcc str5.c && ./a.out

#include <stdio.h>
#include <stdlib.h>

struct Test 
{
    int data;
};

int main(int argc, char **argv)
{
    int i;


    // allocate 10 pointers, effectively an array
    struct Test **temp_array = malloc(10 * sizeof(struct Test *));

    // allocate 10 structs and have the array point to them
    for (i=0; i < 10; i++) 
    {
        temp_array[i] = malloc(sizeof(struct Test));
    }

    // lets fill each Test.data with a for loop
    for (i = 0; i < 10; i++) 
    {
        temp_array[i]->data = i;
    }

    // now define a pointer to the array
    struct Test ***p = &temp_array;
    printf("p points to an array of pointers.\n"
       "The third element of the array points to a structure,\n"
       "and the data member of that structure is: %d\n", (*p)[2]->data);
       
    //printing whole list
    for (i = 0; i < 10; i++) 
    {
        printf("%3d ", (*p)[i]->data);
    }

    printf("\n");
    return 0;
}

