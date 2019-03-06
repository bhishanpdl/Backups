//topic   : file read 
//ref     ; http://www.programmingsimplified.com/c-program-read-file
//warning : this program uses gets(), which is unsafe.
//terminal: clear; gcc fileread4.c && ./a.out



#include <stdio.h>
#include <stdlib.h>
 
int main()
{
   char ch, file_name[25];
   FILE *fp;
 
   printf("Enter the name of file you wish to see\n");
   gets(file_name);
 
   fp = fopen(file_name,"r"); // read mode
 
   if( fp == NULL )
   {
      perror("Error while opening the file.\n");
      exit(EXIT_FAILURE);
   }
 
   printf("The contents of %s file are :\n", file_name);
 
   while( ( ch = fgetc(fp) ) != EOF )
      printf("%c",ch);
 
   fclose(fp);
   return 0;
}

/*
File I/O: reading a text file

If you want to read a file you have to open it for reading in the read (r) mode. 
Then the fgets library functions can be used to read the contents of the file. 
(It is also possible to make use of the library function fscanf. But you have 
to be sure that the file is perfectly formatted or fscanf will not handle 
it correctly).


Note:The printf statement does not have the new-line (\n) in the format string. 
This is not necessary because the library function fgets adds 
the \n to the end of each line it reads.

A file is opened for reading using the function 
fopen in the mode read (r). The library function fgets will 
read each line (with a maximum of 1000 characters per line.) 
If the end-of-file (EOF) is reached the fgets function will 
return a NULL value. Each line will be printed on stdout 
(normally your screen) until the EOF is reached. 
The file is then closed and the program will end.

*/
