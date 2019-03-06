// Fibonaci sequence...........
// Recursive function.......

#include <stdio.h>

int fibonaci(int i)
{
/*   if(i == 0)
   {
      return 0;
   }
*/
   if(i <= 1)
   {
      return 1;
   }
   return fibonaci(i-1) + fibonaci(i-2);
}

int  main()
{
    int i, n;

    printf("How many terms? ");
    scanf("%d", &n);

    printf("\nFibonacci sequence is: \n\n");
    for (i = 0; i < n; i++)
    {
       printf("%d\t%n", fibonaci(i));
    }

    printf("\n\n");
    getch();
    return 0;
}

