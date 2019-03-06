//malloc examples
//ref: https://stackoverflow.com/questions/7179187/2d-array-using-a-double-pointer-and-malloc-function
//cmd: clear; gcc doubleptrMalloc2.c -std=c99 && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char **argv)
{
    int **matrix;
    //matrix=(int **) malloc(2*sizeof(int *)); //do not use this
    matrix = malloc(2 * sizeof *matrix); //2 means two rows of matrix 0 1

    for(int i=0;i<2;i++) // we have to repeat twice i.e. (2d array )
    {
        //matrix[i]=(int *) malloc(3*sizeof(int));
        matrix[i] = malloc(3 * sizeof *matrix[i]); // 3 means three columns 0 1 2
    
        for(int j=0;j<3;j++)
        {
            scanf("%d", &matrix[i][j]); //type three integers e.g. 1 2 3 and then 4 5 6 
        }
    }


    //printing the stored values
    for(int i=0;i<2;i++) // accessing the row array
    {

        for(int j=0;j<3;j++) //accessing elements inside the array
        {
            printf("matrix[%d][%d] = %d\n", i, j, matrix[i][j]);
        }

    }
    
    
    
    //freeing the memory
    for(int i=0;i<2;i++)
        free( matrix[i]);
    free(matrix);

    return 0;
}

/* 2d array or matrix

0:  0 1 2
1:  0 1 2

first for loop is columns 0 and 1,
second for loop is three rows, we can enter 1 2 3  and then 4 5 6 

person entered matrix
0: 1 2 3
1: 4 5 6
   0 1 2

note: sizeof is not a function
*/
