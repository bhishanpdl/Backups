//string duplicating
// note: strdup will allocate the required dynamic memory and frees itself
//cmd  : clear; gcc strdup.c && ./a.out

#include <stdio.h>
#include <string.h>

int main()
{
    char *p1 = "Bhishan Poudel";
    char *p2;
    p2 = strdup(p1);

    printf("Duplicated string is : '%s'\n\n", p2);
    return 0;
}
