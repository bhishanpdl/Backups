//topic    : file read using while to get no. of lines, then use for loop 
// syntax  : FILE *fopen ( const char * filename, const char * mode )
// terminal: clear; gcc filereadGood2.c && ./a.out


#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy

int main()
{

	// defining variables
	FILE    *fp; 			//file pointer
	char    filename[] = "namePercent.txt" ;
	
	
	//opening the file to read contents
	fp = fopen(filename, "r");

	//checking for error
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
	
     
    //using while loop and fgets to read lines from the text
    char    buf[BUFSIZ];   // BUFSIZ is defined in stdio.h	
	int     n = 0;              //initializing n = 0, to read the no. of lines from file
    while (fscanf(fp,"%s[^\n]", &buf) > 0)
    {
        n++;
    }
    fprintf(stdout,"Found %i lines in the text file %s\n", n, filename);

    
    
    
    /*
    //printing data stored from the file
    int i = 0;
    for(i=0;i<n;i++)
        printf("line[%d]: %s", i, array[i]);
        
        */
    
    // extra functions:
    // remove("abc.txt"); // this will delete the file
    // rewind(fp);         // if we previously also opened file, use it!
    
    printf("\n");
    return 0;
}

/*
Look in your stdio.h file. In mine, (VC++ 6.0 Pro), it says...

>>>
#if defined(_M_MPPC)
#define BUFSIZ 4096
#else 
#define BUFSIZ 512
#endif 
<<<


gcc uses 1024
VS6 512 or 4096
some older borland compiler i saw used 2048
 
*/
