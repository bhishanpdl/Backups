/* Develop a C program that lets the user 
to enter many values and displays the number 
as EVEN number or ODD number as the value is entered 
and display total EVEN numbers and total ODD numbers.
*/

#include <stdio.h>

void main()

{
	int n;				// n is the number of values entered
	int even = 0;
	int odd  = 0;				
	int  i   = 0; 			// i is the count. i goes from 0 to n 
	int array[100];			// we use array to store a fixed-size sequential collection of elements of the same type
	
	
				// we decide how many numbers to store in a array. 		

     	printf("How many values you want to enter? \n");

        scanf("%d", &n);
        
        			// now we shall prompt and store n values using array

       printf("***********************************\n");

        for (i = 0; i < n; i++)

        {
		printf("Enter the value\n");
            	scanf("%d", &array[i]);
            	
            	if (array[i] % 2 == 0) {
            	printf(" %d is an EVEN integer\n", array[i]); 
            	printf("***********************************\n");
            	even++ ; }
            	else if (array[i] % 2 != 0) {
            	printf(" %d is an ODD  integer\n", array[i]);
            	printf("***********************************\n");
            	odd++ ; }	

        }
        	
        	printf("total number of even integers is %d\n", even);    	// total number is outside the loop
        	printf("total number of odd  integers is %d\n", odd );
        	printf("***********************************\n");
        
        			// to print even numbers we use FOR loop and IF condition is if remainder is zero

        printf("Even numbers are : \n ");

        	for (i = 0; i < n; i++)

        	{

            		if (array[i] % 2 == 0)

            		{

                	printf("%d \t", array[i]);

            		}

       	        }
					// to print odd numbers we use FOR loop and IF condition is remainder is non zero.
					
			

        		printf("\nOdd numbers are: \n");

        		for (i = 0; i < n; i++)

        		{

            		if (array[i] % 2 != 0)

            		{

                	printf("%d \t", array[i]);

            		}

        		}
        		printf("\n");
			printf("***********************************\n");
    }
