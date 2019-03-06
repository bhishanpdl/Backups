// topic : string tokenizing
// ref   : http://apiexamples.com/c/string/strtok_r.html
// cmd   : clear; gcc strtokr.c && ./a.out


#include <stdio.h>
#include <string.h>
 
int main()
{
    char string[] = "A B C";
    char *token;
    char *save;
 
    token = strtok_r(string, " ", &save); 
    printf("%s\n", token);
 
    token = strtok_r(NULL, " ", &save);
    printf("%s\n", token);
 
    token = strtok_r(NULL, " ", &save);
    printf("%s\n", token);
 
    token = strtok_r(NULL, " ", &save);
    printf("%p\n", token);
    return 0;
}
