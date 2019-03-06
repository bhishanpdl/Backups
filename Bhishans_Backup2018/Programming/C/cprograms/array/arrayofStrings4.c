//topic    : array of pointers
//ref      : http://stackoverflow.com/questions/9352555/can-i-create-an-array-of-char-pointers-in-c
//terminal : clear; gcc arrayofStrings.c && ./a.out

#include<stdio.h>
#include<stdlib.h>  // for atof

void fnarrayofStrings(char **keywords);

int main()
{
    char *keyword[10];
    keyword[0] = "Tom Cruise";
    keyword[1] = "Mila Kunis";
    keyword[2] = "Jason Statham";
    keyword[3] = "2015";
    
    /*
    
    printf("keyword[0] = %s\n", keyword[0]);
    printf("keyword[1] = %s\n", keyword[1]);
    printf("keyword[2] = %s\n", keyword[2]);
    
    */
    //using string converter to get number
    double value;
    value = atof(keyword[3]);
    printf("value + 5 = %.0f\n", value + 5);
    
    //using for loop to print all keywords
    int i = 0;
    for (i=0; i<=3; i++)
        printf("keyword[%d] = %s\n",i, keyword[i]);
        
        
     //this doesnot gives number of keywords
    size_t n = (sizeof(keyword))/(sizeof(keyword[0]));
    
    printf("size of keyword    = %zu\n", sizeof(keyword)    ); //keyword_size * 8
    printf("size of keyword[0] = %zu\n", sizeof(keyword[0]) ); // 8
    printf("size of keyword[1] = %zu\n", sizeof(keyword[1]) ); // 8
    printf("size of keyword[2] = %zu\n", sizeof(keyword[2]) ); // 8
    printf("n = %zu\n", n); // ans: n = 10
    
    return 0;
}
//function to store pointers
void fnarrayofStrings(char **keywords)
{
    char *first_string = *keywords;       // *keyword is equivalent to keyword[0]
    char first_char    = *first_string;  // *first_string is equivalent to first_string[0]
}
/* Description
   ===========

    The double stars just means that this function expects you to pass a pointer to a pointer to a char.
    This syntax doesn't include any information about the fact that you are using an array, or that the 
    char is actually    first char of many in a string.
    It's up to you as the programmer to know what kind of 
    data structure this char ** actually points to.

    For example, let's suppose the beginning of your array is stored at address 0x1000.
    The keyword argument to the function should have a value of 0x1000.
    If you dereference keyword, you get the first entry in the array, 
    which is a char * that points to the first char in the string "float".
    If you dereference the char *, you get the char "f".


    There were two pointers in the example above. By adding an offset to the first 
    pointer before dereferencing it, you can access different strings in the array. 
    By adding an offset to the second pointer before dereferencing it, 
    you can access different char in the string.


*/
