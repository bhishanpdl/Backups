// qn4.c Bhishan Poudel CS 5900 midterm

#include<stdio.h>
#include<math.h>
#define H 8
#define PI 3.14

int main()
{

	float r,v,s,t;		// r is radius, v is volume, s is surface area.
	float size;
	
	printf("Enter the value of the radius\n");
	scanf ("%f", &r);
	printf("***************************\n");
	
	printf("enter the step size\n");
	scanf ("%f", &size);
	 
	
	t=2*r;
	
	while (r<=t)
	{
	
	 
	v= (1/3.0)*PI*r*r*H;
	s= PI*r*r + PI*r*sqrt(r*r+H*H);
	
	printf("The radius = %.2f  volume = %.2f area= %.2f\n", r, v, s); 
	r=r+size;
	}

return 0;
}
