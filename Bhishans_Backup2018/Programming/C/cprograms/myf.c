/* Author   : Bhishan Poudel
   Date     : Feb 23, 2016
   Command  : clear; gcc -Wall myc.c; ./a.out; rm a.out
   Command  : gcc -o myf myf.c; cp myf ~/bin/
*/




#include<stdio.h>
#include <time.h>

int main()
{
   time_t rawtime;
   struct tm *info;
   char buffer[80];

   time( &rawtime );
   info = localtime( &rawtime );


    printf("! Author   : Bhishan Poudel\n");


    strftime(buffer,80,"%b %d, %Y", info);
    printf("! Date     : %s\n", buffer );
    printf("! Command  : clear; gfortran -Wall a.f90 && ./a.out; rm a.out\n");
    printf("! Command  : clear; f95 a.f90 && ./a.out; rm a.out\n");
    printf("! Program  : \n\n");

    return 0;
}
