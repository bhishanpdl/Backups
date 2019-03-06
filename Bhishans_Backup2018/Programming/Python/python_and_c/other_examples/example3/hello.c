/*hellomodule.c*/

// Ref: http://www.expobrain.net/2011/01/23/swig-tutorial-for-mac-os-x/

#include <stdio.h>
#include <time.h>
double My_variable = 3.0;

int fact(int n) {
    if (n <= 1) return 1;
    else return n*fact(n-1);
}

int my_mod(int x, int y) {
    return (x%y);
}

char *get_time()
{
    time_t ltime;
    time(&ltime);
    return ctime(&ltime);
}
