/* hw 2.5
Assume that you offer programming seminars to companies. Your price per person depends on the number of people the company registers. For example, if the company registers 6 people, then the total amount owed is $480, which is calculated by multiplying the number of registrants by $80. 
	Number of Registrants		 charge criteria
		1 – 4			$100 per person
		5 – 10			$80 per person
		11 or more		$65 per person
		
*/

#include <stdio.h>
int main ()
{

	int n,t;
	
	printf("Enter number of registrants\n");
	scanf ("%d",&n);
	
	if (n<=4)
	{
		t = n*100;
		printf("The total amount owed is:$ %d\n",t);
	}
	else if (n>=5 && n<=10)
	{
		t = n*80;
		printf("The total amount owed is:$ %d\n",t);
	}
	else 
	{
		t = n*65;
		printf("The total amount owed is:$ %d\n",t);
	}
return 0;
}
