#include <stdio.h>
#include <string.h>

int main ()
{
   char str1[12] = "Hello";
   char str2[12] = "World";
   char str3[12];
   int  len ;

   /* copy str1 into str3 */
   strcpy(str3, str1);
   printf("strcpy( str3, str1) :  %s\n", str3 );  // str3 becomes Hello

   /* concatenates str1 and str2 */
   strcat( str1, str2);					// str1 becomes HelloWorld
   printf("strcat( str1, str2):   %s\n", str1 );
   printf("strcat( str1, str2):   %s\n", strcat( str1, str2) );
   

   /* total lenghth of str1 after concatenation */
   len = strlen(str1);
   printf("strlen(str1) :  %d\n", len );
   printf("|%5d|%-5d|%+5d|%+-5d|% 5d|%05d|%5.0d|%5.2d|%d|\n", len, len, len, len, len, len, len, len, len);
   printf("strlen(str1) :  %zu\n", strlen(str1) );	// type %zu is required for argument type size_t
   return 0;
}
