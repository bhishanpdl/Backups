//topic  : C library function - strncpy()
// syntax: char *strncpy(char *dest, const char *src, size_t n)
// cmd   : clear; gcc strcpy.c && ./a.out


#include <stdio.h>
#include <stdlib.h> // for malloc
#include <string.h>

int main()
{


    char *str1 = "abcdefghijklmnop";
    char *str2 = malloc(100); // must be large enough to hold the string! 
    
    strcpy(str2, str1); // str2 is now "abcdefghijklmnop" 
    str2[0] = 'A'; // str2 is now "Abcdefghijklmnop" 
    
    // str1 is still "abcdefghijklmnop"
    
    printf("%s\n", str1);
    printf("%s\n", str2);

    return 0;
}
