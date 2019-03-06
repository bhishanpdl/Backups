/* homework 2.3 project #2 in textbook page 231

Write a program that calculates the user’s body mass index (BMI) and catego-
rizes it as underweight, normal, overweight, or obese, based on the following
table from the United States Centers for Disease Control:

BMI 		Weight Status

Below 18.5 	Underweight
18.5–24.9 	Normal
25.0–29.9 	Overweight
30.0 and above 	Obese

To calculate BMI based on weight in pounds ( wt_lb ) and height in inches ( ht_in ), 
use this formula (rounded to tenths):

				    BMI = (703 * wt_lb) / (ht_in*ht_in)

Prompt the user to enter weight in pounds and height in inches.
*/

#include <stdio.h>
#include <math.h>

int main ()
{
	float ht_in,wt_lb;
	float BMI1,BMI;
	
	printf("Enter the value of your weight in pounds\n");
	scanf ("%f",&wt_lb);
	printf("Enter the value of your height in inches\n");
	scanf ("%f",&ht_in);
	
	BMI1 = (703 * wt_lb) / (ht_in * ht_in) ;	
	BMI  = roundf (BMI1 * 10)/10;					// roundf (1.23456 * 10)/10   = 1.200000 (rounded bmi)
									// roundf (1.23456 * 100)/100 = 1.230000
	
	
	printf("The value of your BMI is %f\n",BMI1);
	printf("Rounded value of  BMI is %f\n",BMI);
	printf("Rounded value of  BMI is %.1f\n",BMI);
	
	if (BMI <= 18.5)
		printf("Your weight status is: underweight\n");
	else if (BMI > 18.5 && BMI <= 24.9)
		printf("Your weight staus is: Normal\n");
	else if (BMI >= 25.0 && BMI <= 29.9 )
		printf("Your weight status is: Overweight\n");
	else
		printf("Your weight status is: Obese\n");
		
return 0;
}
	
