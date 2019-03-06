// topic: array in C
// soruce: http://www.programiz.com/c-programming/c-arrays
//			https://fresh2refresh.com/c/c-array/
// syntax: data_type array_name[array_size];                  for 1d array
// Syntax: data_type arr_name [num_of_rows][num_of_columns];  for 2d array
// array vs string: last element of string must be null '\0' but not necessary for array 

#include <stdio.h>

int main() {

	//Initialization of one-dimensional array:
	int array1[5] = {2,4,34,3,4};
	printf("\narray1[0] = %d", array1[0]);
	
	
	int array2[] = {5,21,4,3,40};
	printf("\narray2[1] = %d" , array2[1]);
	
	
	//Initialization of two-dimensional array:
	int array3[2][2] = {10,20, 30, 40}; 		
	// this is a matrix 00 01  10  11
	//Accessing array array_name[index];
	printf("\narray3[1][0] = %d ", array3[1][0]); //10 is third element
	printf("\narray3[1][1] = %d ", array3[1][1]); //11 is 4th   element
	
	
	int array4[4][2] = {{1,20},{2,30},{3,40},{5,50}};
	//row index          0      1      2      3   (4 rows)
	//column index       0 1    0 1    0 1    0 1 (2 columns)	
	printf("\narray4[3][0] = %d",  array4[3][0]); //4th row, first element
	printf("\narray4[3][1] = %d",  array4[3][1]); //4th row, second element
	
	
 	// sizeof array
 	printf("\n\nsizeof integer is %lu", sizeof(int)); 
 	printf("\nsizeof array1 is = %lu", sizeof(array1)); // sizeof(int) = 4
 	// %lu is unsigned long                             //    4  *  5  = 20
 	// %hu is unsigned short format specifier
 	
 	//printing all elements of 1d array:
 	//int array1[5] = {2,4,34,3,4};
 	printf("\n\n");
 	int i = 0;
	for (i; i < (sizeof(array1)/sizeof(array1[0]) ); i++)
		printf("array1[%d] = %d\n", i, array1[i]); // if we try \n\narray1, every lines
		                                          // will be escaped twice	
	
	//for (int i = 0; i < (sizeof(array1)/sizeof(array1[0]) ); i++)  // is not supported
	
    printf("\n");
    return 0;
}
