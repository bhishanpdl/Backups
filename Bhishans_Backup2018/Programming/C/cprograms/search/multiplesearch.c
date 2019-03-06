// program to search mutliple occurence of an integer from input of many integers

#include <stdio.h>
 
int main()
{
   	int 	array[100];
   	int 	search;
   	int 	c=0;
   	int  	n;
   	int  	found = 0;
 
   	printf("How many numbers you want to store ==> ");
   	scanf("%d", &n);
   
	//storing the numbers in an array called array
   	printf("Enter %d numbers\n", n);
 
   	for ( c = 0 ; c < n ; c++ )
      	scanf("%d", &array[c]);
      
	//storing the number to search 

   	printf("Enter the number to search==> ");
   	scanf("%d", &search);
   
	//searching the number
   	for (c = 0; c < n; c++) {
      	if (array[c] == search) {
         	printf("%d is present at location %d.\n", search, c+1);
	 	found++;
      	}
   	}
   	if (found == 0)
      		printf("%d is not present in array.\n", search);
   	else
      		printf("%d is present %d times in the array.\n", search, found);
      		
printf("\n");
return 0;
}

