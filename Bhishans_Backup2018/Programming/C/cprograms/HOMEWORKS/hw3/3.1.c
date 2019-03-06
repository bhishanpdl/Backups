/* Author: Bhishan Poudel
   Question: hw 3.1

Develop a program that asks for the user's  height, weight and age (integer). 
and then computes clothing sizes according to the formulas:

Hat Size = a weight in pounds divided by height in inches multiplied by 2.9
.............................................................................
Jacket Size (chest in size) = height times weight divided by 288 and than adjusted
by adding 1/8 of an inch for each 10 years over age 30. 

(Note that adjustment only takes place after a [all 10 years. 
So, there is no adjustment for ages 30 through 39, 
but 1/8 of an inch is added for age 40)
...............................................................................
Waist (in inches) = weight divided by 5.7 and then adjusted by adding 1/10 of an
inch for each 2 years over age 28. 

(Note that the adjustment only takes place after a full 2 years.
 So, there is no adjustmentfor age 29. but 1/10 of an inch is addedfor age
30)
................................................................................
Use functions for each calculation. Your program should allow the user to repeat 
this calculation as often as the user wishes! That means. functions are invoked within a loop!
..............................................................................................
*/
//******************************************first we write include and/or define directives

#include<stdio.h>
// #include<math.h>	// it is needed if use floor function.
			//******************then we write function prototypes
			
double comp_hatsize(int weight, int height); 				//fn1
double comp_jacketsize(int age, int height, int weight);		//fn2
double comp_waistsize(int age, int weight);				//fn3
			//*****************then we define main function: intmain, variables,functions w/o variable type,return0;
			
int main()
{
printf("**************************************************************\n");

	int height, weight, age,n ,i=1;
	double adjust_jacket, adjust_waist;
	double finaljacket;
	
	printf("How many times you want to repeat this calculation?\t");
	scanf (" %d", &n);
	
	for ( i=1; i<=n; i++)					// if i=0, n=2 repeats 3 times.
	{	
								//eg. h=1,w=1,a=29/40; hat=2.9;jk=0.003/0.128; wst= .175/.775
	printf("Enter the height in inches (integer)\t");	//eg. h=1,w=288,a=29/40, hat=835.2, jk=1/1.125, wst=50.526/51.126
	scanf ("%d", &height);
	printf("Enter the weight in pounds (integer)\t");
	scanf ("%d", &weight);
	printf("Enter the age in years (integer)\t");
	scanf ("%d", &age);
	printf("\n");
	
	
	comp_hatsize(weight, height);
	comp_jacketsize(age,height, weight);
	comp_waistsize(age,weight);
	}
	
	
printf("**************************************************************\n");
return 0;
}
//*************************************************now we write fn1 (no semicolon) pre: weight,height post: hatsize.
double comp_hatsize(int weight, int height)
{
	double hatsize;
	
	hatsize = (weight/height) * 2.9;
	
	printf("The Hat Size = %.2f inches\n", hatsize);
	
return (hatsize);
}
//*************************************************now we write fn2 (no semicolon) pre: age post: adjust_jacket.

double comp_jacketsize(int age, int height, int weight)
{

	double adjust_jacket,jacketsize;

	if (age>=40)							// if age>40, this will be executed.
	{
	adjust_jacket = ((1.0/8.0) * ((age - 30) /10));		// we may also use (((floor(age/10)*10) - 30) /80.0);
	
	printf("The adjustment for jackect is = %.3f inches\n", adjust_jacket);
	}

	else 								//if age<= 39, this will be executed.
	{
	adjust_jacket = 0; 
	printf("The adjustment for jacket is = %.3f inches\n", adjust_jacket); 
	}

	jacketsize= height*weight/288.0 + adjust_jacket; 
	printf("The jacket size without adjustment is = %.3f inches\n", ((height*weight)/288.0) );
	printf("The jacket size = %.3f inches \n", jacketsize);
return (jacketsize);
}

//*************************************************now we write fn3 (no semicolon) pre: age post: adjust_jacket.
double comp_waistsize(int age, int weight)
{
	double adjust_waist, waistsize;

	if (age>=30)
	{
										// no correction for 28,29 but 1/10 correction for 30;
	adjust_waist = (1.0/10.0)* ((age- 28) /2);		// we may also use (((floor(age/2)*2) - 28) /20.0);


	printf("The adjustment for waist is = %.3f inches\n", adjust_waist);
	}

	else 
	{
	adjust_waist = 0; 
	printf("The adjustment for waist is = %.3f inches\n", adjust_waist); 
	}
	
	waistsize = weight/5.7 + adjust_waist;
	
	printf("The waist size without adjustment is = %.3f inches\n", (weight/5.7) );
	printf("The waist size = %.3f inches\n\n", waistsize);

return (waistsize);
}
//***********************************************************the end.
