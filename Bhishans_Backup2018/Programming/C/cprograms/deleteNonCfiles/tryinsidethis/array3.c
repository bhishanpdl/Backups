//topic   : array indices iteratation
//terminal: clear; gcc array3.c && ./a.out

#include <stdio.h>
 
char    a1[] = {'a','b','c'};
char    *a2[] = {"hello","hi","bonjour"};
int     a3[] = {1,2,3};
 
int main() 
{
    int i;
    
    for (i = 0; i < 3; i++) 
    {
        printf("%c\t%s\t%i\n", a1[i], a2[i], a3[i]);
    }
    
    return 0;
}
