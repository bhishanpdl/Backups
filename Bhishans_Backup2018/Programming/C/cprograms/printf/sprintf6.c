//sprintf5.c
//cmd: clear; gcc sprintf6.c && ./a.out


#include <stdio.h>

int main()
{
    char word[30];
    sprintf(word,"%.9g", 5.0);
    //sprintf(word,"%.9g", (double) 5);
    
    
    printf(word);
    
    printf("\n");
    return 0;
}

/*
sprintf6.c:14:12: warning: format string is not a string literal
      (potentially insecure) [-Wformat-security]
    printf(word);

*/
