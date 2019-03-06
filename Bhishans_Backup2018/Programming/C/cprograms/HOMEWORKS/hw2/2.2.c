// hw 2.2
// Develop a C program named Hawaiian Tourism Board Average Temperature 
// where the user can enter up to 10 days of temperature and the program computes 
// and displays the average temperature in those 10 days.

#include <stdio.h>
int main ()
{
	int i;
	double avg,temp=0,sum;
	printf("Please enter temperature of 10 days");
	printf(" and press enter key each time\n");
	
	for (i=1;i<=10;i++) 			// for while loop while(i<=10) is used and i=0 is defined before and i++ used inside loop
	{
		
		scanf ("%lf",&temp);
		
		sum += temp;
		
	}
	
	avg = sum/10;
	printf("The average temperature of 10 days is %.2f\n",avg);
return 0;
}


		
