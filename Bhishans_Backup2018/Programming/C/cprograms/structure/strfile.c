// structure using function  input: user define
// terminal: clear; gcc strfile.c && ./a.out

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#define SIZE 4
	
// we define structure and before int main	
 struct Books  // name of structure is Books; we type defined "struct Books" = " BOOKS"
{
	char title[50];		// title is a member of structure Books
	char author[50];
	char subject[100];
	int book_id;
} ;

void display( struct Books book );
int main( )
{
	int i=0;
	struct Books Book[10];

	FILE *fp;
	fp =fopen("strfile.txt", "r");
	
	
	//checking for error 
	if (fp == NULL) 
	{
        	fprintf(stderr, "Could not open file\n");
        	exit(-1);
    }
    
    //using while loop to read data from the text file
    	while(!feof(fp))
    	{
		fscanf(fp,"%s[^\n]", Book[i].title); //storing title as string
		
		fscanf(fp,"%s[^\n]", Book[i].author); //storing author as string
			
		fscanf(fp,"%s[^\n]", Book[i].subject); //storing subject as string
			
		fscanf(fp,"%d", &Book[i].book_id); //storing book_id as integer
		i++;
	}		
	fclose(fp);
    
    	display(Book[0]);	//invoking the function
	display(Book[1]);
	
    printf("\n");
    return 0;
}//end of main function


//*********************************************************************
//function display
void display( struct Books book ) 		// book is also a structure
{


	printf("\nBook title   : %s\n", book.title);  //note: \n separates each books
	printf("Book author  : %s\n",   book.author);
	printf("Book subject : %s\n",   book.subject);
	printf("Book book_id : %d\n",   book.book_id);
}// end of function display
//*********************************************************************
