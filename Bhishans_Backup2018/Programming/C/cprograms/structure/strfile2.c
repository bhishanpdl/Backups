// structure function typedefine user define
// terminal: clear; gcc strfile2.c && ./a.out

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define SIZE 4
	
//******************** we define structure int main	
 struct Books  // name of structure is Books
{
	char title[50][50];		// title is a member of structure called Books
	char author[50][50];
	char subject[100][50];  //100 subjects, length of name of one sub is 50
	int book_id[10];        // we have 10 integers
} ;

//function declaration before int main

void display( struct Books book );


int main( )
{

	int i=0;
	struct Books Book[2];

	FILE *fp;
	fp =fopen("strfile.txt", "r");
	
	/*char title[50][50];		// arrays to store values.
	char author[50][50];
	char subject[100][50];
	int book_id; */
	
	char c [50];		// bufffer string of 1d	
		
	
	if (fp == NULL) 
	{
        fprintf(stderr, "Could not open file\n");
        exit(8);
    }
    
    	while(!feof(fp))
    	{
    
	    fscanf(fp,"%s[^\n]", c);    //storing title as a string
	    strcpy(Book[i].title,c);
	
	    fscanf(fp,"%s[^\n]",c );    //storing author as a string
	    strcpy(Book[i].author,c);
		
	    fscanf(fp,"%s[^\n]",c );
	    strcpy(Book[i].subject,c);  //storing subject as a string
		
	    fscanf(fp,"%d", &Book[i].book_id);  //storing book_id as an integer
	
	    i++;
	}	
	   	
    	fclose(fp);
    
    	display(Book[i]); // invoking the function
	
	
   return 0;
   }//end of main function
//*******************************************************************************
   
//function to print all stored variables
   
   void display( struct Books book ) 		// book is also a structure
{


	printf("\nBook title : %s\n", book.title);
	printf("Book author : %s\n", book.author);
	printf("Book subject : %s\n", book.subject);
	printf("Book book_id : %d\n", book.book_id);
}// end of function display
//*******************************************************************************
