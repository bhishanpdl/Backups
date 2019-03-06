//Binary search.......
//works only for sorted arrays....
//Summer 2015

#include <stdio.h>

int main()
{
   int c, first, last, middle, n, search, array[100];

   printf("Enter number of elements: ");
   scanf("%d",&n);

   printf("\nEnter %d integers (as sorted values): \n\n", n);

   for (c = 0; c < n; c++)
      scanf("%d",&array[c]);

   printf("\nEnter value to find: ");
   scanf("%d", &search);

 // implementing binary search algorithm.....

   first = 0;
   last = n - 1;
   middle = (first+last)/2;

   while (first <= last) {
      if (array[middle] < search)
         first = middle + 1;
      else if (array[middle] == search) {
         printf("\n%d found at position %d!\n", search, middle+1);
         break;
      }
      else
         last = middle - 1;

      middle = (first + last)/2;
   }
   if (first > last)
      printf("\nNot found! %d is not present in the list!!\n", search);

   getch();
   return 0;
}
