// topic : C library function - strncpy()
// ref   : http://udel.edu/~pconrad/UnixAtUD/strcpy.html
// cmd   : clear; gcc strncpy3.c && ./a.out


#include <stdio.h>
#include <string.h>

int main()
{
    int  LEN = 10;
    char dest[LEN];
    char *src;
 
 // src is set to point to a source string of unknown length

 strncpy(dest,src,LEN);
 dest[LEN-1]='\0'; // null terminate for safety
 
 return 0;
}

/*  Notes on strcpy, strncpy, strlcpy
    ===================================

     strcpy should be generally be avoided
     in favor of strncpy. (Note that "generally avoid"
     doesn't mean "never use"; it does mean don't use without
     CAREFULLY considering the circumstances.)

     Using strncpy is helpful, but is not, in and of itself,
     a guarantee of safety.  You still have to be careful about NULL
     termination issues when the src string is longer than, or equal
     in length to, the destination string.

     Use strlcpy if you can get away with it, but be careful of portability.
     I'll still teach strncpy unless and until I can be convinced that strlcpy
     is so ubiquitious that strncpy is considered obsolete.
*/
