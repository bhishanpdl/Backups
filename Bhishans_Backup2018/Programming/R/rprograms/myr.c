/* Bhishan Poudel
 * Feb 16, 2016
 * Program: To print my custom header lines for python program
 *
 * gcc -Wall -o myr myr.c; ./myr
 * cp myr /home/bhishan/bin
 * 
 * sudo -H cp myr /usr/local/bin    # for mac
 * ls /usr/local/bin/my*
 * 
 * echo "$PATH"
 * copy the executable to one of the paths: e.g.
 * cp myr ~/bin
 *
 * or,
 * sudo cp mypr /usr/local/bin/
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


    printf("#!/usr/bin/env Rscript \n\n");
    printf("# Author  : Bhishan Poudel\n");

    strftime(buffer,80,"%b %d, %Y", info);
    printf("# Date    : %s\n", buffer );
    printf("# Ref     :  \n" );
    printf("# Program : \n\n" );

    printf("# set working directory\n");
    printf("this_dir <- function(directory)  \n");
    printf("setwd(file.path(getwd(), directory))\n\n");


    printf("# libraries\n\n");
    return 0;
}
