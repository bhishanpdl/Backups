/* The C library function int puts(const char *str) writes a string to stdout up to but not including the null character. A newline character is appended to the output.
*/



#include <stdio.h>
#include <string.h>

int main()
{
   char str1[15];
   char str2[15];

   strcpy(str1, "tutorialspoint");
   strcpy(str2, "compileonline");

   puts(str1);	// output: tutorialspoint
   puts(str2);	// output: compileonline
   
   
   puts("Geeksfor");	// output: Geeksfor
    puts("Geeks");	// output: Geeks
    
    fputs("Geeksfor", stdout);	// ouput is given to next line
    fputs("Geeks", stdout);	// ouput is given to next line
    
    // % is intentionally put here to show side effects of using printf(str)
   // printf("Geek%sforGeek%s");  
    
    puts("Geek%sforGeek%s");	// ouput: GeeksforGeeksGeek%sforGeek%s
    
    
   
   return(0);
}


/*  char * myMessage;
  // ... myMessage gets filled at runtime with some unpredictable content
  printf(myMessage);  // WRONG! (what if myMessage contains a '%' char?) 
  // puts(myMessage); // correct
  // printf("%s\n",myMessage); // equivalent to the above, but less efficient
  
  */
  
  /* 
  puts() can be preferred for printing a string because it is generally less expensive (implementation of puts() is generally simpler than printf()), and if the string has formatting characters like ‘%’, then printf() would give unexpected results. Also, if str is a user input string, then use of printf() might cause security issues (see this for details).
Also note that puts() moves the cursor to next line. If you do not want the cursor to be moved to next line, then you can use following variation of puts().

   fputs(str, stdout)
  */
