//topic : C library function - sprintf()
//ref   : http://www.rohitab.com/discuss/topic/11505-sprintf-tutorial-in-c/
//syntax: int sprintf(char *str, const char *format, ...) // ... are argv1, argv2 etc

// Format tags prototype: %[flags][width][.precision][length]specifier
// flags      = - + (space) # 0
// width      = (number) *
// .precision = .number  .*
// length     = h l L

//cmd    : clear; gcc sprintf2.c && ./a.out

#include <stdio.h>

int main()
{
   char buff[50], string[100];
   int ret;
   
   printf("What is your favorite color??\n");
   scanf("%s",&string);
   
   ret = sprintf(buff, "your favorite is %s!! Mine is too\n",string);
   printf("%s",buff);
   
   //note: You dont need the return values. (ret in all the examples, 
   //they are just to see how long the strings are)

   
   
   return 0;
}
