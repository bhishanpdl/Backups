#include <stdio.h>
#include <stdlib.h>
#include<string.h>

// source: http://beej.us/guide/bgc/output/html/multipage/scanf.html

/*
The scanf() family of functions reads data from the console or from a FILE stream, parses it, 
and stores the results away in variables you provide in the argument list.
*/

int main()
{
   	int             a;
	long int        b;
	unsigned int    c;
	float           d;
	double          e;
	long double     f;
	char            s[100];
	
	
/*	printf("\nEnter an integer > ");*/
/*	scanf("%d", &a);  // store an int*/
/*	printf("you entered %d", a);*/
/*	*/
/*	printf("\nenter some spaces and an integer >  ");*/
/*	scanf(" %d", &a); // eat any whitespace, then store an int*/
/*	printf("\nyou entered %d", a);*/
/*	*/
/*	printf("\nenter a string >  ");*/
/*	scanf("%s", s); // store a string*/
/*	printf("\nyou entered %s", s);*/
/*	*/
/*	printf("\nenter a long double>  ");*/
/*	scanf("%Lf", &f); // store a long double*/
/*	printf("\nyou entered %Lf", f);*/

/*	// store an unsigned, read all whitespace, then store a long int:*/
/*	printf("\nenter unsigned and long integers>   ");*/
/*	scanf("%u %ld", &c, &b);*/
/*	printf("\nentered values are: %u %ld", c, b);*/

	// store an int, read whitespace, read "blendo", read whitespace,
	// and store a float:
	printf("\nenter an int,a whitespace,blendo ,a whitespace, and a float>  ");  // type blendo means mixture
	scanf("%d blendo %f", &a, &d);
	printf("\nyour values are %d %f", a, d);

	// read all whitespace, then store all characters up to a newline
	printf("\nenter some space string and space and string>   ");
	scanf(" %[^\n]", s);
	printf("\nyour string is: %s", s);
	printf("this reads all whitespace, then store all characters up to a newline");

	// store a float, read (and ignore) an int, then store a double:
	printf("\nenter a float, integer and a double>  ");
	scanf("%f %*d %lf", &d, &e);
	printf("\nfloat and double are: %f, %lf", d, e );

	// store 10 characters:
	printf("\nenter a string upto length 10>   ");
	scanf("%10c", s);
	printf("\nyour string is : %s", s);
    
   return(0);
}

/*keywords in C
=====================
auto        break       case    char    const
continue    default     double  else    enum    extern
float       for         goto    if      int     long
register    return      short   signed  sizeof static
struct      switch      typedef
union       unsigned    void    volatile while 

Here are some of the percent-codes you can put in the format string:
====================================================================

%d
%f (%e, %E, and %g are equivalent)
%s

And here are some more codes, except these don't tend to be used as often.
You, of course, may use them as often as you wish!

%u
%x (%X is equivalent)
%o
%i
%c
%p
%n
%s nearly equivalent to [ \t\n]
%%
%[  eg. %[^\n] except newline

Well, like in printf(), you can add a modifier before the type
specifier to tell scanf() that you have a longer or shorter type.
The following is a table of the possible modifiers:

h
l
L
*  // format supression eg. %[^\n]*%c  will supress newline

*/
