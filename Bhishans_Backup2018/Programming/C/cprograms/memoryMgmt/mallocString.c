//topic    : dynamic memory allocation
//ref      : http://randu.org/tutorials/c/strings.php
//terminal : clear; gcc mallocString.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main()
{
    // We must be careful to allocate one additonal space to
    // contain the null-terminator.
    
    char *s;
    
    s = (char*) calloc( strlen(s), sizeof(char) );

    if ((s = (char*) calloc( strlen(s), sizeof(char)  == NULL) 
    {
        fprintf(stderr, "could not allocate the memory");
        exit (1);
    }
    
    
    
  strcpy(s, "linux");
  printf("%s\n", s);
  
    /*
    This would result in a bunch of junk being printed to the screen.
    printf will try to print the string, but will continue to print
    past the allocated memory for s, because there is no null-terminator.
    The simple solution would be to add 1 to the malloc call.
    */

    /* correct code:

   
    */
    
    
    free(s);
    printf("\n\n");
    return 0;
}

