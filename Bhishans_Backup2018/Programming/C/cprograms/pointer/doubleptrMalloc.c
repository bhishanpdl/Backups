//topic   : double pointer
//terminal: clear; gcc doubleptrMalloc.c && ./a.out



#include<stdio.h>
#include<stdlib.h> // for malloc

int main()
{
    char **strings;
    int  i;

    strings = malloc(4 * sizeof(char *)); // we have four strings
    
    for(i=0;i<4;i++)
    {
        strings[i] = malloc(32); // string length should be less than 31
        sprintf(strings[i], "string %d", i); //string[0] becomes string 0

    }

    /* dereference to get a string, or char * */
    printf("strings[0] = %s\n", strings[0]);
    printf("strings[1] = %s\n", strings[1]);
    printf("strings[3] = %s\n", strings[3]);
    
    /* dereference to get a character of the string */
    printf("strings[0][0] = %c\n", strings[0][0]);
    printf("strings[0][1] = %c\n", strings[0][1]);
    printf("strings[0][2] = %c\n", strings[0][2]);
    printf("strings[1][0] = %c\n", strings[1][0]);
    printf("strings[2][0] = %c\n", strings[2][0]);
    
    return 0;
}


/*

four strings and each string has 6 elements
note that string length shoudl be equal or less than 31 here


0 s t r i n g 0
1 s t r i n g 1
2 s t r i n g 2
3 s t r i n g 3
  0 1 2 3 4 5 6 


note:
    int *ptr;
    ptr = malloc(10 * sizeof (*ptr)); // Without a cast
    ptr = (int*)malloc(10 * sizeof (int)); // With a cast
    
    
    In C, never cast the result of malloc: int * p = malloc(sizeof(int) * 10);.
    The code allocates enough memory for 10 integers,
    i.e. 10 times the size of a single integer; the return value of the call
    is a pointer to that memory

*/
