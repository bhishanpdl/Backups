/* Storage has full capacity 80k=80,000 barrels
 * Tankers can extract gas from the storage many times (in gallons)
 * We will get low gas warning when available storage is less than 10% (i.e. 8000)
 *
 * e.g. Full capacity of tank 80k
 * 	initial capacity 10,000 barrels (this is initial) (current = initial for the 0th count of the loop)
 * 	tanker extracts  42000 gallons = 1000 barrels from the storage tank
 *	current storage = 10,000-1000=9,000 barrels
 * 	tanker extracts 42000 gallons = 1000 barrels
 *	current storage = 9,000-1,000 = 8,000 barrels
 *	tanker extracts 42 gallons = 1 barrel
 * 	current storage = 8,000 -1 = 7,999 ( this is below 8,000 gallons so we get warning)
 */
//*****************************************************************************************************************************************
#include <stdio.h>
				// define constant macros
#define CAPACITY 80000.0
#define MIN_PCT 10
#define GALS_PER_BRL 42.0
				// define function prototype

double comp_current(double min, double initial);
//*****************************************************************************************************************************************
				// define main function

int main(void)
{

	double initial; 	// input - initial amount in barrels
	double min;
	double current;

				// Compute minimum value without warning 
				
	min = CAPACITY * MIN_PCT / 100.0 ;
	
				// Get initial supply 
	printf("**********************************\n");				// this line separates line from ./a.out in terminal		
	printf("Enter initial storage in the tank (in barrels)> \t ");		// e.g. 10,000 rmv=42000,42000;
	scanf("%lf", &initial);
				// now we invoke the function
									// here current=initial=10k>8k , so enters the loop.
					
	current = comp_current(min, initial);
				// when "current" exits the loop, main function gives warning 
				
	printf("only %.2f barrels are left.\n", current);
	printf("*** WARNING ***\n");

	printf("Available supply is equal or less than %d percent of tank's\n", MIN_PCT);
	printf("%.2f-barrel capacity.\n", CAPACITY);
	printf("**********************************\n");
	
return (0);
}
//*****************************************************************************************************************************
// now we write the function to compute current storage 

	double comp_current(double min, double initial)			// pre: min, initial and post: current
	{
		double rmv_gals =0, rmv_brls=0, current;		// variables are rmv_gals, rmv_brls
		
		
		for(current = initial; current > min; current -= rmv_brls) 	 // WORKING OF LOOP FUNCTION: ( loop=4 lines=3+1 lines)
		{						      	  // here, current = initial = 10,000	
		printf("Current storage is %.2f barrels\n", current); 	  // loop1a: 3 lines before scan (then we enter gal rmv 42000)
		printf("**********************************\n");		  //loop1b: 1 line after scan (after rmv)
		printf("Enter number of gallons removed = ");		  // here, current=9000, enters the for loop
		scanf("%lf", &rmv_gals);				  // loop 2: looks like : after rmv,current,****,enter gal rmv
		rmv_brls = rmv_gals / GALS_PER_BRL;			  // if loop enters next step, loop has 4 lines after scan.
		printf("After removal of %.2f gallons (%.2f barrels),\n", // if loop can't enter next, loop has 1 line after scan.
		rmv_gals, rmv_brls);					  // here, current = 8000 cannot enter next loop
		}							  // display: 1 line after scan.
return (current);							  // display: what ever the lines after loop in the main function
}									  // here, 1 line of loop and 4 lines of main function
									  // 5 lines: after rmv,only brl,warning,available,******;
//*****************************************************************************************************************************************
/*									

working of "for loop" fucntion
initial = 10,000;
................................................................................................
current		(here current=initial=1000 enters the loop and shows line upto scan)
*****
enter gal rmv    ( then we enter 42000gal=1000brl)
..................................................................................................
		(now current = 10000-1000=9000 brl enters the loop upto scan)
after rmv
current
******
enter gal rmv   (then we enter 42000 gals= 1000 brl)
.....................................................................................................
		(then current=8000, cannot enter the loop after for , but goes after scan line)
after rmv
......................................................................................................
		(then exits the comp_current function and goes to main function)
only barrels are left
warning
*/
