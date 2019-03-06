/* Author   : Bhishan Poudel
   Date     : Feb 23, 2016
   Command  : gcc -Wall -o mym mym.c
   Command  : gcc -Wall -o mym mym.c; sudo cp mym /usr/local/bin/
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

    printf("#!/usr/bin/octave\n");
    printf("%% Author   : Bhishan Poudel\n");
    strftime(buffer,80,"%b %d, %Y", info);
    printf("%% Date     : %s\n", buffer );

    return 0;
}
