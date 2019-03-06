//Geometric object - RC Cylinder
//Summer 2015 - for CS5900
//Modular : call-by-value method

#include <stdio.h>
#include <math.h>

double volume(int r, int h);
double sarea(int r, int h);

const double PI = 3.1416;
    
int main()
{
    int r;
    double h, vol, sa;
    
       printf("Enter the cylinder radius: ");
       scanf("%d", &r);
       
       printf("Enter the cylinder height: ");
       scanf("%lf", &h);
       
              vol = volume(r,h);             //call-by-value
              sa =  sarea(r,h);
              
       printf("\nRC Cylinder with %d inch radius has \n", r);
       printf("Volume = %.2f cubic inches & Surface Area = %.2f sq. inches \n", vol, sa);
       
       getch();
       return 0;
}
       
double volume(int r, int h)
{
    return (PI * h * pow(r,2));
}

double sarea(int r, int h)
{
   double sar;
      
       sar = (2 * PI * r * r) + (2 * PI * r * h);
       return sar;
}       
       
