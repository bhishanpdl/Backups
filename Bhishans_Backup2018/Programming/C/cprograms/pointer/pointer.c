//topic   : advanced knowledge in pointers
//ref     : http://www.cs.dartmouth.edu/~campbell/cs50/dynamicmem.html
//terminal: clear; gcc pointer.c && ./a.out


/*
File: pointers.c

 Description: Creates an array of struct types. Initialises and computes
 on an array of structs. The code is written to study the address of
 pointers and to look at what happens when pointers are incremented
 and decremented.

 Input: None

 Output: Prints various contents of pointers to the display

*/

#include <stdio.h>

#define NUMPEOPLE  100

  // Note the struct array in a little different from one defined in
  // Lecture 6. Here the array definitions for name and address are
  // pointers to characters. Note, we use typedef to define the structure
  // type. Saves use using the name struct when defining instances of
  // this type.

typedef struct _person 
{
     char *name;
     char *addr;
     int age;
} person;

// How big is person struct?

person people[NUMPEOPLE];
person *p;
int age;

char *myname = "Andrew T. Campbell";
char *myadr =  "People’s Republic of Norwich";

int main() 
{

  // intiatlise p to the address of the people array
  // of struct person (which is the tag)

  p = people;

  int i;

  // how much storage is needed for a pointer?
  // how much storage is needed for a struct of person?

  printf("pointer needs %ld bytes, struct people 0x%x (HEX) bytes\n", sizeof(p), (unsigned int)sizeof(person));

  // how much storage for the array of people?
  // what is the address in memory of the p and people variables?

  printf("The address of p is %p, it’s contes are (i.e., it points to) %p\n",(void *)&p,(void *)p);

  printf("The address of people is %p\n", (void *)people);

  // increment to next person in the table

  p++;

  printf("after incrementing p its value is %p\n", (void *)p);

  // decrement to the previous person

  p--;

  printf("after decrementing p its value is %p\n", (void *)p);

  // Let’s initialise our array

  for (i=0; i < NUMPEOPLE; i++) {
     people[i].age = 21;
     people[i].name = myname;
     people[i].addr = myadr;
  }

  // Let’s reset p (even though it points to people already)

  p = people;

  // Let’s compute the total age for people.
  // NOTE, that we use the pointer p and incremet p to move through
  // the array of structs. Importantly we use the "->" symbol to
  // index elements in the struct.

  for (i=0; i < NUMPEOPLE; i++) {
     age += p->age;  // note the -> not . is used
     p++;
  }

  p = people;

  printf("%s is %d years old (again) and lives in %s\n", p->name, p->age, p->addr);

  printf("The accumulative age of all people is %d years\n", age);

  return 0;

}

//ref : http://www.cs.dartmouth.edu/~campbell/cs50/dynamicmem.html

