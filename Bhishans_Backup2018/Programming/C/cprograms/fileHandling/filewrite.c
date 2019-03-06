//topic    : file write
// ref     : http://stackoverflow.com/questions/11573974/write-to-txt-file
// terminal: clear; gcc filewrite.c && ./a.out

#include<stdio.h>
#include<string.h>
#include<stdlib.h> // for exit

int main()
{

	FILE *fp = fopen("file.txt", "w"); // this file will be created or overwritten
	
	//checking for error
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }

	/* print some text */
	const char *text = "Write this to the file";
	fprintf(fp, "Some text: %s\n", text);

	/* print integers and floats */
	int i = 1;
	float pi = 3.1415927;
	fprintf(fp, "Integer: %d, float: %f\n", i, pi);

	/* printing single chatacters */
	char c = 'A';
	fprintf(fp, "A character: %c\n", c);

	fclose(fp);
	return 0;
}
/*
****************************************************************************************
Mode		Description

r 		Opens an existing text file for reading purpose.
w 		Opens a text file for writing, if it does not exist then a new file is created.
		Here your program will start writing content from the beginning of the file.
a 		Opens a text file for writing in appending mode, if it does not exist 
		then a new file is created. Here your program will start appending 
		content in the existing file content.
r+ 		Opens a text file for reading and writing both.
w+ 		Opens a text file for reading and writing both. 
		It first truncate the file to zero length if it exists otherwise 
		create the file if it does not exist.
a+ 		Opens a text file for reading and writing both. 
		It creates the file if it does not exist. 
		The reading will start from the beginning but writing can only be appended.
		
		
bianry modes: "rb", "wb", "ab", "rb+", "r+b", "wb+", "w+b", "ab+", "a+b"		
		
*/

