//topic   : dynamically allocated arrays
//ref     : http://web.cs.swarthmore.edu/~newhall/unixhelp/C_arrays.html
//terminal: clear; gcc malloc3.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>


int main(int argc, char *argv[])
{
    // declare a pointer variable to point to allocated heap space
    int     *array1;
    double  *array2;
    int     i;

    // allocate memory for 50 ints using malloc
    array1 = (int *)malloc(sizeof(int)*50);
          
    // allocate 100 doubles
    //array2 = (double *)malloc(sizeof(double)*100);  

    //storing some values to array1
    // use [] notation to access array buckets
    for(i=0; i < 50; i++) 
    {
        array1[i] = i*i;
    }

    //printing stored values
    printf("array1[0] = %d\n", array1[0]);
    printf("array1[1] = %d\n", array1[1]);
    printf("array1[2] = %d\n", array1[2]);
    printf("array1[3] = %d\n", array1[3]);
    
    free(array1); // never forget to free

    


    return 0;
}

/*
dynamically allocated arrays
==============================
    Dynamically allocated arrays are allocated on the heap at run time. 
    The heap space can be assigned to global or local pointer variables
    that store the address of the allocated heap space (point to the first bucket).
    To dynamically allocate space, use calls to malloc passing in the
    total number of bytes to allocate (always use the sizeof to get the size of a specific type).
    A single call to malloc allocates a contiguous chunk of heap space of the passed size. 

*/
