// program to read a file
// terminal: clear; gcc filereadBug2.c && ./a.out
// this program ignores numbers

#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy

int main(int argc, char *argv[])
{


	char buffer[10]; // length of one string should be less than this
	char mystrings[20][10]; // there are 20 strings
	FILE *fp;
	int  n;     // total no. of items in the file
	int i = 0; // counter to print items
	
	
	
	//fp = fopen(argv[1], "r");
	fp = fopen("namePercent.txt", "r");
	

	//displaying error if file_name is absent.	
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
    
    //******************************************
    char  buf[BUFSIZ] = ""; //[BUFSIZ] is in_built keyword in c program
	
	//storing data from the file in some arrays
	while (fgets(buf, sizeof(buf), fp) != NULL)			
	{			
		fscanf(fp,"%s[^\n]",buffer);	  // spaces, tabs, newlines will be ignored, only items will be read in the file	
		strcpy(mystrings[n],buffer);	
									
		n=n+1;
	}
	fclose(fp);
	n=n-1;	// true total no. of items
	
	// printing input	
	
	for(i=0;i<n;i++)
	    printf("%d: %s\n", i+1, mystrings[i]);
	

	printf("\n");
	return 0;
}
/* we get bug: ( we do not get numbers)
1: ram
2: sam
3: cam

*/
