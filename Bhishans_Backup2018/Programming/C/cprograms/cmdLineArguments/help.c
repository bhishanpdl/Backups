//topic  : printing help string using argv function
//compile: gcc help.c
//run    : ./a.out ( will print usage) or ./a.out ram sam
//terminal: clear; gcc help.c && ./a.out
//terminal: clear; gcc help.c && ./a.out ram sam

#include <stdio.h>
#include <stdlib.h> // for exit

char *help[] = {
    "Usage: this program takes 2 arguments"    ,    // help[0] string
    "Arguments: argv[0] is always program name",
    "           argv[1] is first  argument"    ,
    "           argv[2] is second argument"    ,
    0}; // null character

//********************************************************************************************************************************************************************************************

int main (int argc, char *argv[])
{
    if (argc == 3)
    {
        printf("Test is successful\n");
    }

    //print help
    if(argc != 3)
    {
        printf("help[0] is = '%s' \n", help[0]); // help[0] is first string.
        
    
        int line;
        for(line = 0; help[line] !=0; line++)
            fprintf(stderr, "%s\n", help[line]);
            exit(1);
    }
    
    
    printf("\n");
    return 0;
}


