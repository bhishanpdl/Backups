//structure_pointer with function and user_input 

#include<stdio.h>
#include<string.h>

// we define structure before function prototypes and int main
//i.e. structure is global variable

struct Books		//name of structure is Books
{
	char title[50];
	char author[50];
	char subject[100];
	int id;
};

//now we declare function prototypes
	
void printBooks( struct Books *book);	// functioin name is printBooks

 // now we define int main and structures book1 and book2 inside it.

 int main()
 {
	printf("**************************************************\n");

	struct Books book1;
	struct Books book2;

//now we store book1 and book2 input using strcpy

	strcpy(book1.title, " C Program 123"); 
	strcpy(book1.author, "Ali");
	strcpy(book1.subject, "Computer");
	book1.id = 123;

	strcpy(book2.title, "Quantum Mechanics");
	strcpy(book2.author, "Zettili");
	strcpy(book2.subject, "Physics");
	book2.id = 236;
//  now we will print details of book1 and book2

	printBooks ( &book1);  		// invoking the void function called printBooks
	printf("\n");				// pointer needs &
	printBooks ( &book2);	
	
	printf("***************************************************\n");
 	return 0;
 }
 // after int main we define our functions(or, modules).

 void printBooks(struct Books *book)
 {				// for pointer we use -> instead of .

	printf("Book  title: %s\n", book->title);
	printf("Book  author: %s\n", book->author);
	printf("Book  subject: %s\n", book->subject);
	printf("Book  book id: %d\n", book->id);
}				// void function doesnot have return values.

 

