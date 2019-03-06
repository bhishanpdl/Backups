// qn3.c  Bhishan Poudel CS 5900 Midterm

#include<stdio.h>

int main()
{
	char type;
	double cost, due;
	
	printf("Instructions:\n");
	printf("If you are preferred customer and use store card enter letter p\n");
	printf("If you are preferred customer and do not use store card enter letter q\n");
	printf("If you are not a preferred customer enter letter n\n");
	scanf ("\n%c", &type);
	
	printf("enter the total cost in dollars\n");
	scanf (" %lf", &cost);
	
	if ((type == 'p') && (cost>=1000)) {  // p is for preferred using store card // eg 2000
		due = cost*0.90;   // 5% for ordering more than 1000 and 5% for using card
		printf("Total due is $%.2f\n", due); }
		
	else if ( type == 'q' && cost>=1000) {  		// q is for preferred but not using card // eg 2000
		due = cost*0.95;    // 5% for ordering more than 1000 
		printf("Total due is $%.2f\n", due); }
		
	else if ((type == 'p' || type == 'q' ) && (cost<1000)){		// eg. 500
	
		due = cost - 25;    // 5% for ordering more than 1000 
		printf("Total due is $%.2f\n", due); }
		
	
							// this is for non preferred customers eg. 1000
	else  {
		due = cost - 5;   
		printf("Total due is $%.2f\n", due); }



return 0;
}
