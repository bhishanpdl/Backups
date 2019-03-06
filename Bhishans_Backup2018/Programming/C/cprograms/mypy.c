/* Bhishan Poudel
 * Feb 16, 2016
 * Program: Template for python
 * gcc -o mypy mypy.c; ./mypy
 * sudo -H cp mypy /usr/local/bin/
 * ls /usr/local/bin/my*
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


    printf("#!/usr/bin/env python\n");
    printf("# -*- coding: utf-8 -*-\n\n");
    printf("# Author  : Bhishan Poudel\n");

    strftime(buffer,80,"%b %d, %Y", info);
    printf("# Date    : %s\n\n\n", buffer );
    printf("# Imports \n\n" );
    return 0;
}
