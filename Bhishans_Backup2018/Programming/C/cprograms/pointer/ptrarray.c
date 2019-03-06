// topic: pointer and array
// terminal: clear; gcc ptrarray.c && ./a.out

#include<stdio.h>

int main()
{
	//example1	
	int     arr[2] = {10,20};
	int     *ptr1, *ptr2;
    	int     i =0, j=0;
	
	ptr1 = &arr[0]; //now, *ptr1 = arr[0]
	ptr2 = &arr[1]; //now, *ptr2 = arr[1]

    //value of pointers
    printf("example 1\n");
	printf("value of pointer is *ptr1  = %d\n", *ptr1);
	printf("value of pointer is *ptr2  = %d\n", *ptr2);
	
    //address of the pointers
	printf("the address of pointer1 is %p \n", (void *)&ptr1);
	printf("the address of pointer2 is %p \n", (void *)&ptr2);
	printf("\n");
	
	int     *ptr[2] = {ptr1, ptr2}; //now, *ptr[0] is ptr1
	
	
	printf("*ptr[0] = %d\n", *ptr[0]);
	


	//example 2
    //storing some strings in pointer to array
	char *array[] = {
						"C    is a program language",
						"C++  is a program language",
						"Java is a program language",
						"VBA  is a program language",
				
				     0}; 
					
					
    //printing stored strings
    printf("\nexample 2\n");
	for(i = 0; array[i] !=0; i++)
    printf("%s\n", array[i]);
    
    
    //example3
    
    int n1 = 10;
    int n2 = 20;
    int n3 = 30;
    
    //pointer to array
    int *n[3] = { &n1, &n2, &n3};
    
    //printing first array first element
    printf("\nn[0] = %d\n", *n[0]);
    
    
    //printing all the values
    printf("\nexample 3\n");
    for (i=0; i<3; i++)
        printf("n[%d] = %d\n", i, *n[i]);
    
    
    //example4
    
    int naxes1[3] = { 10,20,1};
    int naxes2[3] = { 100,200,10};
    int naxes3[3] = { 1000,2000,100};
    
    //creating array of arrays
    int *naxes[3] = { naxes1, naxes2, naxes3};
    
    //printing first array first element
    printf("\nnaxes[0][0] = %d\n", naxes[0][0]);
    
    
    //printing all the values
    printf("\nexample 4\n");
    for (i=0; i<3; i++)
    for (j=0; j<3; j++)
        printf("naxes[%d][%d] = %d\n", i,j,naxes[i][j]);
        
        
printf("\n");
return 0;
}
