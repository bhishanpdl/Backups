//Use of pointers - call-by-ref method..
//Modular program using structures

#include<stdio.h>
#include<string.h>

//structures
struct Books
{
    char    title[50];
    char    author[50];
    char    subject[100];
    int     book_id;
};
typedef struct Books BOOKS; // BOOKS is also a structure

//prototypes
void printBook( struct Books *book );

//main function
int main( )
{
	struct Books Book1;
	BOOKS Book2;

    //storing Book1 information by keyboard input method.

	printf("Enter the Title:");
	scanf("%s", Book1.title);   //strings do not need & operator
	
	printf("Enter the Author:");
	scanf("%s", Book1.author);
	
	printf("Enter the Subject:");
	scanf("%s", Book1.subject);
	
	printf("Enter the ID:");
	scanf("%d", &Book1.book_id); // numbers need & operator

    //storing Book2 information by user input method using strings.

	strcpy( Book2.title,   "Telecom Billing");
	strcpy( Book2.author,  "Zara Ali");
	strcpy( Book2.subject, "Telecom Billing Tutorial");
	Book2.book_id = 6495700;

    //outputs using  call-by-reference method(pointer method)
    printBook( &Book1 );    //& required for pointer method
    printBook( &Book2 );    //invoking function

return 0;
}
//function printBook
void printBook( struct Books *book ) 		// for pointer instead of  . (dot operator) we use -> (arrow operator)
{
    printf("\nBook title : %s\n", book->title);
	printf("Book author : %s\n", book->author);
	printf("Book subject : %s\n", book->subject);
	printf("Book book_id : %d\n", book->book_id);
}
