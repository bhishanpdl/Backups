// program to read a file
// terminal: clear; gcc fileread4.c && ./a.out mystring.txt
// terminal: clear; gcc fileread4.c && ./a.out

#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy

int main(int argc, char *argv[])
{


	char buffer[100]; // length of one string should be less than this
	char mystrings[20][100]; // there are 20 strings
	FILE *fp;
	int  n;     // total no. of items in the file
	int i = 0; // counter to print items
	
	
	
	//fp = fopen(argv[1], "r");
	fp = fopen("mystring.txt", "r");
	

	//displaying error if file_name is absent.	
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
	
	//storing data from the file in some arrays
	while(!feof(fp))			
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
