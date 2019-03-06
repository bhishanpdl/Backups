//topic   : structure
//ref     : http://stackoverflow.com/questions/15397728/c-pointer-to-array-of-pointers-to-structures-allocation-deallocation-issues
//terminal: clear; gcc str3.c && ./a.out

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Test {
    int data;
};

int main(int argc, char **argv)
{
    int i;

    srand(time(NULL));

    // allocate 100 pointers, effectively an array
    struct Test **temp_array = malloc(100 * sizeof(struct Test *));

    // allocate 100 structs and have the array point to them
    for (i=0; i < 100; i++) 
    {
        temp_array[i] = malloc(sizeof(struct Test));
    }

    // lets fill each Test.data with a random number!
    for (i = 0; i < 100; i++) 
    {
        temp_array[i]->data = rand() % 100;
    }

    // now define a pointer to the array
    struct Test ***p = &temp_array;
    printf("p points to an array of pointers.\n"
       "The third element of the array points to a structure,\n"
       "and the data member of that structure is: %d\n", (*p)[2]->data);
       
    //printing whole list
    for (i = 0; i < 100; i++) 
    {
        if (i % 10 == 0)
        printf("\n");
        printf("%3d ", (*p)[i]->data);
    }

    printf("\n");
    return 0;
}

