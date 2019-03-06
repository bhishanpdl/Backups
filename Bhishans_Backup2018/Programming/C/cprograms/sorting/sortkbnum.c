/* C program to read numbers from keyboard and sort them alphabetically. */
//***********************************************************

#include<stdio.h>
#include<string.h>

int main()
{
printf("\n");
	int num[10]; // unsorted num storing
	int snum[10]; // sorted num storing
	int temp;		// temporary string
	int i,j,n;		// sorting loop counters

	printf("How many nums you want to enter?  ");
	scanf("%d", &n);
	printf("\nEnter %d nums: \n", n);

//storing nums in a string called num[i] and then copying to another string
	for (i=0; i<n; i++)
	{
		scanf("%d", &num[i]);				// num[i] is unsorted string
		snum[i]= num[i];			// so, we make a copy of unsorted string and will sort them
	}
//implementing sorting strings 	(mnemonic: FOR FOR IF)
	for (i=0; i<n-1; i++)
	for (j=i+1; j<n; j++){
	  if (snum[i] > snum[j]) {
				temp = snum[i]; 		// temp    = num[i]
				snum[i] = snum[j];	// num[i] = num[j]
				snum[j]= temp;		// num[j] = temp
	  }
	}


// display sorted and unsorted nums.......................
	printf("\n---------------------------------------------------\n");
	printf("Entered nums\tSorted nums\n");
	printf("-----------------------------------------------------\n");

	for (i=0; i<n; i++)
	{
		printf("%d\t\t%d\n", num[i], snum[i]);
	}
	printf("----------------------------------------------------\n");

printf("\n");
return 0;
}

