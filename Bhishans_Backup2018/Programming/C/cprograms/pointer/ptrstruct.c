//topic   : advanced knowledge in pointers
//ref     : http://www.cs.dartmouth.edu/~campbell/cs50/dynamicmem.html
//terminal: clear; gcc ptrstruct.c && ./a.out


/*
File: ptrstruct.c

 Description: Creates an array of struct types. Initialises and computes
 on an array of structs. The code is written to study the address of
 pointers and to look at what happens when pointers are incremented
 and decremented.

 Input: None

 Output: Prints various contents of pointers to the display

*/

#include <stdio.h>

#define NUMPEOPLE  100


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

char *myname = "Bhishan Poudel";
char *myadr =  "Athens, Ohio, USA";

int main() 
{

  // intiatlise p to the address of the people array
  // of struct person (which is the tag)

  p = people;

  int i;

  // how much storage is needed for a pointer?
  // how much storage is needed for a struct of person?

  printf("pointer needs %ld bytes, struct people 0x%x (HEX) bytes\n\n", sizeof(p), (unsigned int)sizeof(person));

  // how much storage for the array of people?
  // what is the address in memory of the p and people variables?

  printf("The address of p is %p, it’s contents are (i.e., it points to) %p\n\n",(void *)&p,(void *)p);

  printf("The address of people is %p\n\n", (void *)people);

  // increment to next person in the table

  p++;

  printf("after incrementing p its value is %p\n\n", (void *)p);

  // decrement to the previous person

  p--;

  printf("after decrementing p its value is %p\n\n", (void *)p);

  // Let’s initialise our array

  for (i=0; i < NUMPEOPLE; i++) {
     people[i].age = 30;
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

  printf("%s is %d years old (again) and lives in %s\n\n", p->name, p->age, p->addr);

  printf("The accumulative age of all people is %d years\n\n", age);

  return 0;

}

//ref : http://www.cs.dartmouth.edu/~campbell/cs50/dynamicmem.html

