/*Author: Bhishan Poudel
 *topic: C library function - qsort()
 *
 *cmd  : clear; gcc qsortintegers.c && ./a.out
 */
 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>

int int_cmp(const void *a, const void *b);
void print_int_array(const int *array, size_t len);
void sort_integers_example();


int main(int argc, char **argv)
{
     
    int numbers[] = { 7, 3, 4, 1, -1, 23, 12, 43, 2, -4, 5 }; 
    size_t numbers_len = sizeof(numbers)/sizeof(int);
    printf("numbers_len = %zu\n", numbers_len);
 
 
    //print original array elements
    printf("The original array elements are:\n"); 
    print_int_array(numbers, numbers_len);
 
    // sort array using qsort functions 
    qsort(numbers, numbers_len, sizeof(int), int_cmp);
 
    // print sorted integer array
    printf("\nThe sorted array elements are:\n"); 
    print_int_array(numbers, numbers_len); 

    printf("\n");
    return 0;
}

// qsort int comparator function 
int int_cmp(const void *a, const void *b) 
{ 
    const int *ia = (const int *)a; // casting pointer types 
    const int *ib = (const int *)b;
    return *ia  - *ib; 
	// integer comparison: returns negative if b > a 
	// and positive if a > b 
} 

// integer array printing function
void print_int_array(const int *array, size_t len) 
{ 
    size_t i;
 
    for(i=0; i<len; i++) 
        printf("%d  ", array[i]);
 
    printf("\n");
}
