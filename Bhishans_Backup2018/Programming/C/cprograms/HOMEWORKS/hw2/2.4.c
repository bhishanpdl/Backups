/* hw 2.4
Develop a C program that lets the user 
to enter many values and displays the number 
as EVEN number or ODD number as the value is entered 
and display total EVEN numbers and total ODD numbers.
*/

#include <stdio.h>

void main()

{
	int n,x,rem,even,odd;			// n is the number of values entered
				
	int  i; 			// i is the count. i goes from 0 to n		

     	printf("How many values you want to enter? \n");     	
	scanf ("%d", &n);
	printf("***********************************\n");
	
	i    = 0;
        even = 0;
        odd  = 0;

        
        // if we use while loop we need      i++; inside the  loop
        // if we use for   loop we dont need i++; inside the loop
     
        
        
        //while (i < n)
        for (i = 0; i < n; i++)

        {	//i++;
		printf("Enter an integer \n");	
            	scanf("%d", &x);
            	
            	rem = x % 2 ;
            	
            	if (rem == 0) {
            	printf("%d is an EVEN integer\n", x);
            	even += 1; }
            	else {
            	printf("%d is an ODD  integer\n", x);
            	odd ++; }	

        }
        	printf("total number of even integers is %d\n", even);    	// total number is outside the loop
        	printf("total number of odd  integers is %d\n", odd );
        	
        
        			
		printf("***********************************\n");
    }
