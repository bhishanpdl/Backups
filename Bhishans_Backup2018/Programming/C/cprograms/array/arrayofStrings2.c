//topic    : array of pointers
//ref      : http://stackoverflow.com/questions/9352555/can-i-create-an-array-of-char-pointers-in-c
//terminal : clear; gcc arrayofStrings2.c && ./a.out

#include<stdio.h>
#include<stdlib.h>  // for atof

void fnarrayofStrings(char **keywords);

int main()
{
    char *array[10] = { "Tom Cruise", "Mila Kunis", "Jason Statham", "2015", "2016"} ;
    
    //using string converter to get number
    double value;
    value = atof(array[3]);
    printf("value + 5 = %.0f\n", value + 5);
    
    //using for loop to print all keywords
    int i = 0;
    for (i=0; i<5; i++)
        printf("array[%d] = %s\n",i, array[i]);
        
        
    
    return 0;
}
//**********************************************************************************
//function to store pointers
void fnarrayofStrings(char **keywords)
{
    char *first_string = *keywords;       // *keyword is equivalent to keyword[0]
    char first_char    = *first_string;  // *first_string is equivalent to first_string[0]
}
//**********************************************************************************
