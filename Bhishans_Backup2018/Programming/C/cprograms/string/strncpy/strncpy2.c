//topic  : C library function - strncpy()
// syntax: char *strncpy(char *dest, const char *src, size_t n)
// cmd   : clear; gcc strncpy2.c && ./a.out


#include <stdio.h>
#include <string.h>

int main()
{
    
    char src[] = "My hovercraft is full of fishes."; // more than 10 chars
    char dest[10];

    strncpy(dest, src, 9); // only copy 9 chars into positions 0-8
    dest[9] = '\0';        // position 9 gets the terminator
    
    printf("original string is '%s'\n", src);
    printf("copied string is '%s'\n\n", dest);
   
    return(0);
}
