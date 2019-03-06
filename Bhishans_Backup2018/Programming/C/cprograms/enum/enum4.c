//topic  : simple enum program
//terminal: clear; gcc enum4.c && ./a.out

#include<stdio.h>

typedef enum {A,B,C} Tag1;  // always use all capital letters
Tag1 var1= A;
Tag1 var2= B;

typedef enum {RANDOM, IMMEDIATE, SEARCH} strategy;
strategy my_strategy = IMMEDIATE;

//Having a naming convention to distinguish between 
//types and variables is a good idea:


int main()
{
  printf("%d\n",B);
  printf("%d\n",var1);
  printf("%d\n",var1 + 5);
  
  int a;
  
  a = my_strategy;
  
    printf("a = %d\n", a);
  
  
  return 0;
}
