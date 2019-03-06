/*
 *  A short function to convert an array to uppercase,
 *  showing that we don't need to worry about non-character
 *  elements.
 */
#include <stdio.h> 
#include <ctype.h> 

void upstr(char *s)		//defining the function right on top of the program
{
  char  *p;

  for (p = s; *p != '\0'; p++) 
    *p = (char) toupper(*p);
}
//*******************************
//after defining function we write int main function.

int main(void)
{
  char  mystring[] = "Some 1234 text 5678 here!";
  puts(mystring);
  upstr(mystring);	// calling the functioin upstr
  puts(mystring);
  return(0);
}
//***********End of Program*******
/*
 * Program output:
 Some 1234 text 5678 here!
 SOME 1234 TEXT 5678 HERE!
 *
 */
