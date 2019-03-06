#include<stdio.h>

void Calculate(int x, int y, int* prod, int* quot);

int main (){


int x = 10,y = 2, prod, quot;

Calculate(x, y, &prod, &quot);
printf("the product of x and y is = %d\n", &prod);


return 0;
}
// function calculate
void Calculate(int x, int y, int* prod, int* quot)
{
    *prod = x*y;
    *quot = x/y;
}
