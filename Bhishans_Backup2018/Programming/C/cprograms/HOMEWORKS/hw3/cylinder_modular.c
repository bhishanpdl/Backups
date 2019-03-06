/* Author: Bhishan Poudel
   Question: hw 3.4
You are asked to develop a modular c program to compute the volume 
as well as total surface area of a right circular cylinder. */

//*****************************************************first we write include and header files

#include<stdio.h>
#define PI 3.1416

			//************* then we write function prototypes
void instructions(void);
double comp_volume(double radius, double height);
double comp_area(double radius, double height);

			// ************then we define main fucntion: intmain,variables,fucntions,return0;
int main()
{

	double radius, height;
	
	printf("**********************************************************************\n");
	instructions();
	
	printf("Enter the radius in cm\t");
	scanf (" %lf", &radius);
	printf("Enter the height in cm\t");
	scanf (" %lf", &height);
	
	comp_volume(radius, height);
	comp_area(radius, height);
	printf("**********************************************************************\n");
return 0;
}
//**************************************** now we write fn1, instructions has no return value;
void instructions(void)
{
	printf("This program calculates the volume and total surface area of the \n");
	printf("right circular cylinder.\n");
}
//****************************************now we write fn2: pre: radius,height post: volume
double comp_volume(double radius, double height)
{
	double volume;
	
	volume = PI *radius* radius* height;
	
 	printf("The volume of the right circular cylinder is =%.2f cm^3\n", volume);
 return (volume);
}
//****************************************now we write fn3: pre: radius,height post: area
double comp_area(double radius, double height)
{
	double area;
	
	area = (2*PI*radius*radius) + (2*PI*radius*height);
	
	printf("The total surface area of the right circular cylinder is =%.2f cm^2\n", area);	
return (area);
}
//******************************************



