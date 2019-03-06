//topic    : array
//terminal : clear; gcc array2.c && ./a.out

//iterate efficiently through an array of ints of unknown size in C

#include<stdio.h>

int main()

{

    int a[]={1,2,3,8,3,5,9,0,12,56};  // 10 elements

    int i,*p;
    
    //method1
    size_t n = sizeof(a)/sizeof(a[0]);
    for (i=0; i<n; i++)
        printf("%d ",a[i]);

    //method 2
    printf("\n\n");
    for(i=0;i<(&a)[1]-a;i++)
        printf("%d ",a[i]);

    
    //method 3
    printf("\n\n");
    for(p=a;p<(&a)[1];p++)   // even more efficient
        printf("%d ",*p);

    printf("\n\n");
    return 0;    

}
