//topic: file write

#include<stdio.h>

int main (){
   FILE *fp;
   //const char str = "Hello world how to write this inside a file?";
   const char str[1024] = "Hello world how to write this inside a file?";
	//fprintf(fp, "Some text: %s\n", text);
	
   //char str[] = "This is a test string to be written inside a file";

   fp = fopen( "file.txt" , "w" );
   fwrite(str,sizeof(str[0]) , sizeof(str)/sizeof(str[0]), fp ); // output: Write th
   									// we get no encoding error

   fclose(fp);
   printf("look inside file.txt\n");
  
   return(0);
}

/*
sytax:
size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream)

Parameters:

    ptr − This is the pointer to the array of elements to be written.

    size − This is the size in bytes of each element to be written.

    nmemb − This is the number of elements, each one with a size of size bytes.

    stream − This is the pointer to a FILE object that specifies an output stream.

*/
