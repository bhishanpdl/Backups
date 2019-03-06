/* Author : Bhishan Poudel
* topic   : multidimensional array
*
* terminal: clear; gcc multidimArray.c && ./a.out 
*/ 

#include <stdio.h>
#include <string.h>
#include <stdlib.h> 	

int main(int argc, char *argv[])
{

    int naxes[20][3] = { [0 ... 19] = { 1, 2, 3 }, };
    


    printf("naxes[0][0]  = %d\n", naxes[0][0]);
    printf("naxes[19][0] = %d\n\n", naxes[19][0]);

    printf("naxes[0][1]  = %d\n", naxes[0][1]);
    printf("naxes[19][1] = %d\n\n", naxes[19][1]);

    printf("naxes[0][2]  = %d\n", naxes[0][2]);
    printf("naxes[19][2] = %d\n\n", naxes[19][2]);


return 0;
}


//for indices 1 to 20 we do like this:
//int naxes[21][3] = { [0] = { -1, -1, -1 }, [1 ... 20] = { 1, 1, 1 }, };
