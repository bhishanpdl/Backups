// topic   : multidimensional array
// terminal: clear; gcc array5.c && ./a.out

#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy


int main(int argc, char *argv[])
{

    int naxes1[3] = { 10,20,1};
    int naxes2[3] = { 100,200,10};
    int naxes3[3] = { 1000,2000,100};
    
    
    int *naxes[3] = {naxes1, naxes2, naxes3};
    /* this works fine
    printf("naxes[0][0]= %d\n", naxes[0][0]);
    printf("naxes[0][1]= %d\n", naxes[0][1]);
    printf("naxes[0][2]= %d\n", naxes[0][2]);
    printf("naxes[1][0]= %d\n", naxes[1][0]);
    printf("naxes[1][1]= %d\n", naxes[1][1]);
    printf("naxes[1][2]= %d\n", naxes[1][2]);
    
    */
    
    //printing all the elements
    int i=0, j=0;
    for (i=0; i<3; i++)
    for (j=0; j<3; j++)
    {
        printf("naxes[%d][%d] = %d\n", i,j,naxes[i][j]);
    }
    
    /* this doesnot works
    
    for (i=0, j=0; i<3, j<3 ; i++,j++)
    
    */
    
    
    /* this doesnot work
    int naxes[3][3] = {naxes1, naxes2, naxes3};
    printf("naxes[0][0]= %d\n", naxes[0][0]); 
	*/
	
    return 0;
}
