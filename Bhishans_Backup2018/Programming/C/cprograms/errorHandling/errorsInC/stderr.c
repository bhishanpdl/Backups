//topic: C - Error Handling
//source: http://www.tutorialspoint.com/cprogramming/c_error_handling.htm
//terminal: clear;gcc a.c;./a.out

#include <stdio.h>
#include <errno.h>
#include <string.h>

extern int errno ;

int main (){

printf("\n");

   FILE  *fp;
   int errnum;
   fp = fopen ("unexist.txt", "rb");
   
   if (fp == NULL){
      errnum = errno;
      fprintf(stderr, "Value of errno: %d\n", errno); // Value of errno: 2
      perror("Error printed by perror"); // Error printed by perror: No such file or directory
      fprintf(stderr, "Error opening file: %s\n", strerror( errnum )); // Error opening file: No such file or directory
   }
   else
      fclose (fp);
   
   
   printf("\n");
   return 0;
}

/*
The errno, perror() and strerror()

The C programming language provides perror() and strerror() functions which can be used to display the text message associated with errno.

    The perror() function displays the string you pass to it, followed by a colon, a space, and then the textual representation of the current errno value.

    The strerror() function, which returns a pointer to the textual representation of the current errno value.

Let's try to simulate an error condition and try to open a file which does not exist. Here I'm using both the functions to show the usage, but you can use one or more ways of printing your errors. Second important point to note is that you should use stderr file stream to output all the errors.
*/
