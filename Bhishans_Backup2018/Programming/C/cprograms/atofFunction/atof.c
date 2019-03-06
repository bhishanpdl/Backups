//topic: C library function - atof()   array to float
//source: http://www.tutorialspoint.com/c_standard_library/c_function_atof.htm
//filepath: cd /Users/poudel/Copy/Programming/C/cprograms/atof
//terminal: clear; gcc atof.c; ./a.out


// The C library function double atof(const char *str) converts the string
// argument str to a floating-point number (type double).
// function declaration:
// double atof(const char *str)


//similar, atoi , atol, strtod, strtol etc.

#include <stdio.h>
#include <stdlib.h> // for atof  
#include <string.h> // for strcpy

int main()
{
   float    value;
   char     str[20];
   
   strcpy(str, "98993489");
   value = atof(str); // mnemonic: array to float , but meaning is: string to double
   printf("String value = %s, Float value = %.2f\n", str, value);
   // String value = 98993489, Float value = 98993488.00

   strcpy(str, "tutorialspoint.com");
   value = atof(str);
   printf("String value = %s, Float value = %.2f\n", str, value);
   //String value = tutorialspoint.com, Float value = 0.00
   
   
    //example 3
    char str1[]   ="abcd";     
    char str2[5]  ="100";

   return(0);
}


