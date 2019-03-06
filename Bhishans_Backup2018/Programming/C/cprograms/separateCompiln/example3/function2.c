/* In general it's good to include also the header of the current .c,
   to avoid repeating the prototypes */
#include "function2.h"
#include<math.h>

double function2(double r, double h){

    const double PI = 3;
    double volume;

        //volume = PI * a * a * b;
        volume = PI * (pow(r,2)) * h;


return volume;
}

/*
double rcc (double r, double h){

    const double PI = 3.1416;
    double volume;


    volume = PI * h * pow(r,2);

return volume;
}
*/
