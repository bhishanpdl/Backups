// Autho :Bhishan Poudel
// Program: clear; gcc -Wall readFileNames1.c && ./a.out
#include<stdio.h>
#include<string.h>
#include<stdlib.h>  //for stderr



//main function
int main()
{
printf("\n");
    	
    FILE *fp;
    fp=fopen("formatFile.txt","r");
	
	char  buffer[50];
	char  red[50][50];
	char  blue[50][50];
	char  redblue[50][50];

	int i=0;
	int n = 0;
	

	if (fp == NULL) {
        	fprintf(stderr, "Could not open file\n");	// if we use printf("No files"), we will get segmentation fault.
        	exit(-1);
        }

    //storing data from the file in some arrays
	while(!feof(fp)){
		fscanf(fp,"%s[^\n]",buffer);
		strcpy(red[n],buffer);
		fscanf(fp,"%s[^\n]",buffer);
		strcpy(blue[n],buffer);
		fscanf(fp,"%s[^\n]",buffer);
		strcpy(redblue[n],buffer);

		n=n+1;
	}
	fclose(fp);
	n=n-1;


	// displaying input
	printf("\n***************************Input Data*************************************\n");
	char *fmt1 = "%-5s %-20s %-20s %-20s\n\n";
	char *fmt2 = "%-5d %-20s %-20s %-20s\n";
	
	printf(fmt1, "S.N.", "red", "blue", "redblue") ;


	for(i=0;i<n;i++)
	{
		printf(fmt2,i+1,red[i],blue[i],redblue[i]);


		
	}

	printf("***************************************************************************\n");


printf("\n");
return 0;
}
