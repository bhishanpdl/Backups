 /*
Computes the mean and standard deviation of an array of data and displays 
the difference between each value and the mean.
*/
//*******************************************************************
#include <stdio.h>
#include <math.h>

//*******************************************************************
int main()
{
	const int n = 10;
	int 	i;
	double 	x[n]; 		// x is data array containing upto n=10 items.
	double 	mean;
	double 	stdev;		// standard deviation
	double 	sum;
	double 	sumsqr;

//************************************** storing data in the array x using for loop

	//printf("How many numbers you want to enter?");
	//scanf ("%d", &n);
	
	printf("Enter the %d numbers\n", n);

	for (i=0; i<n; ++i)
	{
		scanf("%lf", &x[i]);
	}
	
//************************************computing sum and sumsqr

  	sum =0;
	sumsqr=0;

	for (i=0; i<n; ++i)
	{
		sum += x[i];
		sumsqr += x[i] * x[i];
	}

//************************************computing mean and stdev

	mean = sum/n;

	stdev = sqrt( sumsqr/n - mean*mean);

	printf("The mean is %.2f.\n", mean);
	printf("The standard deviation is %.2f.\n", stdev);
	
//****************************************** displaying table using for loop

	printf("\nTable of differences between data values and mean\n");

	printf("Index	Item	\t      Difference\n");

	for (i=0; i<n; ++i)
		printf("%d\t %f\t %9.2f\n", i+1, x[i], x[i] - mean);
return 0;
}
