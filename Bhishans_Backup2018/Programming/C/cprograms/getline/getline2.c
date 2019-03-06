//topic: getline
//ref  : http://c-for-dummies.com/blog/?p=1112
//cmd  : clear; gcc getline2.c && ./a.out

#include <stdio.h>

int input(char *s,int length);

int main()
{
    char buffer[32];
    char *b = buffer;
    size_t bufsize = 32;
    size_t characters;

    printf("Type something: ");
    characters = getline(&b,&bufsize,stdin);
    printf("%zu characters were read.\n",characters);
    printf("You typed: '%s'\n",buffer);

    return(0);
}


