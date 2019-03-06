/* Author   : Bhishan Poudel
   Date     : Mar 30, 2016
   Command  : clear; gcc -Wall mylatex.c -o mylatex; ./mylatex
   Command  : sudo -H cp mylatex /usr/local/bin/
   Command  : cd /usr/local/bin; ls my*
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


    printf("%% Author          : Bhishan Poudel\n");


    strftime(buffer,80,"%b %d, %Y", info);
    printf("%% Date            : %s\n", buffer );
    printf("%% Topic           : \n\n\n" );

    printf("%% Preamble %% \n");
    printf("\\documentclass{article}\n");
    printf("\\usepackage{amsmath,amssymb}\n\n");

    printf("\\title{}\n");
    printf("\\author{Bhishan Poudel}\n");
    printf("\\date{\\today}\n");
    printf("\\author{Bhishan Poudel}\n\n\n");

    printf("%%***************************** document begins *****************************%%   \n");
    printf("\\begin{document}\n\n");
    printf("\\title{}\n");
    printf("\\tableofcontents\n");
    printf("\\listoffigures\n\n\n");

    printf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  section %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   \n");
    printf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% subsection %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   \n\n");

    printf("%%%%%%%%%%%%%%%%%%%%%%%%%%%% figure environment starts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   \n");
    printf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   \n\n\n");
    printf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   \n");
    printf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figure environment ends %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   \n");
    
    printf("\n\n\\end{document}\n");
    return 0;
}
