//topic : C library function - sprintf()
//ref   : http://www.tutorialspoint.com/c_standard_library/c_function_sprintf.htm
// syntax: int sprintf(char *str, const char *format, ...)

// Format tags prototype: %[flags][width][.precision][length]specifier
// flags      = - + (space) # 0
// width      = (number) *
// .precision = .number  .*
// length     = h l L

//cmd    : clear; gcc sprintf1.c && ./a.out

#include <stdio.h>
#include <math.h>

int main()
{
   char str[80];

   sprintf(str, "Value of Pi = %f", M_PI);
   puts(str);
   
   return(0);
}
