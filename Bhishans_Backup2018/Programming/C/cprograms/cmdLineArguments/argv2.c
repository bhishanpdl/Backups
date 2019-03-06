//topic    : command line arguments
//terminal : clear; gcc argv2.c && ./a.out hello my name is bhishan poudel


#include <stdio.h>

int main(int argc, char ** argv)
{
    int i;
    for(i = 0; i < argc; i++)
    {
        printf("Argument %i = %s\n", i, argv[i]);
    }
    return 0;
}
