//topic: 2D Arrays in C Using malloc
//ref  : http://pleasemakeanote.blogspot.com/2008/06/2d-arrays-in-c-using-malloc.html

//cmd  : clear; gcc malloc2d.c && ./a.out


#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char **argv)
{

    double  **theArray;
    theArray = (double**) malloc(arraySizeX*sizeof(double*));
    
    for (int i = 0; i < arraySizeX; i++)
   theArray[i] = (double*) malloc(arraySizeY*sizeof(double));



    return 0;
}
