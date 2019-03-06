/*Author: Bhishan Poudel
 *Topic : separate compilation and use of makefile
 *cmd   : gcc main.c functions.c -o main
 *
 *note  : make && ./out
 */


#include "stdio.h"
/* To use the functions defined in Functions.c I need to #include Functions.h */
#include "functions.h"      //this works also for functions.h

int main(){
    int a, b;
    int sum1;

    printf("Insert two numbers: ");
    scanf("%d %d", &a, &b);

    /*if(scanf("%d %d", &a, &b)!=2)
    {
        fputs("Invalid input", stderr);
        return 1;
    }*/

    sum1 = function1(a,b);

    printf("The output is 3a^2+b+5\n");
    printf("The output is = %d\n", sum1);
    //printf("%d + %d = %d", a, b, Sum(a, b));
    return 0;
}
