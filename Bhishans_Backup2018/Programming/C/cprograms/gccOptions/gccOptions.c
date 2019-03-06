//topic   : gcc Options
//ref     : http://cseweb.ucsd.edu/classes/fa09/cse141/tutorial_gcc_gdb.html
//compile : 
//run     : ./gccOptions -O2 3 4
//note    : O2 is optimization
//terminal: clear; gcc -o gccOptions gccOptions.c && ./gccOptions 3 4


#include<stdio.h>
#include<stdlib.h>
#include<string.h>
 
 int main(int argc, char **argv)
{
  int a, b, i;
  float c;
  a = atoi(argv[1]);
  b = atoi(argv[2]);
  c = a/b;
  printf("%d/%d = %f\n",a,b,c);
  
  return 0;
}


