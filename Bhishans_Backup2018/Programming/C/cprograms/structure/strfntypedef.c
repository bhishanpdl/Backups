// structure function typedefine user define

#include<stdio.h>
#include<string.h>
	
// we define structure and before int main	
typedef struct Books  // name of structure is Books; we type defined "struct Books" = " BOOKS"
{
	char title[50];		// title is a member of structure Books
	char author[50];
	char subject[100];
	int book_id;
} BOOKS;
//declaring function prototype

void display(struct Books book); // book is a variable which has structure similar to Books

//defining int main

int main( )
{
printf("\n");

	struct Books Book1;		// variable type is "structure Books"
	BOOKS Book2;
	
	//giving user input to the structures Book1 and Book2 using strcpy.

	strcpy( Book1.title, "C Programming");
	strcpy( Book1.author, "Nuha Ali");
	strcpy( Book1.subject, "C Programming Tutorial");
	Book1.book_id = 6495407;


	strcpy( Book2.title, "Telecom Billing");
	strcpy( Book2.author, "Zara Ali");
	strcpy( Book2.subject, "Telecom Billing Tutorial");
	Book2.book_id = 6495700;
	
	//printing the output is obtained by invoking function.

	display(Book1);		// Book1 and Book2 are int main variables given as input for function called display.
	display(Book2);

printf("\n");
return 0 ;
}
//function display

void display( BOOKS book)		// book is a "local variable" of typedef BOOKS
{
	printf( "\nBook title : %s\n", book.title);
	printf( "Book author : %s\n", book.author);
	printf( "Book subject : %s\n", book.subject);
	printf( "Book book_id : %d\n", book.book_id);
}

	
