// structure function

#include<stdio.h>
#include<string.h>
	
//we define structure and before int main(i.e. global variable)	
struct Books  // name of structure is Books
{
	char    title[50];
	char    author[50];
	char    subject[100];
	int     book_id;
};
//declaring function prototype

void display(struct Books book); // book is a variable which has structure similar to Books

//int main function

int main( )
{
    printf("********************************\n");

	struct Books Book1;		// variable type is structure
	struct Books Book2;
	
    //giving user input to the structures Book1 and Book2 using strcpy.

	strcpy( Book1.title, "C Programming");
	strcpy( Book1.author, "Nuha Ali");
	strcpy( Book1.subject, "C Programming Tutorial");
	Book1.book_id = 6495407;


	strcpy( Book2.title, "Telecom Billing");
	strcpy( Book2.author, "Zara Ali");
	strcpy( Book2.subject, "Telecom Billing Tutorial");
	Book2.book_id = 6495700;
	
    //printing the output by invoking function.

	display(Book1);		// Book1 and Book2 are int main variables 
	display(Book2);     // given as input for function called display.

printf("********************************\n");
return 0 ;
}

//function display
void display( struct Books book)		// book is a local variable
{
	printf( "\nBook title : %s\n", book.title);
	printf( "Book author : %s\n", book.author);
	printf( "Book subject : %s\n", book.subject);
	printf( "Book book_id : %d\n", book.book_id);
}
//****************************************the end.
	
