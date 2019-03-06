/* Bhishan Poudel
 * Feb 16, 2016
 * gcc -o mytitle mytitle.c; ./mytitle
 * cp mytitle ~/bin/
 * cd ~/bin; ls
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


    printf("# Author  : Bhishan Poudel\n");

    strftime(buffer,80,"%b %d, %Y", info);
    printf("# Date    : %s\n\n\n", buffer );
    printf("===============================================================================\n\n");
    return 0;
}
