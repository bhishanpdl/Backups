// topic: fgets
// source: http://www.tutorialspoint.com/c_standard_library/c_function_fgets.htm
// source: https://blog.udemy.com/fgets-in-c/

// char *fgets(char *str, int n, FILE *stream)

#include <stdio.h>

int main()
{
printf("\n");
   FILE *fp;
   char str[60];

   /* opening file for reading */
   fp = fopen("file.txt" , "r");
   if(fp == NULL) 
   {
      perror("Error opening file");
      return(-1);
   }
   if( fgets (str, 60, fp)!=NULL ) 
   {
      /* writing content to stdout */
      puts(str);  # this is similar to printf
   }
   fclose(fp);
   
   return(0);
}






/*Declaration*/

/*Following is the declaration for fgets() function.*/

/*char *fgets(char *str, int n, FILE *stream)*/

/*Parameters*/

/*    str -- This is the pointer to an array of chars where the string read is stored.*/

/*    n -- This is the maximum number of characters to be read (including the final null-character).
      Usually, the length of the array passed as str is used.*/

/*    stream -- This is the pointer to a FILE object that identifies the stream where characters are read from.*/


//DIFFERENCE BETWEEN FGETS AND SCANF
/*1. Are you reading the text string from keyboard or a file? If you want to read from a file, you have to use fgets(). To read from a keyboard, you can use either.*/

/*2. Does your string have spaces in it? For example if you’re entering your name “John Smith” with a space between the first name and family name, scanf() will simply exit ie stop reading further once it hits the space. So scanf() will end up reading just “John”. For such cases, you’re better off using fgets().*/
