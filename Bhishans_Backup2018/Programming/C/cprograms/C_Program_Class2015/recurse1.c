// Factorial value.......
// Recursion demo..........

#include <stdio.h>
#include <conio.h>

int factorial( int i)
{
   if(i <= 1)
   {
      return 1;
   }
   return i * factorial(i - 1);
}
int  main()
{
    int num;

    printf("Enter a value for N: ");
    scanf("%d", &num);

    printf("Factorial of %d is %d\n", num, factorial(num));
    getch();
    return 0;
}
