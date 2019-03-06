//numbers

#include<stdio.h>
#include<stdlib.h>

double binary_search(int n, double array[100]);

int main()
{
printf("\n");
	double num[100]; // unsorted num storing
	double array[100]; // sorted num storing
	double temp;		// temporary number
	int i,j;
	int n=0;
	double search1;

	FILE *fp;
	fp = fopen("numbers.txt", "r");

	if (fp == NULL) {
        	fprintf(stderr, "Could not open file\n");	// if we use printf("No files"), we will get segmentation fault.
        	exit(-1);
        }

	//storing input from the file
	while(!feof(fp)){
		fscanf(fp,"%lf",&num[n]);
        array[n]= num[n];
		n=n+1;
	}
	fclose(fp);
	n=n-1;


	printf("n= %d", n);

//implementing sorting strings 	(mnemonic: FOR FOR IF)
	for (i=0; i<n; i++){
	for (j=i+1; j<n-1; j++){
	  if (array[i] > array[j]) {
				temp = array[i]; 		// temp    = num[i]
				array[i] = array[j];	// num[i] = num[j]
				array[j]= temp;		// num[j] = temp
	  }
	}
	}

// display sorted and unsorted nums.......................
	printf("\n---------------------------------------------------\n");
	printf("S.N. Entered number\tSorted number\n");
	printf("-----------------------------------------------------\n");

	for (i=0; i<n; i++)
	{
		printf("%d\t%.0f\t\t%.0f\n",i+1, num[i], array[i]);
	}
	printf("----------------------------------------------------\n");

    search1 = binary_search(n,array);

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

   printf("Enter value to search ==> ");
   scanf("%lf", &search);

 //implementing binary search
   while (first <= last) {
      if (array[middle] < search)
         first = middle + 1;
      else if (array[middle] == search) {
         printf("%.0f found at location %d of sorted list \n", search, middle+1);
         break;
      }
      else
         last = middle - 1;

      middle = (first + last)/2;
   }
   if (first > last)
      printf("Not found! %.0f is not present in the list.\n", search);

   return (search);
}


