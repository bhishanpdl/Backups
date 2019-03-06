//topic: C library function - qsort() inside header stdlib.h
//ref  : http://www.tutorialspoint.com/c_standard_library/c_function_qsort.html
//cmd  : clear; gcc qsort.c && ./a.out

//declaration: 
//void qsort(void *base, size_t nitems, size_t size, int (*compar)(const void *, const void))

#include<stdio.h>
#include<stdlib.h>
#include<string.>

//we must define comparator function to use qsort
int cmpfunc (const void * a, const void * b);
int main(int argc, char *argv[])
{

    int array[] = { 88, 56, 100, 2, 25 };
    int i;
    int size = sizeof(array) / sizeof(array[0]);

    printf("Before sorting the list is: \n");
    for( i = 0 ; i < size; i++ ) 
        printf("%d ", array[i]);

    qsort(array, size, sizeof(int), cmpfunc);

    printf("\nAfter sorting the list is: \n");
    for( i = 0 ; i < size; i++ ) 
    printf("%d ", array[i]);
  
    printf("\n");  
    return(0);
}
//comparator function
int cmpfunc (const void * a, const void * b)
{
   return ( *(int*)a - *(int*)b );
}

/**********************************************************************************************
Parameters

    base -- This is the pointer to the first element of the array to be sorted.

    nitems -- This is the number of elements in the array pointed by base.

    size -- This is the size in bytes of each element in the array.

    compar -- This is the function that compares two elements.

***********************************************************************************************/
/***********************************************************************************************
examples: jedicatalog.c
qsort(source_images, num_source_images, sizeof(Stamp), compareStamp);
//comparator for sorting a list of stamps
int compareStamp(const void* p1, const void* p2)
{
    float diff = ((Stamp*)p1)->radius - ((Stamp*)p2)->radius;
    if(diff > 0) return 1;
    else if(diff <0) return -1;
    else return 0; 
}

eg2: jedicatalog.c
qsort(radius_db[mag_bin], nradius, sizeof(float), compareInt);
//comparator for sorting a list of integers
int compareInt(const void* p1, const void* p2)
{
    return (*(int*)p1 - *(int*)p2); 
}
***********************************************************************************************/

