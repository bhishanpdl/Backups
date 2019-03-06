//topic   :
//ref     : read each words separated by space/tab/newlines
//terminal: clear; gcc fileread5.c -std=c99 && ./a.out 

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char *argv[])
{
    //routine to read and store  inputfits of fitsfiles 
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
		if(fscanf(fp,"%s[^\n]",buffer))	  // spaces, tabs, newlines will be ignored
		strcpy(filename[n],buffer);	//note: use of if avoids warning of unused fscanf 
		                            //warning in gcc compiler in Linux
									
		n=n+1;
	}
	fclose(fp);
	n=n-1;	// true total no. of items
	
	// printing input
	printf("Total no. of files inside the text file is n = %d\n", n);
	printf("Contents inside the text file are following:\n\n");
	for(int i=0;i<n;i++)
	    printf("%d: %s\n", i, filename[i]);;
    		return 0;
	}

