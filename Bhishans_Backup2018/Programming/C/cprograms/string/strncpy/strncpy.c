//topic: C library function - strncpy()
// syntax: char *strncpy(char *dest, const char *src, size_t n)
// cmd   : clear; gcc strncpy.c && ./a.out


#include <stdio.h>
#include <string.h>

int main()
{
    char src[40];   //src is source
    char dest[12];
   
    //using function memset() to clear the memory location.
    memset(dest, '\0', sizeof(dest));
    strcpy(src, "This is tutorialspoint.com");
    strncpy(dest, src, 10);

    printf("Final copied string : %s\n", dest);
   
    return(0);
}

/*
strncpy combats buffer overflow by requiring you to put a length in it.
strcpy depends on a trailing \0, which may not always occur.

strncpy was never intended as a safer alternative to strcpy and
in fact isn't any safer as it doesn't zero termninate the string.
It also has different functionality in that it pads up the supplied
length with NUL chars

Description

The C library function char *strncpy(char *dest, const char *src, size_t n)
 copies up to n characters from the string pointed to, by src to dest.
  In a case where the length of src is less than that of n,
   the remainder of dest will be padded with null bytes.
Declaration

Following is the declaration for strncpy() function.

char *strncpy(char *dest, const char *src, size_t n)

Parameters

    dest -- This is the pointer to the destination array where
     the content is to be copied.

    src -- This is the string to be copied.

    n -- The number of characters to be copied from source.

Return Value

This function returns the final copy of the copied string.
*/
