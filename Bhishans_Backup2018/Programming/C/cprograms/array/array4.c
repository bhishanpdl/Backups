// topic   : multidimensional array
// terminal: clear; gcc b.c && ./a.out

#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy
#define  N  4

int main(int argc, char *argv[])
{

	
    int naxes[N][3] = { {10,20,1}, { 10,20,1}, { 10,20,1}, {1, 2, 3} };

    printf("naxes[3][2] == %d\n", naxes[3][2]);
	
	
    return 0;
}

//note: Here N denotes the number of arrays having 3 elements.
//It can be changed to hold the number of elements you need. 
