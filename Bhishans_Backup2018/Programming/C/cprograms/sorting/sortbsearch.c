/* C program to read numbers from keyboard and sort them alphabetically. */
//***********************************************************

#include<stdio.h>
#include<string.h>

//defining function prototypes
//int binary_search(int n, int snum[10]);
double binary_search(int n, double array[10]);

int main()
{
printf("\n");
	double num[10]; // unsorted num storing
	double array[10]; // sorted num storing
	double temp;		// temporary number
	int i,j,n;		// sorting loop counters
	double search;

	printf("How many numbers you want to enter? ==>  ");
	scanf("%d", &n);
	//printf("\nEnter %d numbers: \n", n);

//storing nums in a string called num[i] and then copying to another string
	for (i=0; i<n; i++)
	{
	    printf("\n%d: Enter the number==>  ", i+1);
		scanf("%lf", &num[i]);				// num[i] is unsorted string
		array[i]= num[i];			// so, we make a copy of unsorted string and will sort them
	}
//implementing sorting strings 	(mnemonic: FOR FOR IF)
	for (i=0; i<n-1; i++)
	for (j=i+1; j<n; j++){
	  if (array[i] > array[j]) {
				temp = array[i]; 		// temp    = num[i]
				array[i] = array[j];	// num[i] = num[j]
				array[j]= temp;		// num[j] = temp
	  }
	}


// display sorted and unsorted nums.......................
	printf("\n---------------------------------------------------\n");
	printf("Entered number\tSorted number\n");
	printf("-----------------------------------------------------\n");

	for (i=0; i<n; i++)
	{
		printf("%.2f\t\t%.2f\n", num[i], array[i]);
	}
	printf("----------------------------------------------------\n");

    search = binary_search(n,array);

printf("\n");
return 0;
}
//function binary_search
double binary_search(int n, double array[10])
{
 	int 	first	= 0;			//local variables
 	int  	last 	= n-1;
 	int 	middle 	= (first+last)/2;	//integer division
 	double	search;

   printf("Enter value to search ==> ");
   scanf("%lf", &search);

 //implementing binary search
   while (first <= last) {
      if (array[middle] < search)
         first = middle + 1;
      else if (array[middle] == search) {
         printf("%.2f found at location %d of sorted list \n", search, middle+1);
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
