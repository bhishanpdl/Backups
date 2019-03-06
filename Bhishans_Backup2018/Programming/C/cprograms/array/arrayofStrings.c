//topic    : array of strings
//terminal : clear; gcc arrayofStrings.c && ./a.out

#include<stdio.h>


int main()
{

    int i;

	char *array[] = {
						"C    is a program language",
						"C++  is a program language",
						"Java is a program language",
						"VBA  is a program language",
				
				     0};
				      
	//printing first element of array
	
	printf("first element of array is \narray[0] = '%s'\n\n",
	                                  array[0]);			
					
    //printing all the array elements
	for(i = 0; array[i] !=0; i++)
    printf("%s\n", array[i]);
    
    /*  
    // this is wrong:
    // error: incompatible types when initializing 
    // type ‘double *’ using type ‘double’
    
    double *arrayd[] = { 10.2, 3.4, 5};
    printf("\narrayd[0]= %.2f\n", arrayd[0]);
    */
    
return 0;
}
