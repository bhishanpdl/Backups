//topic   : file read examples
//terminal: clear; gcc fileread2.c && ./a.out
//ref     : http://faq.cprogramming.com/cgi-bin/smartfaq.cgi?answer=1046476070&id=1043284351


#include<stdio.h>
#include<stdlib.h> // for EXIT_FAILURE

int main()
{
    // defining variables
	FILE    *fp; 			// variable is fp, type is file pointer
	
	//file path of fp
	fp = fopen("in.txt", "r");

    //checking for error
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
	
	//using while loop to read file
    int     total = 0;
    double  buf;
    int     n = 0;
    while (fscanf(fp, "%lf", &buf) == 1)
    {
        total += buf;
        n++;
    }
    printf("total no. of items = %d\n", n);
    printf("Total is %d\n", total);


    return 0;
}
