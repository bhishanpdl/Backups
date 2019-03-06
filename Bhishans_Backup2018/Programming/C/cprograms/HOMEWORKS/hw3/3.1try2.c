/* Author: Bhishan Poudel
   Question: hw 3.1

develop a program that asks for the user's  height, weight and age (integer). 
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
#include<math.h>
			//******************then we write function prototypes
			
double comp_hatsize(int weight, int height); 	//fn1
double comp_adjust_jacket(int age);		//fn2
double comp_adjust_waist(int age);		//fn3
double comp_jacketsize(int height, int weight, double adjust_jacket);	//fn4
double comp_waistsize(int weight, double adjust_waist);		//fn5
			//*****************then we define main function: intmain, variables,functions w/o variable type,return0;
			
int main()
{
printf("**************************************************************\n");

	int height, weight, age;
	double adjust_jacket, adjust_waist;
	double finaljacket;
								//eg. h=1,w=1,a=29/40; hat=2.9;jk=0.003/0.128; wst= .175/.775
	printf("Enter the height in inches (integer)\t");	//eg. h=1,w=288,a=29/40, hat=835.2, jk=1/1.125, wst=50.526/51.136
	scanf ("%d", &height);
	printf("Enter the weight in pounds (integer)\t");
	scanf ("%d", &weight);
	printf("Enter the age in years (integer)\t");
	scanf ("%d", &age);
	printf("\n");
	
	
	comp_hatsize(weight, height);
	comp_adjust_jacket(age);
	comp_adjust_waist(age);
	comp_jacketsize(height, weight, adjust_jacket);
	comp_waistsize(weight, adjust_waist);
	
	finaljacket = height*weight/288 + adjust_jacket;
	
	printf("jacketsize = %.2f\n", finaljacket);
	
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

double comp_adjust_jacket(int age)
{

	double adjust_jacket;

	if (age>=40)
	{
	adjust_jacket = (((floor(age/10)*10) - 30) /80.0);
	
	printf("adjustment for jackect is = %.3f\n", adjust_jacket);
	}

	else 
	{
	adjust_jacket = 0; 
	printf("adjustment for jacket is = %.3f\n", adjust_jacket); 
	}


return (adjust_jacket);
}

//*************************************************now we write fn3 (no semicolon) pre: age post: adjust_jacket.
double comp_adjust_waist(int age)
{
	double adjust_waist;

	if (age>=30)
	{

	adjust_waist = (((floor(age/2)*2) - 28) /20.0);


	printf("adjustment for waist is = %.3f\n", adjust_waist);
	}

	else 
	{
	adjust_waist = 0; 
	printf("adjustment for waist is = %.3f\n", adjust_waist); 
	}


return (adjust_waist);
}
//**************************************************now we write fn4 (no semicolon) pre: height,weight post: jacketsize.
double comp_jacketsize(int height, int weight, double adjust_jacket)
{
	double jacketsize;
	
	jacketsize = (height * weight / 288) + adjust_jacket;
	
	printf("The jacket size is %.3f inches\n", jacketsize);
	
return (jacketsize);
}
//**************************************************now we write fn5 (no semicolon) pre: weight,adjust_waist post: waistsize.
double comp_waistsize(int weight, double adjust_waist)
{
	double waistsize;
	
	waistsize = (weight/5.7) + adjust_waist;
	
	printf("The waist size is %.3f inches\n", waistsize);
	
return (waistsize);
}
//**************************************************the end.
