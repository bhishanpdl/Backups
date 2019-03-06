// C program to add square of n terms.
// Author : Bhishan Poudel
// date: May 24, 2015

# include <stdio.h>
int main ()
{
	int i,n,sum=0;
	printf("Enter the number upto which the sum of squares is to be calculated\n");
	scanf("%d",&n);
	
	for (i=1;i<=n;i++)
	{
		sum += i*i;
	}
	printf("The sum of squares of numbers upto n is = %d\n",sum);
	
return 0;
}
