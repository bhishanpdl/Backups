// books using structure user input

#include<stdio.h>
#include<string.h>

// we define structure before int main

struct Books
{
	char title[50];
	char author[50];
	char subject[100];
	int id;
} book ;			// structure tag "book" at the end of structure is optional.
 // now we define int main

 int main()
 {
printf("\n");

	struct Books book1,book2;	// book1 and book2 are local variables

//now we store book1 and book2 input using strcpy

	strcpy(book1.title, " C Program"); 
	strcpy(book1.author, "Ali");
	strcpy(book1.subject, "Computer");
	book1.id = 123;

	strcpy(book2.title, "Quantum Mechanics");
	strcpy(book2.author, "Zettili");
	strcpy(book2.subject, "Physics");
	book2.id = 236;
	
	//  now we will print details of book1 and book2

	printf("Book 1 title: %s\n", book1.title);
	printf("Book 1 author: %s\n", book1.author);
	printf("Book 1 subject: %s\n", book1.subject);
	printf("Book 1 book id: %d\n", book1.id);

	 
	printf("Book 2 title: %s\n", book2.title);
	printf("Book 2 author: %s\n", book2.author);
	printf("Book 2 subject: %s\n", book2.subject);
	printf("Book 2 book id: %d\n", book2.id);
	
printf("\n");
 return 0;
 }
