//topic: scope rules
//source: http://www.tutorialspoint.com/cprogramming/c_scope_rules.htm

#include <stdio.h>
 
/* global variable declaration */
int a = 20;
 
int main ()
{
  /* local variable declaration in main function */
  int a = 10; // local variable has precedence over global variable
  int b = 20;
  int c = 0;

  printf ("value of a in main() = %d\n",  a);
  c = sum( a, b);
  printf ("value of c in main() = %d\n",  c);

  return 0;
}

/* function to add two integers */
int sum(int a, int b){  // in the definition of function, a, b are
					    // function paramters or formal parameters.
    printf ("value of a in sum() = %d\n",  a);
    printf ("value of b in sum() = %d\n",  b);

    return a + b;
}
