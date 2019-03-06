//topic    : malloc strings
//terminal : clear; gcc mallocString3.c && ./a.out


#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char *argv[])
{
    char *string;
    
    
    
    
    string = (char *) calloc( (strlen(string) + 1 ), sizeof(char) );
    
    
    
    if(string == NULL )
    {
            fprintf(stderr,"Error: could not allocate memory for strings ");
            exit(1);
    }
    //storing string to the pointer
    strcpy(string, "Bhishan Poudel");
    
    printf("%s\n", string);


    free(string);
    printf("\n\n");
    return 0;
}

//note: we get segmentation fault
