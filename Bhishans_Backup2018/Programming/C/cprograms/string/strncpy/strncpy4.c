// topic: string copy
// ref  : http://beej.us/guide/bgc/output/html/multipage/strcpy.html
// cmd  : clear; gcc strncpy4.c && ./a.out

#include <stdio.h>
#include <string.h>

int main()
{

    char *src = "hockey tennis cricket football volleyball";
    char dest[20];

    int len;

    strcpy(dest, "I like "); // dest is now "I like "

    len = strlen(dest);

    // tricky, but let's use some pointer arithmetic and math to append
    // as much of src as possible onto the end of dest, -1 on the length to
    // leave room for the terminator:
    strncpy(dest+len, src, sizeof(dest)-len-1);

    // remember that sizeof() returns the size of the array in bytes
    // and a char is a byte:
    dest[sizeof(dest)-1] = '\0'; // terminate with a null character
    
    printf("%s\n", src);
    printf("%s\n", dest);

    return 0;
}



