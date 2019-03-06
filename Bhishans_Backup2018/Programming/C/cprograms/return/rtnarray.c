//author : bhishan poudel
//program: return an array using pointer

#include <stdio.h>
//function prototypes
int* myfunction( );	//integer pointer function


//main function 
int main ()
{
  
   int *ptr;	// pointer to myfunction
   int i;
   int  array2[5];

   ptr = myfunction();
   printf("\nthe fifth array member is = %d\n\n", *(ptr+4));
   for ( i = 0; i < 10; i++ )
   {
       printf( "array member %d : %d\n", i+1, *(ptr + i));
       array2[i]=  *(ptr+i);
   }
   
   printf("\narray2[1] = %d\n", array2[1]);

printf("\n");
   return 0;
}
//defining a function to return array values using pointer
int* myfunction( )
{
  static int  array[10] = {10,20,30,40,50,60,70,80,90,100};	//point to remember is that C does not advocate to return the address of a local 
  			//variable to outside of the function so you would have to define the local variable as static variable.
  return array;
}

