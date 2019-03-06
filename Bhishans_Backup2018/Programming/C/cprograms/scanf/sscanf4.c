//topic: sscanf
//ref  : https://support.microsoft.com/en-us/kb/38335
//cmd  : clear; gcc sscanf4.c && ./a.out

/* The following sample illustrates the use of brackets and the
   caret (^) with sscanf().
   Compile options needed: none
*/ 

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

char *tokenstring = "first,25.5,second,15";
int result, i;
double fp;
char o[10], f[10], s[10], t[10];

int  main()
{
   result = sscanf(tokenstring, "%[^','],%[^','],%[^','],%s", o, s, t, f);
   fp = atof(s);
   i  = atoi(f);
   printf("o  = %s\n", o);
   printf("fp = %lf\n", fp);
   printf("t  = %s\n", t);
   printf("i  = %d\n", i);
   
   return 0;
}
