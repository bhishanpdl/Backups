/* Author: Bhishan Poudel
   Question: hw 3.6
Write a computer program that computes the duration of a projectile‘s flight
and its height above the ground when it reaches the target.
 
As part of your solution. write and call a function that displays instructions to the program user.*/
//***************************************************************************************************************************************** 

#include<stdio.h>
#include<math.h>
#define g 32.17 	// acceleration due to gravity

			// now we define function prototypes i.e., we make function calls
void instructions(void);
double comp_time(double distance, double velocity, double theta);
double comp_height(double velocity, double theta, double time);

			
//*****************************************************************************************************************************************
// now we define main function which includes all variables, all functions, formulas, and return 0; }

int main()
{
printf("***********************************************************\n");
	double distance; 	// input - distance (\ft) to target
	double velocity;	// input - projectile velocity (ft/sec)
	double degree,theta;	// input - angle (radians) of elevation

	double time; 		// output - time (sec) of flight
	double height; 		// output - height at impact
	
	
	instructions();    	// first we call the function1
				// then we enter inputs
	printf("***********************************************************\n");
	printf("Enter the value of distance in feet=\t");
	scanf ("%lf", &distance);
	printf("Enter the value of velocity in feet per sec=\t");
	scanf ("%lf", &velocity);
	printf("Enter the value of angle in degree=\t");
	scanf ("%lf", &degree);					//**********these are inputs in main function
	
	theta = degree * 3.1416/180.0;				// degree to radian conversion
	time= comp_time(distance, velocity, theta);		//********** this will display time.
	
	comp_height(velocity,theta,time);
	
printf("***********************************************************\n");
return 0;
}
//*****************************************************************************************************************************************
// after main fucntion we write the fucntions

void instructions () 
{
						
		printf("This program computes the duration of a ");
		printf("projectiles flight \nand its height above the ground ");
		printf("when it reaches the target\n");
		printf("we shall input distance in feet\n");
		printf("velocity in feet per sec\n");
		printf("angle in degree\n");
		printf("degree to radian conversion is:\n"); 
		printf("180 degrees = PI radian\n");
		printf("degree = PI /180 radian\n");
		
}
//****************************************************************************************************************************************
double comp_time(double distance, double velocity, double theta)
{
	double time;
	
	time = distance/(velocity*cos(theta));
	
	printf("The time of flight is %.2fs \n", time);
	
	return (time);
}
//************************************************************************* 
double comp_height(double velocity, double theta, double time)
{

	double height;
	
	height = velocity * sin(theta)*time - (g/2.0) *time*time;
	
	printf("The height of the flight is %.2f m\n", height);
	
return (height);
}
//**************************************************************************

