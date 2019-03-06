// string formatting
// source: http://linux.die.net/man/3/scanf
// source: https://stackoverflow.com/questions/6083045/scanf-n-skips-the-2nd-input-but-n-does-not-why


#include <stdio.h>
#include <string.h>

int main (void)
{
  char str1[128], str2[128], str3[128];

  printf ("\nEnter str1: ");
  scanf ("%s", str1);				// we can also use scanf ("\n%s", str1);
  printf ("str1 = %s", str1);

  printf ("\n\nEnter str2: ");
  scanf ("%s", str2);
  printf ("str2 = %s", str2);

  printf ("\n\nEnter str3: ");
  scanf ("%s", str3);
  printf ("str3 = %s", str3);

  printf ("\n\n");
  return 0;
}

