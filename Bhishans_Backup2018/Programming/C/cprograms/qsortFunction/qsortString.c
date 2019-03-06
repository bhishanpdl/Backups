/*Author: Bhishan Poudel
 *topic: C library function - qsort()
 *
 *cmd  : clear; gcc qsortString.c && ./a.out
 */
 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>


int cstring_cmp(const void *a, const void *b);

int main(int argc, char **argv)
{
    char *strings[] = { "Zorro", "Alex", "Celine", "Bill", "Forest", "Dexter" };
    size_t strings_len = sizeof(strings) / sizeof(char *);
  
    //print original array elements
    printf("The original array elements are:\n");
    print_cstring_array(strings, strings_len);
 
    // sort array using qsort functions 
    qsort(strings, strings_len, sizeof(char *), cstring_cmp);
 
    // print sorted array
    printf("\nThe sorted array elements are:\n"); 
    print_cstring_array(strings, strings_len);
     
    
    printf("\n");
    return 0;
}

// qsort C-string comparison function
int cstring_cmp(const void *a, const void *b) 
{ 
    const char **ia = (const char **)a;
    const char **ib = (const char **)b;
    return strcmp(*ia, *ib);
	/* strcmp functions works exactly as expected from
	comparison function */ 
}


// C-string array printing function 
void print_cstring_array(char **array, size_t len) 
{ 
    size_t i;
 
    for(i=0; i<len; i++) 
        printf("%s  ", array[i]);
 
    printf("\n");
} 
