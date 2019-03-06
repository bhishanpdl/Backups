//topic : C library function - sprintf()
//ref   : http://www.rohitab.com/discuss/topic/11505-sprintf-tutorial-in-c/
//syntax: int sprintf(char *str, const char *format, ...) // ... are argv1, argv2 etc

// Format tags prototype: %[flags][width][.precision][length]specifier
// flags      = - + (space) # 0
// width      = (number) *
// .precision = .number  .*
// length     = h l L

//cmd    : clear; gcc sprintf3.c && ./a.out


#include <stdio.h>
// ^ must include to use sprintf()
// we will start with a simple integer ex.
int main()
{
   char buff[50];
   int ret, a = 34, b = 234;
   
   ret = sprintf(buff, "%d minus %d equals %d",a,b,a-b);
   
   printf ("(%s) is the result of our sprintf, which is %d characters long\n",buff,ret);
   
   
   return 0;
}

/*
output:
(34 minus 234 equals -200) is the result of our sprintf, which is 24 characters long

*/
