/* Author : Bhishan Poudel
*  Usage  : scans contents from a text file and prints them out
*  cmd    : clear; gcc fscanf2.c && ./a.out
*/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char *argv[])
{
    //routine to read and store names of fitsfiles 
   //***********************************************************************
    char    buffer[100]; // length of one string should be less than this
	char    item[50][100]; // there are 50 strings
	FILE    *fp;
	int     n = 0;     // total no. of items in the file
	int     i = 0; // counter to print items
	
	
	fp = fopen("file2.txt", "r");
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
		strcpy(item[n],buffer);	//if compiler shows warning for unused fscanf
									//use: if (fscanf()) { code }
		n=n+1;
	}
	fclose(fp);
	n=n-1;	// true total no. of items
	
	// printing input
	printf("No. of items inside the text file is n = %d\n", n);	
	printf("Contents inside the text file are following:\n\n");
	for(i=0;i<n;i++)
	    printf("item[%d]: %s\n", i, item[i]);
	    
    //**************************************************************



    return 0;
}
