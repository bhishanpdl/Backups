/*
 * A C Version showing how to iterate an array, converting character case
 */

#include <stdio.h> 
#include <ctype.h> 

int main(void)
{
   char hello[] = "Hello World";		// storing in an array
   char *p;					// pointer *p for this array.
   
   printf ("Before conversion: %s\n", hello);

   for (p = hello; *p != '\0'; ++p)		// reading each element of array using pointer
   {
       *p = tolower(*p);
   }

   printf ("After conversion: %s\n", hello);

   return 0;   
}
/*
   Output:
   Before conversion: Hello World
   After conversion: hello world
*/
