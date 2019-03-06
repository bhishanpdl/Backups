//author : bhishan poudel
//program: return an array using pointer

#include <stdio.h>

/* function to generate and return random numbers */
char * myfunction( )
{
  static char  array[5] = {'a','b','c','d','e'};	//point to remember is that C does not advocate to return the address of a local 
  			//variable to outside of the function so you would have to define the local variable as static variable.
  return array;
}

/* main function to call above defined function */
int main ()
{
   /* a pointer to an int */
   char *ptr;
   int i;
   char  array2[5];

   ptr = myfunction();
   printf("\nthe third array member is = %c\n\n", *(ptr+2));
   for ( i = 0; i < 5; i++ ){
   	
   	printf( "array member %d : %c\n", i+1, *(ptr + i));
       	array2[i]=  *(ptr+i);
   }
printf("\narray2[1] = %c\n", array2[1]);

printf("\n");
   return 0;
}
