/* Author: Bhishan Poudel
   Question: hw 3.5 
Develop a C program that computes the cost ofa long-distance call.
The cost of the call is determined using the following rate schedule:

a) Any call started between 8:00 am and 6:00 pm, Monday through Friday, is billed at
33 cents per minute.

b) Any call starting before 8:00 am or after 6:00 pm, Monday through Friday, is
charged 21 cents a minute

c) Any call on a Saturday or Sunday, all day, is charged 10 cents a minute
.......................................................................................
Use day of the call, time of the call and length of the call as input(s) and your program
computes and displays the cost of that call.
*/
//*****************************************************************************************

#include<stdio.h>

int main()
{
	int length;
	double cost;
	char day,time ;
	
	printf("If your day of call day is Monday through Friday, press y , otherwise press n\n");
	scanf (" %c", &day);
	printf("If your time of call day is 8 am through 6 pm, press y , otherwise press n\n");
	scanf (" %c", &time);
	printf("Enter the length of the call in minutes \n");
	scanf (" %d", &length);
	
	
	
	
	if (day == 'y')
	{	if (time == 'y')
		{
			cost = (length * 33)/100.0;		// eg. y,y,2 cost = 2*33=66
			printf("Total due is = $%.2f\n", cost); 
		}
		else
		{	cost = (length * 21)/100.0;		// eg. y,n,2 cost = 2*21=42
			printf("Total due is = $%.2f\n", cost); 
		}
		
	}
	else 
	{	cost = (length * 10)/100.0;			// eg. n,y,2 or n,n,2 cost = 2*10=20
		printf("Total due is = $%.2f\n", cost);
	}
return 0;
}
