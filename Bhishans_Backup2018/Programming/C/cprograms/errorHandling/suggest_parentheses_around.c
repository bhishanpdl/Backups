/* Author    : Bhishan Poudel
 * Date      : May 25, 2016
 */
#include<stdio.h>

int main(int argc, char *argv[])
 {
    //The expression :
    //if (A && B || C && D)
    //is equivalent to:
    //if ((A && B) || (C && D))
    //since && has higher precendence than ||
   int A,B,C,D;
   A = 1;
   B = 1;
   C = 1;
   D = 1;

    if (A && B || C && D)
        printf("this is an example.\n");


    if ((A && B) || (C && D))
      printf("Always include parenthesis for operators.\n");


 return 0;
 }


/* warning: suggest parentheses around ‘&&’ within ‘||’ [-Wparentheses]
     if (A && B || C && D)
 *
 */
