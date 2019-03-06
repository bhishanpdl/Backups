// topic: Memory Management in C
// source: http://www.tutorialspoint.com/cprogramming/c_memory_management.htm

#include <stdio.h>
#include <stdlib.h>  // for malloc
#include <string.h>  // for strcpy

int main()
{

   char name[100];
   char *description;

   strcpy(name, "Bhishan Poudel");

   // allocate memory dynamically
   // here, we dont know size of variable description,
   // so we use dynamic memory
   description = malloc( 101 * sizeof(char) );
   if( description == NULL )
      fprintf(stderr, "Error - unable to allocate required memory\n");
   
   else
   {
      strcpy( description, "Bhishan Poudel is a student");
   }
   printf("Name = %s\n", name );
   printf("Description: %s\n", description );
   
   return 0;
}


/* Some functions for memory allocation and management found in header file <stdlib.h>

S.N. 	Function and Description
1 		void *calloc(int num, int size);

		This function allocates an array of num elements each of which size in bytes will be size.
		
2 		void free(void *address);

		This function release a block of memory block specified by address.
3 		void *malloc(int num);

		This function allocates an array of num bytes and leave them initialized.

4 		void *realloc(void *address, int newsize);

		This function re-allocates memory extending it upto newsize.

*/

