//topic   : for loop infinite
//ref     : http://www.cs.dartmouth.edu/~campbell/cs50/dynamicmem.html
//terminal: clear; gcc forLoopInfinite.c && ./a.out
//to stop : ctrl c

#include<stdio.h>

int main()
{
    int n;

    for ( ; ; )  // do forever
    { 

        printf("Input the the number n:  ");
        if (scanf("%d", &n) !=1 || n < 1) 
        {
            printf("Usage: n has to be > 0\n\n");
            continue;  // try again
        }
        
        //breaking the loop if n > 50
        if(n>50)
        break;
    }
    
    return 0;
}


//ref : http://www.cs.dartmouth.edu/~campbell/cs50/dynamicmem.html
