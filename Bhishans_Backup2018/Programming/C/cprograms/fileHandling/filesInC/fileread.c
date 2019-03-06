//topic    : file read
// ref     : http://www.tutorialspoint.com/cprogramming/c_file_io.htm
// ref     : http://faq.cprogramming.com/cgi-bin/smartfaq.cgi?answer=1046476070&id=1043284351


// syntax  : FILE* fopen( const char* filename, const char* mode )
// eg.     :       fopen(             "file.txt",           "r"  )


// note that this program will also include WHITESPACES in the input file
// terminal: clear; gcc fileread.c && ./a.out

//NOTE:  PLEASE LOOK AT THE END OF PROGRAM FOR EXTRA DESCRIPTION

#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy

int main(int argc, char *argv[])
{

	// defining variables
	FILE    *fp; 			// variable is fp, type is file pointer
	
	
	//opening the file to read contents
	fp = fopen("namePercent.txt", "r");

	//checking for error
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");//stdout is keyboard out
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
	
	
     
    //using while loop and fgets to read lines from the text
    char    buf[1024] ;         //  length of one buffer is 1024   
	char    array[100][1024];   // we have 100 buffers
	int     n = 0;              //initializing n = 0, to read the no. of lines from file
	
	
    while (fgets(buf, sizeof(buf), fp) != NULL)
    {
        strcpy(array[n], buf);
                
        n++;
    }
    fclose(fp);
    printf("\nnumber of lines = %d", n);
    
    //printing data stored from the file
    printf("\nContents inside the text file are following:\n\n");
    
    int i = 0;
    for(i=0;i<n;i++)
    {
        printf("line[%d]: %s", i, array[i]);
    }
    

    // extra functions:
    // remove("abc.txt");  // this will delete the file
    // rewind(fp);         // if we previously also opened file, use it!

    return 0;
}

/*************************************************************************************
//note: we can use buf[BUFSIZ];
// BUFSIZ is in_built keyword in c program	value may be any of = 1024, 512, etc
//here, its value is random, so never use keyword BUFSIZ in case of file.

	// error method 2:
	 
 	if (fp== NULL) 
	{
	  perror("Error while opening the file \n");  // under header stdlib.h
	  exit(EXIT_FAILURE);
	}
	
    
    // error method 3:  
     if (fp == NULL)
	{
    printf("Error opening file!\n");
    exit(1);
	}
	*************************************************************************************/

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
/*
****************************************************************************************
ref: http://www.codingunit.com/c-tutorial-file-io-using-text-files

The file I/O functions in the stdio library are:

    fopen – opens a text file.
    fclose – closes a text file.
    feof – detects end-of-file marker in a file.
    fscanf – reads formatted input from a file.
    fprintf – prints formatted output to a file.
    fgets – reads a string from a file.
    fputs – prints a string to a file.
    fgetc – reads a character from a file.
    fputc – prints a character to a file.
****************************************************************************************

*/

/* note: 

i = 0;
  
while (!feof(fp))
{
  fgets(buf, sizeof(buf), fp);
  printf ("Line %4d: %s", i, buf);
  i++;
}


This apparently simple snippet of code has a bug in it, though. 
The problem stems from the method feof() uses to determine if EOF has actually been reached. 

*/

