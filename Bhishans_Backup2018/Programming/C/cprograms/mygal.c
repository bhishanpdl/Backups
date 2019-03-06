/* Author   : Bhishan Poudel
   Date     : Feb 23, 2016
   Command  : gcc -o mygal mygal.c; ./mygal
   Command  : mv mygal ~/bin/
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


    printf("# Author     : Bhishan Poudel\n");


    strftime(buffer,80,"%b %d, %Y", info);
    printf("# Date       : %s\n", buffer );
    printf("# Command    : galfit filename.gal\n");
    printf("# Open log   : open fit.log\n");
    printf("# Open fits  : ds9 output.fits &\n\n");

    return 0;
}
