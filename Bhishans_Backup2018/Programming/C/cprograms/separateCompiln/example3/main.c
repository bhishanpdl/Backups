#include"stdio.h"          /* To use the functions defined in Functions.c I need to #include Functions.h */
#include<stdio.h>
#include<math.h>
#include"function1.h"      //this works also for functions.h
#include"function2.h"
#include"searchfn.h"

/*
int main()
{
	int n,c=0;
	double numbers[100];
	double search;
	int position;   //function will return the position of the search


 //storing input numbers in an array called numbers
   printf("How many numbers you want to enter?\n");
   scanf("%d", &n);

   printf("Enter %d numbers\n", n);

   for (c = 0; c < n; c++)
      scanf("%lf", &numbers[c]);

 //searching the number.

   printf("Input number to search\n");
   scanf("%lf",&search);

   position = linear_search(numbers, n, search); // invoking the function call

   if (position == -1)
      printf("%lf is not present in array.\n", search);
   else
      printf("%lf is present at location %d.\n", search, position+1);

   return 0;
}
*/

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


    int n,c=0;
	double numbers[100];
	double search;
	int position;   //function will return the position of the search


 //storing input numbers in an array called numbers
   printf("How many numbers you want to enter?\n");
   scanf("%d", &n);

   printf("Enter %d numbers, eg. 3.2\n", n);

   for (c = 0; c < n; c++)
      scanf("%lf", &numbers[c]);

 //searching the number.

   printf("Enter the  number to search \n");
   scanf("%lf",&search);

   position = linear_search(numbers, n, search); // invoking the function call

   if (position == -1)
      printf("%.2f is not present in the list.\n", search);
   else
      printf("%.2f is present at location %d.\n", search, position+1);

return 0;
}
