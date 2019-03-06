/* Author: Bhishan Poudel
   Question: hw 3.3
Develop a modular C program that computes and display the area of the sidewalk.
I have a rectangular lawn garden as shown below. This summer I want to have a 3 feet wide gravel walkway
around the yard to jog with my dogs and cats.
Pompute the area of the walkway i need, around my lawn and garden. 
Program should work fro any length or width.
*/

/* inputs: length, width
   output: area of sidewalk 
   area = (l+6)*(w+6) - (l*w);
   
*/
//******************************** first we write include and define functions.

#include<stdio.h>

				// then we write fucntion prototypes.
void instructions(void);	// fn1				
double comp_area( double length, double width);		// fn2, inputs are length and width, output is area.

				// then we write main functon: variables,inputs,prototypes and return 0;
int main()
{
	double length, width;
	printf("******************************************************************************\n");
	instructions ();		// inside main fuction we do not write double,int etc for a fucntion
	printf("******************************************************************************\n");
	printf("please enter the length of inner garden in feet\t");
	scanf (" %lf", &length);
	printf("please enter the width of inner garden in feet\t");
	scanf (" %lf", &width);


comp_area(length, width);
printf("**************************************************************************\n");
return 0;
}
//***************************************************************
void instructions(void)	// now we write fn1
{
	printf("This program computes and display the area of the sidewalk around a rectangular garden.\n");
	printf("The width of the side walk is 3 feet and we can alter length and width of the garden.\n");
			// for instructins we dont have to write return.
	
}
//*************************************************************** now we write fn2

double comp_area( double length, double width)
{
	double area;
	area = (length+6)*(width+6) - (length*width);
	printf("The area of the sidewalk is = %.2f sq.feet\n", area);
return (area);
}
//****************************************************************
	
 
