//*****************program to search multiple occurence of a number from input of numbers

#include <stdio.h>
//************************function prototype
 
int linear_search(double [], int, double); // function returns integer -1 or c

//**********************************main function 
int main()
{
	int n,c=0;
	double numbers[100];
	double search;
	int position;
	int count=0;
	
   
 //*********************storing input numbers in an array called numbers
   printf("How many numbers you want to enter?\n");
   scanf("%d", &n);
 
   printf("Enter %d numbers\n", n);
 
   for (c = 0; c < n; c++)
      scanf("%lf", &numbers[c]);
      
 //***********************************searching the number.
 
   printf("Input number to search\n");
   scanf("%lf",&search);
 
   position = linear_search(numbers, n, search); // invoking the function call
 
   if (position == -1)
      printf("%lf is not present in array.\n", search);
      
   else {
   	for (c = 0; c < n; c++) {
      		if (numbers[c] == search) {
         		printf("%lf is present at location %d.\n", search, c+1);
	 		count++;
      		}
   	}
   
      printf("%lf is present %d times in array.\n", search, count);
    }  
 
   return 0;
} 
//********************************write the function called linear_search 

int linear_search(double a[], int n, double find) 	// eg. a[] = {1.1,2.2,3.2,4.4}
{							// a[0]=1.1, a[1]=2.2, a[2]=3.3, a[3]=4.4
   int c;
 
   for (c = 0 ;c < n ; c++ ) {
      if (a[c] == find)		// when it returns c, a[c] is the first argument and is equal to third arument find.
         return c;		// then, in function call, numbers=search happens.
   }
 
   return -1;
}

//******************************using pointer method
/*
int linear_search(double *pointer, int n, double find)   // local variables *pointer and find need not to be defined.
{
   int c;
 
   for (c = 0; c < n; c++) {
      if (*(pointer+c) == find)
         return c;
   }
 
   return -1;
}
*/
//**********************************the end

