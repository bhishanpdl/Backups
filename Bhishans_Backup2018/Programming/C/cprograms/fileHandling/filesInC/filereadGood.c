//topic    : file read
// ref     : http://www.tutorialspoint.com/cprogramming/c_file_io.htm
// ref     : http://faq.cprogramming.com/cgi-bin/smartfaq.cgi?answer=1046476070&id=1043284351 
// syntax  : FILE *fopen( const char * filename, const char * mode )
// note    : this program will read whatever in a given line
// terminal: clear; gcc filereadGood.c && ./a.out


#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy

int main()
{

	// defining variables
	FILE    *fp; 			// variable is fp, type is file pointer
	
	
	//opening the file to read contents
	fp = fopen("namePercent.txt", "r");

	//checking for error
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
	
     
    //using while loop and fgets to read lines from the text
    char    buf[BUFSIZ] ;   // BUFSIZ is in_built keyword in c program	
	char    array[100][BUFSIZ]; // we have 100 strings
	int     n = 0;              //initializing n = 0, to read the no. of lines from file
    while (fgets(buf, sizeof(buf), fp) != NULL)
    {
        strcpy(array[n], buf);
                
        n++;
    }
    fclose(fp);
    printf("\nnumber of lines = %d\n\n", n);
    
    //printing data stored from the file
    int i = 0;
    for(i=0;i<n;i++)
        printf("line[%d]: %s", i, array[i]);
    
    // extra functions:
    // remove("abc.txt"); // this will delete the file
    // rewind(fp);         // if we previously also opened file, use it!
    
    printf("\n");
    return 0;
}
