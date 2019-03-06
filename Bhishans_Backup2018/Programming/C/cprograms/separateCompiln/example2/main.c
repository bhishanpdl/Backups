#include "stdio.h"          /* To use the functions defined in Functions.c I need to #include Functions.h */
#include<stdio.h>
#include<math.h>
#include "function1.h"      //this works also for functions.h
#include "function2.h"


int main(){
    double a, b;
    double fn1,fn2;

    printf("Insert two numbers\n");
    scanf("%lf %lf", &a, &b);


    fn1     = function1(a,b);
    fn2     = function2(a,b);

    printf("\nThe output is 3a^2+b+5\n");
    printf("The output is %.2f\n\n", fn1);

    printf("\nPI = 3.0\n");
    printf("The volume of cylinder is PI *r *r *h \n");
    printf("The volume of cylinder is %.2f\n\n", fn2);

return 0;
}
