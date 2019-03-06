//topic     : size_t datatype in c
//ref       : https://answers.yahoo.com/question/index?qid=20100903080714AAvQ4dD
//compile   : gcc -Wall -Wextra -Wconversion -pedantic -std=c99 -o size_t size_t.c
//run       : ./size_t
//terminal  : clear; gcc -Wall -Wextra -Wconversion -pedantic -std=c99 -o size_t size_t.c && ./size_t

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
int main() 
{
     printf("-1 converted to size_t is %zu\n", -1);
     void* p = malloc(-1);
     printf("pointer returned by malloc(-1) is %p\n", p);
} 

/*
 In C, size_t is defined only as the type returned by operator 
 sizeof and its meaning is "the number of bytes occupied by an 
 object in memory" (where object can be a variable, a structure, an array, etc)

Its main stated purpose is to be used with memory allocation and I/O routines,
which are all concerned with sizes of objects in memory, but sometimes 
it is also used for counters because it's guaranteed to be non-negative.

A good example is the standard C function fread(), defined as:

size_t fread(void * restrict ptr, size_t size, size_t nmemb, FILE * restrict stream);

here size_t is used three times:
The argument size of type size_t uses size_t in its original meaning, as the *size*, 
the number of bytes a particular object occupies in memory.
The argument nmemb of type size_t uses size_t in the meaning "non-negative count"
The return value of size_t is again used in the meaning 'non-negative count'.


Now as for malloc, it is defined as void *malloc(size_t size) which means 
if you're using a negative signed integer as its argument, it gets 
implicitly converted to unsigned integral type. Such conversion is 
performed by applying 2's complement to the bitwise representation 
of your number, and that means the actual value passed to malloc() 
is a very big unsigned integer. On your system, malloc fails to allocate so much memory, and returns a null pointer. 

*/
