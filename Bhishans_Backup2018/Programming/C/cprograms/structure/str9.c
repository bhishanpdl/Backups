//topic:
//ref     : http://stackoverflow.com/questions/7638612/c-double-pointer-to-structure
//terminal: clear; gcc str9.c && ./a.out

#include <stdio.h>
#include <stdlib.h>

int main(void) 
{
    char *str = "99RED BALLOONS";
    char *what;
    long num;

    num = strtol(str, &what, 10);
    printf("Quantity: %ld;    Description: %s;\n", num, what);

    return 0;
}
