//topic   :
//ref     : http://web.cs.swarthmore.edu/~newhall/unixhelp/C_arrays.html
//terminal: clear; gcc malloc2.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char *argv[])
{
    int     a1[100];  // declare a static array, a1, of 100 ints
    char    c1[50];  // declare a static array, c1, of 50 chars
    int     matrix[50][100];  // declared a static 2D array of 50 rows, 100 cols
    int     i,j;

    // accessing array elements using indexing
    for(i=0; i < 100; i++) 
    {
    a1[i] = 0;   
    }

    for(i=0; i < 50; i++) 
    {
        for(j=0; j < 100; j++) 
        {
	        matrix[i][j] = 0;
        }
    }

    // accessing array elements using pointer arithmetic
    // In general, I recommend AVOIDING USING POINTER ARITHMETIC
    // (it is easy to make errors and hard to debug when you do)
    char *cptr = NULL;
    int *iptr = NULL;

    // make the pointer point to the first bucket in the array
    // the address of the start of an array is given two ways:
    //   &(array[0])  the address of bucket 0 
    //   array            also the address of bucket 0 

    cptr = &(c1[0]);   // initialize cptr to point to the start of c1
    iptr = a1;   // initialize aptr to point to the start of a1
    for(i=0; i < 50; i++) 
    {
        *cptr = 'a';
        *iptr = i;
        cptr++;  // cptr points to the next valid char address (the next bucket of c1)
        iptr++;  // iptr points to the next valid int address (the next bucket of a1)
    }

    // sets first matrix to: 
    // row 0:   0,   1,   2, ...,  99 
    // row 1: 100, 110, 120, ..., 199
    //        ...
    iptr = &(matrix[0][0]);
    for(i=0; i < 50*100; i++) 
    {
	    *iptr = i;
	    iptr++;  
    }



    return 0;
}


/*
statically declared arrays
==========================
    These are arrays whose number of dimensions and their size are known at compile time.
    Array bucket  values are stored in contiguous memory locations
    (thus pointer arithmetic can be used to iterate over the bucket values),
    and 2D arrays are allocated in row-major order (i.e. the memory layout is
    all the values in row 0 first, followed by the values in row1,
    followed by values in row 2 ...). Statically declared arrays
    can be declared as either global or local variables. 
*/
