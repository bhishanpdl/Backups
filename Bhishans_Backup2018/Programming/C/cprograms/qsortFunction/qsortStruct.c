/*Author: Bhishan Poudel
 *topic: C library function - qsort()
 *
 *cmd  : clear; gcc qsortStruct.c && ./a.out
 */
 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 
 

// an example of struct 
struct st_ex 
{ 
    char product[16];
    float price;
};
 
//after struct we define comparator function
int struct_cmp_by_price(const void *a, const void *b);
int struct_cmp_by_product(const void *a, const void *b);
void print_struct_array(struct st_ex *array, size_t len);


// MAIN program (calls all other examples)
int main() 
{ 
    //assigning values to the structure members   
    struct st_ex structs[] = {{"mp3 player", 299.0f}, {"plasma tv", 2200.0f}, 
                              {"notebook", 1300.0f}, {"smartphone", 499.99f}, 
                              {"dvd player", 150.0f}, {"matches", 0.2f }};
 
    size_t structs_len = sizeof(structs) / sizeof(struct st_ex);
 
 
    //print original structure
    printf("The original structure is:\n");  
    print_struct_array(structs, structs_len);
 
    // sort array using qsort functions
    qsort(structs, structs_len, sizeof(struct st_ex), struct_cmp_by_price);
 
    // print sorted structure by price 
    printf("\nThe sorted structure by price is:\n"); 
    print_struct_array(structs, structs_len);
 
    // resort using other comparision function 
    qsort(structs, structs_len, sizeof(struct st_ex), struct_cmp_by_product);    
 
    // print sorted structure by product 
    printf("\nThe sorted structure by product is:\n"); 
    print_struct_array(structs, structs_len);

    
    printf("\n");
    return 0;
} 
// qsort struct comparision function (price float field) 
int struct_cmp_by_price(const void *a, const void *b) 
{ 
    struct st_ex *ia = (struct st_ex *)a;
    struct st_ex *ib = (struct st_ex *)b;
    return (int)(100.f*ia->price - 100.f*ib->price);
	/* float comparison: returns negative if b > a 
	and positive if a > b. We multiplied result by 100.0
	to preserve decimal fraction */ 
 
} 
 
// qsort struct comparision function (product C-string field)
int struct_cmp_by_product(const void *a, const void *b) 
{ 
    struct st_ex *ia = (struct st_ex *)a;
    struct st_ex *ib = (struct st_ex *)b;
    return strcmp(ia->product, ib->product);
	/* strcmp functions works exactly as expected from
	comparison function */ 
} 
 
// Example struct array printing function 
void print_struct_array(struct st_ex *array, size_t len) 
{ 
    size_t i;
 
    for(i=0; i<len; i++) 
        printf("[ product: %s \t price: $%.2f ]\n", array[i].product, array[i].price);
 
    puts("--");
} 

