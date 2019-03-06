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
 
#include<stdio.h>
void instructions(void);			// function declaration
double calltime(char day, int length);		// function declaration
int main()
{
printf("\n");
	int length;
	double cost;
	char day;
	int time ;
	

	instructions();    	// first we call the function1
				// then we enter inputs
	printf("***********************************************************\n");
	
	
	cost = calltime (day, length);		// function call
	//printf("double of call rate is $%.2f\n", cost*2);
	
printf("\n");	
return 0; 
}
	
				
	
//*****************************************************************************************************************************************
// after main fucntion we write the fucntions

void instructions () 
{
						
		printf("*******************Call rate information*********************\n\n");
		printf("a) Any call started between 8:00 am and 6:00 pm, Monday through Friday,\n");
		printf("call rate is 33 cents per minute.\nNote that if your calls starts before ");
		printf("6 pm and continues after 6 pm \nyou will be charged 33 cents per minutes\n");
		printf("and similar condition applies to all the cases.\n\n");
		printf("b) Any call starting before 8:00 am or after 6:00 pm, Monday through Friday,\n");
		printf("is charged 21 cents a minute\n\n");
		printf("c) Any call on a Saturday or Sunday, all day, is charged 10 cents a minute\n");
		
}
//**************************************
//writing function calltime
double calltime(char day, int length) {
	
	double cost;
	int time;

	printf("\nIf your day of call day is Saturday or Sunday, press y, otherwise press n and press enter ==> ");
	scanf (" %c", &day);
	
	if (!(day == 'y' || day == 'Y' || day == 'n' || day == 'N'))
	{
		printf("Please enter y for weekend (Saturday or Sunday) or press n\n");
	}
	
	else 
	{
	
	printf("Enter the length of the call in minutes and press enter ==> ");
	scanf (" %d", &length);
	
	
	
	
	if (day == 'y' || day == 'Y')
	{	
		cost = (length * 0.1);			// cost is 10 cents a minute for weekend i.e. 0.1 dollars
		printf("For weekend call rate is 10 cents per minute\n");		
		printf("Total due is = $%.2f\n", cost);
	
	}
	
	else if (day == 'n' || day == 'N')
	{ 
		printf("Enter the starting of call time in military format \neg. 815 for 8:15 am and 2000 for 8:00pm and press enter\n");
		scanf (" %d", &time);
		if (time>=800 && time<=1800 )
		{
			cost = (length * 0.33);				// 33 cents per minutes.
			printf("For business days call rate is 33 cents per minute for peak hours time ( 8am thru 6pm)\n");	
			printf("Total due is = $%.2f\n", cost); 
		}
		else
		{	cost = (length * 0.21);				// 21 cents per minutes.
			printf("For business days call rate is 21 cents per minute for rest hours time(6pm thru 8am)\n");	
			printf("Total due is = $%.2f\n", cost); 
		}
		
	}
	}


return (cost);
}
 
 
