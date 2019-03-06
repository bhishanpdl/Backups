//topic: argc and argv
//compile: gcc argv.c
//run    : ./a.out  or ./a.out ram sam etc
//terminal: clear; gcc argv.c && ./a.out ram sam dam cam


#include <stdio.h>

int main (int argc, char *argv[]){


    int count;
        printf ("This program was called with \"%s\".\n",argv[0]);	// to write " we need to type \"

    if (argc > 1)						// arg[0] is always equal to name of that ouput file.
        for (count = 1; count < argc; count++)
            printf("argv[%d] = %s\n", count, argv[count]);
        else
            printf("The command had no other arguments.\n");
return 0;
}


/*outputs:

./a.out

This program was called with "./a.out".
The command had no other arguments.


./a.out ram sam

This program was called with "./a.out".
argv[1] = ram
argv[2] = sam


*/
