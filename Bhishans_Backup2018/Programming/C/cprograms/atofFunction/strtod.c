//topic: C library function - atof()   array to float
//source: http://www.tutorialspoint.com/c_standard_library/c_function_atof.htm
//      : http://www.codingunit.com/c-reference-stdlib-h-function-strtod
//filepath: cd /Users/poudel/Copy/Programming/C/cprograms/atof
//filepath: cd /home/bhishan/Copy/Programming/C/cprograms/atof/
//terminal: clear; gcc strtod.c; ./a.out


// The C library function double atof(const char *str) converts the string
// argument str to a floating-point number (type double).


//similar, atoi , atol, strtod, strtol etc.

#include <stdio.h>
#include <stdlib.h> // for atof
#include <string.h> // for strcpy

int main()
{

   char str[30] = " 20.30300 This is test 5.0 ";
//   char str[30] = "This is test 5.0 ";
//   char str[30] = " 100 5.0 ";


   char 	*ptr;
   double 	x;

   x = strtod(str, &ptr);
   printf("The double x =  %lf\n", x);
   printf("String part  = %s \n", ptr);
   
   
   
   // example 2
   		char str2[] = "10.0 5.0 2 hello";
		char *ptr2;
		double a, b,c;

		a = strtod (str2,&ptr2);
		b = strtod (ptr2,NULL);
		//c = strtod (ptr2,NULL,NULL); // too many arguments
		//c = strtod (b,NULL); // this doesnot works
		
		printf("\n\nThe value of a = %.2lf", a); // 10.00
		printf("\nThe value of b = %.2lf", b);   // 5.00
		//printf("\nThe value of c = %.2lf", c); // it cannot be found, we should use strtok
		printf ("\na/b equals    = %.2lf\n", a/b);//2.00
		printf("String part  = %s \n", ptr2);



   return(0);
}

// double strtod(const char *str, char **endptr)

/*
The C library function double strtod(const char *str, char **endptr) converts the string pointed to by the argument str to a floating-point number (type double). If endptr is not NULL, a pointer to the character after the last character used in the conversion is stored in the location referenced by endptr.
Declaration

Following is the declaration for strtod() function.

double strtod(const char *str, char **endptr)

Parameters

    str -- This is the value to be converted to a string.

    endptr -- This is the reference to an already allocated object of type char*, whose value is set by the function to the next character in str after the numerical value.

Return Value

This function returns the converted floating point number as a double value, else zero value (0.0) is returned.
*/
