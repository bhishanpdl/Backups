//topic
//ref     : http://www.programiz.com/c-programming/c-structures-pointers
//terminal: clear; gcc str7.c && ./a.out

#include <stdio.h>
#include<stdlib.h>
struct name 
{
    int     a;
    float   b;
    char    c[30];
};
int main()
{
    struct name *ptr;
    int i,n;
    printf("Enter n: ");
    scanf("%d",&n);
    ptr=(struct name*)malloc(n*sizeof(struct name));
    
    // Above statement allocates the memory for n structures with pointer ptr pointing to base address 
    for(i=0;i<n;++i)
    {
        printf("Enter string, integer and floating number  respectively:\n");
        scanf("%s%d%f",&(ptr+i)->c,&(ptr+i)->a,&(ptr+i)->b); // we get warning: 
    }  
    //warning: format ‘%s’ expects argument of type ‘char *’, but argument 2 has type ‘char (*)[30]’
    
    printf("Displaying Infromation:\n");
    for(i=0;i<n;++i)
    printf("%s\t%d\t%.2f\n",(ptr+i)->c,(ptr+i)->a,(ptr+i)->b);
    
   return 0;
}
