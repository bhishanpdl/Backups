/* Author : Bhishan Poudel
*  Usage  : scans contents from a text file and prints them out
*  cmd    : clear; gcc fscanf.c && ./a.out
*
*  syntax : int fscanf(FILE *stream, const char *format, ...)
*  eg     :     fscanf(fp,"%s[^\n],buffer)
*  return : This function returns the number of input items successfully 
*           matched and assigned, which can be fewer than provided for, 
*           or even zero in the event of an early matching failure.
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char *argv[])
{
    //routine to read and store names of fitsfiles 
   //***********************************************************************
    char    buffer[100]; // length of one string should be less than this
	char    filename[50][100]; // there are 50 strings
	FILE    *fp;
	int     n = 0;     // total no. of items in the file
	int     i = 0; // counter to print items
	
	
	fp = fopen("file.txt", "r");
	//fp = fopen(argv[1], "r");
	

	//displaying error if filename is absent.	
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);
    }
	
	//storing data from the file in some arrays
	while(!feof(fp))			
	{			
		fscanf(fp,"%s[^\n]",buffer);	  // spaces, tabs, newlines will be ignored
		strcpy(filename[n],buffer);	//if compiler shows warning for unused fscanf
									//use: if (fscanf()) { code }
		n=n+1;
	}
	fclose(fp);
	n=n-1;	// true total no. of items
	
	// printing input	
	printf("Contents inside the text file are following:\n\n");
	for(i=0;i<n;i++)
	    printf("%d: %s\n", i, filename[i]);
	    
    //**************************************************************



    return 0;
}
