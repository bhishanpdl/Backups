// Program demonstrating the use of an enumerated type (Hanly page. 409)



#include <stdio.h>
typedef enum		// type of function is enumerated
	{entertainment, rent, utilities, food, clothing,automobile, insurance, miscellaneous}
	expense_t;	// name of function is expense_t
	
void print_expense(expense_t expense_kind);	// function print_expense has inputs expense_t and expense_kind
//*****************************************
//int main

int main(void) 
{
	printf("Please enter the enumeration number (0 to 7) for the expense items\n");
	expense_t expense_kind;		// calling enum function expense_t
	scanf("%d", &expense_kind);	// scanning enum 0,1,2,3,4, and storing as expense_kind
	
	printf("Expense code represents "); 
	print_expense(expense_kind); 		// calling void function print_expense
	printf(".\n");
return (0);
}
//*********************************************
// void function print_expense; pre: expense_t expense_kind; void function does not have return value.

void print_expense(expense_t expense_kind) 
{
	switch (expense_kind) 
	{ 
		case entertainment:
		printf("entertainment"); 
		break;
		
		case rent: printf("rent");
		break;


		case utilities: printf("utilities");
		break;
		case food: printf("food");
		break;
		case clothing: printf("clothing");
		break;
		case automobile: printf("automobile");
		break;
		case insurance: printf("insurance");
		break;
		case miscellaneous: printf("miscellaneous");
		break;
		default:
		printf("\n*** INVALID CODE ***\n");
	}
}
//****************The End.
