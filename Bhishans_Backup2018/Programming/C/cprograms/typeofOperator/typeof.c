//topic: typeof operator in c program
//ref  : https://stackoverflow.com/questions/6280055/how-do-i-check-if-a-variable-is-of-a-certain-type-compare-two-types-in-c
//terminal: clear; gcc typeof.c && ./a.out

#include<stdio.h>

int main() 
{
    int x;         /* Plain old int variable. */
    typeof(x) y = 6;   /* Same type as x. Plain old int variable. */
    
    printf("y=%d\n",y);
    
    
    /* this doesnot work
    double a;
    if (typeof(a) = typeof(x)
    {
        printf("a and x both have the same type\n");
    }
    */
    
    int m;
    float n;
    if(sizeof(m) == sizeof(n))  //both integer and float have size 4
    {
        printf("m and n both have same size\n");
    }
    
    
    
    long m1 = 5;
    long long m2 = 5;
    double m3 = 5;
    printf("sizeof long      is %lu\n", sizeof(m1)); //8
    printf("sizeof long long is %lu\n", sizeof(m2)); //8
    printf("sizeof double    is %lu\n", sizeof(m3)); //8


return 0;
}


