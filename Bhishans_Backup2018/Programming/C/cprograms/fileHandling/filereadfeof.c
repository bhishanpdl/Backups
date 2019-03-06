//topic
//note     : use of feof like this is incorrect, we get warning , but we can use it
//note     : this program will ignore spaces, tabs, and newlines and reads everythins else
//terminal : clear; gcc filereadfeof.c && ./a.out

#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy

int main(int argc, char *argv[])
{


//routine to read and store strings from a text file 
   //***********************************************************************
    char    buffer[100]; // length of one string should be less than this
	char    filename[20][100]; // there are 20 strings
	FILE    *fp;
	int     n;     // total no. of items in the file
	int     i = 0; // counter to print items
	
	
	fp = fopen("namePercent.txt", "r");
	

	//displaying error if filename is absent.	
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
	
	//storing data from the file in some arrays
	while(!feof(fp))			
	{			
		fscanf(fp,"%s[^\n]",buffer);	  // spaces, tabs, newlines will be ignored
		strcpy(filename[n],buffer);	
									
		n=n+1;
	}
	fclose(fp);
	n=n-1;	// true total no. of items
	
	// printing input	
	printf("\nContents inside the text file are following:\n");
	for(i=0;i<n;i++)
	    printf("%d: %s\n", i+1, filename[i]);
	    
    //**************************************************************
    
    return 0;
}
