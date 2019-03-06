// terminal: clear; gcc tryptr.c && ./a.out



#include <stdio.h>
#include <string.h>
#include <stdlib.h> 
#include <math.h>


int main(int argc, char *argv[])
{

    int         arr1[2] = {10,20};
    int         arr2[2] = {11,22};
    
	const int   *ptr1, *ptr2, *ptr;

	
	ptr1 = &arr1[0];
	ptr2 = &arr1[1];

    
	printf(" *ptr1 is = %d\n", *ptr1);
	printf(" *ptr2 is = %d\n", *ptr2);
    

        
        
    return 0;
}


