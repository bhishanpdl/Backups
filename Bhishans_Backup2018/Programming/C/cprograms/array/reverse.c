/* 	Program:  c program to reverse an array
 *   	Author :  Bhishan Poudel
 *  
 * 	example a[c] = {1,2,3} 
 * 	reverse is b[c] = {3,2,1}
 */

#include<stdio.h>

int main()
{

printf("\n");

	int n,c;
	int a[100];
	int d;
	int b[100];

	printf("How many numbers you want to enter?\t");  // eg. 3 numbers 4,5,6
	scanf ("%d", &n);
	
	//storing numbers in an array a[c]
	for (c=0; c<n; c++)	//a[0], a[1], a[2]
	scanf("%d", &a[c]);

	//Copying elements into array b starting from end of array a
	
	for (c = n-1, d=0 ; c >= 0; c--, d++)	// computer hangs if we write:
						// for (c=n-1,c--; c >=0; d=0, d++) 
	b[d] = a[c] ;		// it shows answer 0 0 if we write
						// a[c] = b[d];

	//displaying reversed array
	printf("the reversed array is:\n");

	for (d = 0; d<n; d++)
	printf("%d\n", b[d]);

	

printf("\n");
return 0;
}
