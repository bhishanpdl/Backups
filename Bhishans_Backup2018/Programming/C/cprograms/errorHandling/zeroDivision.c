//topic: Divide by zero errors
//source: http://www.tutorialspoint.com/cprogramming/c_error_handling.htm
//terminal: clear;gcc a.c;./a.out

#include <stdio.h>
#include <stdlib.h>

int main(){ 
printf("\n"); 


   int dividend = 20;
   int divisor  = 0;
   int quotient;
 
   if( divisor == 0){
      fprintf(stderr, "Division by zero! Exiting...\n");
      exit(-1);  // we can also write exit(EXIT_FAILURE); it's defined in stdlib
   } // it this is absent we get: Floating point exception (core dumped)
   quotient = dividend / divisor;
   fprintf(stderr, "Value of quotient : %d\n", quotient );

   exit(0); // aliter: exit(EXIT_SUCCESS);
   
   printf("\n");
   return 0;
}
