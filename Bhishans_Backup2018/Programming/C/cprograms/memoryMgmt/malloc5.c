//topic    : malloc
//ref      :
//terminal : clear; gcc malloc5.c && ./a.out


#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main()
{

    // malloc returns a pointer to void for the 
    //number of bytes requested

    void *malloc(unsigned int nbytes);

    char *newstr(const char *s) 

    char *p;

    if( (p=malloc(strlen(s)+1)) == NULL ) 
    {
        fprintf(stderr,"out of memory!\n");
        exit(1);
    }

      strcpy(p,s);
      return(p);

}
