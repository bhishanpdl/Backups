// topic   : Memory Management in C (malloc, calloc, realloc and free)
// terminal: clear; gcc malloc.c && ./a.out

#include <stdio.h>
#include <stdlib.h> // for malloc and calloc

int main(){

   int n,n2;        // number of numbers to be entered
   int i;           // counter for for loop
   int *ptr;        //initially we dont know array size of ptr[]

   printf("Number of elements to be entered: ==> ");
   scanf("%d",&n);

   //allocating dynamic memory to array ptr[i]
   // malloc is faster, doesnot initialize, and is insecure
   ptr = (int*) malloc(n * sizeof(int));     // malloc has only one argument
   //ptr = (int*)calloc(n, sizeof(int));    // calloc has two arguments
   
   
   //storing numbers in array ptr[i]
   printf("Enter %d numbers:\n",n);
   for( i=0 ; i < n ; i++ ) 
   
      scanf("%d",&ptr[i]);
   
   //printing array ptr[i] elements
   printf("The numbers entered are: ");
   for( i=0 ; i < n ; i++ ) 
   
      printf("%d ",ptr[i]);
      
   //**************************************************************   
   printf("\nEnter again new no. of elements to be entered ==>  ");
   scanf("\n%d",&n2);
   
   //now we find n2, then we will reallocate memory 
    ptr = realloc(ptr,n2);
    
   //storing numbers in array ptr[i]
   printf("Enter %d numbers:\n",n2);
   for( i=0 ; i < n2 ; i++ ) 
   
      scanf("%d",&ptr[i]);
   
  // printing array[i]
   printf("The new numbers entered are: ");
   for( i=0 ; i < n2 ; i++ ) 
   
      printf("%d ",ptr[i]);
   
      
   free(ptr); //// don’t forget to free the memory or we will have memory leaks    
   printf("\n");
   return(0);
}

/*
The difference in malloc and calloc is that malloc does not set the memory 
to zero where as calloc sets allocated memory to zero.
*/

/*
Unlike malloc(), calloc() takes two arguments: 
1) number of blocks to be allocated 
2) size of each block.

We can achieve same functionality as calloc() by using malloc() followed by memset(),
ptr = malloc(size);
memset(ptr, 0, size);
If we do not want to initialize memory then malloc() is the obvious choice.
*/
