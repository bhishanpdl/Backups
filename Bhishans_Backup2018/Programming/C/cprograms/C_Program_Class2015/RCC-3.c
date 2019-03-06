//Geometric object - RC Cylinder
//Summer 2015 - for CS5900
//Modular : call-by-reference method

#include <stdio.h>
#include <math.h>

void Compute(int r, int h, double *vol, double *sa);

const double PI = 3.1416;
    
int main()
{
    int r;
    double h, vol, sa;
    
       printf("Enter the cylinder radius: ");
       scanf("%d", &r);
       
       printf("Enter the cylinder height: ");
       scanf("%lf", &h);
       
             Compute(r, h, &vol, &sa);             //call-by-ref
             
              
       printf("\nRC Cylinder with %d inch radius has \n", r);
       printf("Volume = %.2f cubic inches & Surface Area = %.2f sq. inches \n", vol, sa);
       
       getch();
       return 0;
}
       
void Compute(int r, int h, double *vol, double *sa)
{
    double v, s;
    
    v = (PI * h * pow(r,2));
    s = (2 * PI * r * r) + (2 * PI * r * h);
    
           *vol = v;
           *sa = s;    
}

