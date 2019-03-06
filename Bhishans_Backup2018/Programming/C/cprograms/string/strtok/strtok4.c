//topic  : sscanf
//cmd    : clear; gcc sscanf2.c && ./a.out

#include <stdio.h>
#include <string.h>

int main ()
{

  char str[] ="hello, world, I, 287876, 6.0" ;
  char *p;
  
  
  printf ("Splitting string '%s' into tokens:\n",str);
  p = strtok (str,",");
  
  while (p != NULL)
  {
    printf ("%s\n",p);
    p = strtok (NULL, ",");
  }
  
  return 0;
}
