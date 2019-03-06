//topic    : file read using while loop to count no. of items
//topic    : and for loop to strcpy, and print items
//note     : -Wall will warn any warings
// terminal: clear; gcc filereadclear.c -Wall && ./a.out

#include<stdio.h>
#include<stdlib.h> // for exit
#include<string.h> // for strcpy

int main(int argc, char *argv[])
{



	//routine to read contents from a file
   //***********************************************************************
    char    buffer[100]; // length of one string should be less than this
	char    items[20][100]; // there are 20 items
	FILE    *fp;
	int     n = 0; // counter to read no. of items in the file using while loop
	int     i = 0; // counter to store items and print items

	
	
	fp = fopen("namePercent.txt", "r");

	//checking for error
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
	
	
    //find no. of items in the text file 
    while (fscanf(fp,"%s",buffer) > 0)
    {
	    n=n+1;
    }
    fprintf(stdout,"total no. of items in the text file is n = %d\n", n);
    
    //reset the counter to the top of file using rewind
    rewind(fp);
    
    //copy buffer into the array
    for(i=0; i<n;i++)
    {
        fscanf(fp,"%s[^\n]",buffer); // items are separated by spaces, tabs, newlines
		strcpy(items[i],buffer);   // if compiler shows unused value of fscanf
		                          // use: if(fscan()){ code }
    
    }
    
    //closing the file
    fclose(fp);

    //printing data stored from the file
    printf("Contents inside the text file are following:\n\n");
    for(i=0;i<n;i++)
    {
        printf("item[%d]: %s\n", i, items[i]);
    }


    return 0;
}
