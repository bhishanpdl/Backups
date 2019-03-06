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


./a.out a b c d e f

This program was called with "./a.out".
argv[1] = a
argv[2] = b
argv[3] = c
argv[4] = d
argv[5] = e
argv[6] = f


*/
