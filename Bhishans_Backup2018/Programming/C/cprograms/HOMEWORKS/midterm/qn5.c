// qn 5.c Bhishan Poudel CS 5900 Midterm

#include<stdio.h>
#define PI 3.1416

int main()
{
	double r,h,v1,v2,v;
	
	printf("enter the radius\n");
	scanf ("%lf", &r);
	
	printf("enter the height\n");
	scanf ("%lf", &h);
	
	v1= PI*r*r*h;
	v2=(4.0/3.0)*PI*r*r*r;
	v=v1+v2;
	
	printf("The volume of cylinder is %.2f \n", v1);
	printf("The volume of sphere is %.2f \n", v2);
	printf("The total volume is %.2f \n", v);
	


return 0;
}
