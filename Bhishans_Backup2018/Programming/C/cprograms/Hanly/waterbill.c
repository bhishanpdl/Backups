// This program figures a water bill based on the demand
// charge ($35.00) and a $1.10 per 1000 gallons use charge.
// A $2.00 surcharge is added to accounts with an unpaid balance.

// inputs are previous,current meter readings in kilogallons and unpaid amount of money
// output is bill = DEMAND_CHG + use_charge + unpaid + late_charge;
// we need four functions fn1: instructions fn2: comp_use_charge fn3: comp_late_charge fn4: display_bill

// fn1 is only instructions
// fn2 is computing use charge : use_charge = used * CHG_PER_KILOGAL;
// fn3 is computing late charge: late charge is $2 if unpaid >0;
// fn4 is only display : it displays total due = ...
//                       it also displays "Bill includes late charge ... of unpaid ... " if unpaid >0;


// solution:
// 1. include and define directories
// 2. function prototypes ( function call)
// 3. main function i.e., int main (void) { instructions,inputs,formulas and functions, return 0; }
// 4. functions algorithms i.e., fn1,fn2,fn3,fn4 
//*******************************************************************************************************************************************

#include<stdio.h>			// these are directories
#define DEMAND_CHG 35.00
#define CHG_PER_KILOGAL 1.10
#define LATE_CHG 2.00

//********************************************************************************************************************************************
// now we define function prototypes i.e., we make function calls

void instructions(void);
double comp_use_charge(int previous, int current);  	// this functions returns double and inputs are integers previous and current
double comp_late_charge(double unpaid);
void display_bill(double late_charge, double bill, double unpaid);

//*********************************************************************************************************************************************
// now we define main function which includes all variables, all functions, formulas, and return 0; }

int main (void)
{
	int previous,current,used;
	double unpaid,use_charge,late_charge,bill; 	 // all the variables used

	instructions();					// first we give user instructions from fn1 which will be written latter

	printf("Enter unpaid balance $\n");		// input variables
	scanf("%lf",&unpaid);
	printf("Enter previous meter reading \n");
	scanf("%d",&previous);	
	printf("Enter current meter reading\n");
	scanf("%d",&current);

	use_charge = comp_use_charge(previous, current);	// output of fn2 compute use charge
	
	late_charge = comp_late_charge(unpaid);			// output of fn3 compute late charge

	bill = 	DEMAND_CHG + use_charge + unpaid + late_charge; // formula for final output

	display_bill(late_charge, bill, unpaid);		// fn4 this will display the final output

	return 0; 
}
//**********************************************************************************************************************************************
// now we shall write fn1						

	void instructions () 
	{
						// first write printf(""); and copy and paste i.e. enter tab tab ctrl v
		printf("This program figures a water bill");
		printf("based on the demand charge\n ");
		printf("($%.2f) and a $ %.2f per 1000",DEMAND_CHG,CHG_PER_KILOGAL);
		printf("gallons use charge.\n\n ");
		printf("A $%.2f surcharge is added to ",LATE_CHG);
		printf("accounts with an unpaid balance.\n ");
		printf("Enter unpaid balance,previous ");
		printf("and current meter readings\n ");
		printf("on separate lines after the prompts.\n ");
		printf("Press return or enter on your keyboard ");
		printf("after typing each number.\n\n ");
	}
//***********************************************************************************************************************************************
//now we shall write fn 2 to compute use_charge = used * CHG_PER_KILOGAL
// a. define variable b. write formulas c. return the output
	double comp_use_charge(int previous, int current)   // output is double and inputs are integers.
	{
		int used;
		double use_charge;

		used = current - previous;
		use_charge = used * CHG_PER_KILOGAL;

		return (use_charge);
	}
//***********************************************************************************************************************************************
//now we shall write fn3 to compute late_charge
// a. define variables b. if unpaid > 0, then late charge is $ 2.00 which is constant Macro LATE_CHG

	double comp_late_charge(double unpaid)
	{
		
		double late_charge;
	
		if (unpaid > 0)
			late_charge = LATE_CHG;
		else
			late_charge = 0.0;
		return (late_charge);
	}
//***********************************************************************************************************************************************
// now we write fn4 to show the display_bill
// a. it shows total due = ... b. if late_charge>0.0 it also shows bill includes late_charge

	void display_bill(double late_charge, double bill, double unpaid)	// late_charge,bill and unpaid are inputs from previous part
	{
		if (late_charge > 0.0)
		{
			printf("\nBill includes $%.2f late charge",late_charge);
			printf(" on unpaid balance of $%.2f\n",unpaid);
		}
		printf("\nTotal due = $%.2f\n",bill);
	}
//************************************************************************************************************************************************

	 









