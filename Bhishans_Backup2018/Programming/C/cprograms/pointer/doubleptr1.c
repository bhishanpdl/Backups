//topic: pointer to pointers
//terminal: clear; gcc doubleptr1.c && ./a.out

#include<stdio.h>

int main()
{

	
	//pointer to pointer
	int num         = 45;
	int *ptr        = NULL ; // initializing is optional
	int **doubleptr = NULL ; //initializing  is optional
	
	ptr 		        = &num ; // now, *ptr = num = 45
	doubleptr 	    = &ptr;  // now, **doubleptr = *ptr = num = 45;
	
	printf("The value of num is            num         = %d\n", num);
	printf("The value of pointer is        *ptr        = %d\n", *ptr);
	printf("The value of double pointer is **doubleptr = %d\n\n",
	                                       **doubleptr);
	                                       
	                                       
	                                       
	//double pointer to array
	int a = 5;
	int b = 6;
	int c = 7;
	
	int array1[3] = {a,b,c};
	int array2[3] = {2,3,4};
	int array3[3] = {1,2,3};
	
	int *parray1[3] = { array1, array2, array3};     //now, parray1[0] is array1[3]
	printf("parray1[0][0] = %d\n", parray1[0][0]); // parray1[0][0] is a =5;
	                                            
	                                            
	int array4[3] = {10,20,30};
	int array5[3] = {100,200,300};
	int array6[3] = {1,2,3};
	
	int *parray2[3] = { array4, array5, array6};   //now, parray2[0] is array4[3]
	printf("parray2[0][0] = %d\n", parray2[0][0]); // parray2[0][0] is 10;
	
	
	int **parray[2] = { parray1, parray2}; //now, parray[0] is parray1
	printf("parray[0][0][0] = %d\n", parray[0][0][0]); // parray[0][0][0] is 5; 
       
	                                            
	                                           
	
	
    printf("\n");
	return 0;
}

