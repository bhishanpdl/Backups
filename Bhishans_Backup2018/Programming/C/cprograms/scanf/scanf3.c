//topic: scanf
//ref  :
//cmd  : clear; gcc scanf3.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char **argv)
{
    //example 1
    int   i;
    float x;
    char  name[50];
     
    scanf ("%d%f%s", &i, &x, name); //type:  25 3e-2 ram
    printf("integer = %d\n", i);
    printf("float   = %.2f\n", x);
    printf("string  = '%s'\n", name); //name will contain ram\0
    printf("\n");
    
    //example2
    int   a;
    float b;
    char  name2[50];
    
    scanf ("%2d%f%*d%[1234567890]", &a, &b, name2); //type: 56789 0123 56a72
    //scanf ("%2d%f%*d%s", &a, &b, name2); //type: 12345a67  then, a =  12, b = 345.000000 name2 = ''
    printf("integer = %d\n", a); //a= 56
    printf("float   = %f\n", b); //b = 789.0, skip 0123
    printf("string  = '%s'\n", name2); // string = 56\0, this shows garbage


    return 0;
}


