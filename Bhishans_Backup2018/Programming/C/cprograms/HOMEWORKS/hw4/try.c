/* Programmer: Bhishan Poudel
 * Question  : hw 4.7 
 *Topic	:
 *Develop a C program that computes the cost of a 
 *long-distance call and prepares the monthly billing statement.
 * 
 *The cost of the call is determined using the following rate schedule:
 *
 *Any all started between 8:00 am and 6:00 pm. Monday through Friday, is billed at
 *33 cents per minute.
 *
 *Any call starting before 8:00 am or after 6:00 pm, Monday through Friday, is
 *charged 21 cents a minute.
 *
 *Any call on a Saturday or Sunday, all day, is charged 10 cents a minute
 *
 *Use day of the call, time of the call and length of the call as input(s) and your program
 *computes and displays the cost of that call.
 *Multiple call cost are added to create the monthly billing statement!
 */
/* Author: Bhishan Poudel
   Question: hw 3.5 
Develop a C program that computes the cost of a long-distance call.
The cost of the call is determined using the following rate schedule:

a) Any call started between 8:00 am and 6:00 pm, Monday through Friday, is billed at
33 cents per minute. Note that if your calls starts before 6 pm and continues after 6 pm you will
be charged 33 cents per minutes and similar codition applies to all the cases.

b) Any call starting before 8:00 am or after 6:00 pm, Monday through Friday, is
charged 21 cents a minute

c) Any call on a Saturday or Sunday, all day, is charged 10 cents a minute
.......................................................................................
Use day of the call, time of the call and length of the call as input(s) and your program
computes and displays the cost of that call.
*/
//*****************************************************************************************

#include<stdio.h>
void instructions(void);
double calltime(char day, int length);
int main()
{
printf("***********************************************************\n");
	int length;
	double cost1,cost;
	char day;
	int time ;
	

	instructions();    	// first we call the function1
				// then we enter inputs
	printf("***********************************************************\n");
	cost = calltime (day, length);
	printf("call rate is $%.2f\n", cost);
	
	
printf("***********************************************************\n");	
return 0; 
}
	
				
	
//*****************************************************************************************************************************************
// after main fucntion we write the fucntions

void instructions () 
{
						
		printf("*******************Call rate information*********************:\n");
		printf("a) Any call started between 8:00 am and 6:00 pm, Monday through Friday,\n");
		printf("call rate is 33 cents per minute.\nNote that if your calls starts before ");
		printf("6 pm and continues after 6 pm \nyou will be charged 33 cents per minutes\n");
		printf("and similar condition applies to all the cases.\n");
		printf("b) Any call starting before 8:00 am or after 6:00 pm, Monday through Friday,\n");
		printf("is charged 21 cents a minute\n");
		printf("c) Any call on a Saturday or Sunday, all day, is charged 10 cents a minute\n");
		
}
//**************************************
//writing function calltime
double calltime(char day, int length) {
	
	double cost1,cost;
	int time;

	printf("If your day of call day is Saturday or Sunday, press y, otherwise press n and press enter\n");
	scanf (" %c", &day);
	
	printf("Enter the length of the call in minutes and press enter \n");
	scanf (" %d", &length);
	
	
	
	
	if (day == 'y')
	{	
		cost1 = (length * 0.1);			// cost is 10 cents a minute for weekend i.e. 0.1 dollars
		printf("For weekend call rate is 10 cents per minute\n");		
		printf("Total due is = $%.2f\n", cost1);
	
	}
	
	else
	{ 
		printf("Enter the starting of call time in military format \neg. 815 for 8:15 am and 2000 for 8:00pm and press enter\n");
		scanf (" %d", &time);
		if (time>=800 && time<=1800 )
		{
			cost1 = (length * 0.33);				// 33 cents per minutes.
			printf("For business days call rate is 33 cents per minute for peak hours time ( 8am thru 6pm)\n");	
			printf("Total due is = $%.2f\n", cost1); 
		}
		else
		{	cost1 = (length * 0.21);				// 21 cents per minutes.
			printf("For business days call rate is 21 cents per minute for rest hours time(6pm thru 8am)\n");	
			printf("Total due is = $%.2f\n", cost1); 
		}
		
	}
				// saving cost value for further use
	

return (cost1);
}
//***********************************************The End.
