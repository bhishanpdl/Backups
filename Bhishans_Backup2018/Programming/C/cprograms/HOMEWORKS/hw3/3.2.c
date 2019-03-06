/* Author: Bhishan Poudel
   Question: hw 3.2
   
Develop a C program that lets the user to choose one geometric object of his or her
choice and then initiates appropriate user interactions, computes and displays the Volume
and Surface Area as the output.

formulas :
right circular cone, volume v1 = (1.0/3.0)*PI*r*r*h;
right circular cone, area   a1 = PI*r*r + PI*r*s;
slant height                s = sqrt(r*r+h*h);

right circular cylinder
volume v2 = PI*r*r*h;
area   a2 = 2*PI*r*(r+h); */ 

//***************************************************** first include and define directives.

//*****************************************************first we write include and header files

#include<stdio.h>
#include<math.h>
#define PI 3.1416

			//************* then we write function prototypes
void instructions(void);
double comp_volume_cylinder(double radius, double height);
double comp_area_cylinder(double radius, double height);
double comp_volume_cone(double radius, double height);
double comp_area_cone(double radius, double height);

			// ************then we define main fucntion: intmain,variables,fucntions,return0;
int main()
{

	double radius, height;
	char   choice;
	
	printf("**********************************************************************\n");
	instructions();
	
	printf("For cylinder press y, or for cone press n\t");
	scanf (" %c", &choice);
	
	if (!(choice == 'y' || choice =='Y' || choice == 'n' || choice =='N'))
	{
		printf("Please enter y for cylinder or n for cone\n");
	}
	else 
	{ 
		printf("Enter the radius in cm\t");
		scanf (" %lf", &radius);
		printf("Enter the height in cm\t");
		scanf (" %lf", &height);
	
	
		if(choice == 'y' || choice =='Y')
		{
		comp_volume_cylinder(radius, height);
		comp_area_cylinder(radius, height);
		}
		else if (choice == 'n' || choice =='N')
		{
		comp_volume_cone(radius, height);
		comp_area_cone(radius, height);
		}
	}
	printf("**********************************************************************\n");
return 0;
}
//**************************************** now we write fn1, instructions has no return value;
void instructions(void)
{
	printf("This program calculates the volume and total surface area of the \n");
	printf("right circular cylinder or cone of your choice.\n");
}
//****************************************now we write fn2: pre: radius,height post: volume
double comp_volume_cylinder(double radius, double height)
{
	double volume_cylinder;
	
	volume_cylinder = PI *radius* radius* height;
	
 	printf("The volume of the right circular cylinder is =%.2f cm^3\n", volume_cylinder);
 return (volume_cylinder);
}
//****************************************now we write fn3: pre: radius,height post: area
double comp_area_cylinder(double radius, double height)
{
	double area_cylinder;
	
	area_cylinder = (2*PI*radius*radius) + (2*PI*radius*height);
	
	printf("The total surface area of the right circular cylinder is =%.2f cm^2\n", area_cylinder);	
return (area_cylinder);
}
		 
//****************************************now we write fn4: pre: radius,height post: cone_volume
double comp_volume_cone(double radius, double height)
{
	double volume_cone;
	
	volume_cone =(1.0/3.0) * ( PI *radius* radius* height);
	
 	printf("The volume of the cone is =%.2f cm^3\n", volume_cone);
 return (volume_cone);
}
//****************************************now we write fn5: pre: radius,height post: area_cone
double comp_area_cone(double radius, double height)
{
	double area_cone;
	double slant_height;
	
	slant_height = sqrt(radius*radius+height*height);
	area_cone = (PI*radius*radius) + (PI*radius*slant_height);
	
	printf("The total surface area of the cone is =%.2f cm^2\n", area_cone);	
return (area_cone);
}
//*****************************************

