//topic: typeof operator in c program
//ref  :
//terminal: clear; gcc typeof2.c && ./a.out 4 2

#include<stdio.h>
#include<stdlib.h> //for strtoull, otherwise we will get a warning

int main(int argc, char *argv[]) 
{
    size_t              n = strtoull(argv[1], 0, 0); // string to unsigned long long
    double              array1[n][n]; // A is 2d array e.g A[4][2]    when arguments are 4 and 2
    typeof(array1)      array2;
    
    printf("size of array2 is %lu\n", sizeof(array2));
    
    array2[4][2] = {{1,20},{2,30},{3,40},{5,50};
    //row index          0      1      2      3   (4 rows)
	//column index       0 1    0 1    0 1    0 1 (2 columns)	
	printf("\narray4[3][0] = %d",  array2[3][0]); //4th row, first element
	printf("\narray4[3][1] = %d",  array2[3][1]); //4th row, second element
    
    


return 0;
}

/* 
Since typeof is a compiler extension, there is not really a definition for it, but in the tradition of C it would be an operator, e.g sizeof and _Alignof are also seen as an operators.

And you are mistaken, C has dynamic types that are only determined at run time: variable modified (VM) types.
This program can only be determined at run time.
*/
