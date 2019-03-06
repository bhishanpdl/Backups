//program to search a number from input of numbers

#include <stdio.h>
#include"searchfn.h"

int linear_search(double a[], int n, double find) 	// eg. a[] = {1.1,2.2,3.2,4.4}
{							                        // a[0]=1.1, a[1]=2.2, a[2]=3.3, a[3]=4.4
   int c;

   for (c = 0 ;c < n ; c++ ) {
      if (a[c] == find)		// when it returns c, a[c] is the first argument and is equal to third arument find.
         return c;		    // then, in function call, numbers=search happens.
   }				        // here, instead of returning array a[c] we are only returning integer c.


return -1;
}
