// Author :Bhishan Poudel
// Program: binary search
// note: we need sorted numbers to use binary search

#include <stdio.h>

//defining function prototypes
double binary_search(int n, double array[100]);

//main function
int main()
{
printf("\n");
   	int 	n;
 	double 	array[100];
 	double 	search;		//to call the function
   	int 	c;		// counter


 	//storing the input
   	printf("How many numbers you want to store?==> ");
   	scanf("%d",&n);

   	printf("\n", n);

   	for (c = 0; c < n; c++){
            printf("%d: Enter number in increasing order ==> ", c+1);
      		scanf("%lf",&array[c]);

    }

   	//calling the function
   	search = binary_search(n,array);

printf("\n");
return 0;
}
 //function binary_search
double binary_search(int n, double array[100])
{
 	int 	first	= 0;			//local variables
 	int  	last 	= n-1;
 	int 	middle 	= (first+last)/2;	//integer division
 	double	search;

   printf("\nEnter value to search ==> ");
   scanf("%lf", &search);

 //implementing binary search
   while (first <= last) {
      if (array[middle] < search)
         first = middle + 1;
      else if (array[middle] == search) {
         printf("%.2f found at location %d\n", search, middle+1);
         break;
      }
      else
         last = middle - 1;

      middle = (first + last)/2;
   }
   if (first > last)
      printf("Not found! %.2f is not present in the list.\n", search);

   return (search);
}


