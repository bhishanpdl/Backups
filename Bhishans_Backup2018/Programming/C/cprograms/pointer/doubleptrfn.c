//double ptr function
//cmd : clear; gcc doubleptrfn.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>


    //returns the array of roll nos {11, 12} through paramater
// return value is total number of  students
int fun( int **i )
{
int *j;
*i = (int*)malloc ( 2*sizeof(int));
**i = 11;  // e.g., newly allocated memory 0x2000 store 11
j = *i;
j++;
*j = 12; ;  // e.g., newly allocated memory 0x2004 store 12
 return 2;
}

int main()
{
int *i;
int n = fun(&i); // hey I dont know how many students are in your class please send all of their roll numbers.
for ( int j=0; j<n; j++ )
  printf ( "roll no = %d \n", i[j]);


return 0;
}

