/* Author   : Bhishan Poudel
   Date     : Feb 23, 2016
   Command  : gcc -Wall -o myc myc.c
   Command  : gcc -Wall -o myc myc.c; sudo cp myc /usr/local/bin/
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


    printf("/* Author   : Bhishan Poudel\n");


    strftime(buffer,80,"%b %d, %Y", info);
    printf("   Date     : %s\n", buffer );
    printf("*/\n");
    
    return 0;
}
