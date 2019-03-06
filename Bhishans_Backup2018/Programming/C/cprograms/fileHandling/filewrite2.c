//topic: file write

#include<stdio.h>

int main ()
{
   FILE *fp;
   char str[] = "This text is written inside the file.txt"; // we get error
   							// character encoding not UTF-8

   fp = fopen( "file.txt" , "w" );
   fwrite(str , sizeof(str[0]) , (sizeof(str)-1) , fp ); // -1 is to exclude \n
   								// otherwise, we would get encoding error
   								// we can write 1 instead of sizeof(str[0])

   fclose(fp);
   printf("\nlook inside file.txt\n\n");
  
   return(0);
}

//sytax:
// size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream)
/*
Parameters:

    ptr − This is the pointer to the array of elements to be written.

    size − This is the size in bytes of each element to be written.

    nmemb − This is the number of elements, each one with a size of size bytes.

    stream − This is the pointer to a FILE object that specifies an output stream.

*/

