//topic: getline
//ref  : http://c-for-dummies.com/blog/?p=1112
//cmd  : clear; gcc getline.c && ./a.out

#include <stdio.h>
#include <stdlib.h>

int input(char *s,int length);

int main()
{
    char *buffer;
    size_t bufsize = 32;
    size_t characters;

    buffer = (char *)malloc(bufsize * sizeof(char));
    if( buffer == NULL)
    {
        perror("Unable to allocate buffer");
        exit(1);
    }

    printf("Type something: "); //eg. Today is January 3, 2015
    characters = getline(&buffer,&bufsize,stdin);
    printf("%zu characters were read.\n",characters);
    printf("You typed: '%s'\n",buffer);

    return(0);
}
