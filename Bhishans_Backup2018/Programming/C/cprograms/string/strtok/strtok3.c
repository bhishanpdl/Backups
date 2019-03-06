//topic: strign tokenizing
// cmd : clear; gcc strtok3.c -std=c99 && ./a.out

#include <string.h>
#include <stdio.h>

int main()
{

    //provide a string that you want to tokenize
    char    s[] = "this is a string";
    
    //set a pointer to the token, here delimiter is space
    char    *p = strtok(s, " ");
    
    
    //
    p = strtok(NULL," ");

    //p now points to 'is'

    //and so on until no more spaces can be found,
    // then the last string is returned as the last token 'string'.

    //more conveniently you could write it like
    // this instead to print out all tokens:
    
    // for (char *p = strtok(s," "); p != NULL; p = strtok(NULL, " "))
    // we should add -std=c99

    for (char *p = strtok(s," "); p != NULL; p = strtok(NULL, " "))
    {
        puts(p);
    }
    
    // If you want to store the returned values from strtok
    // you need to copy the token to another buffer e.g. strdup(p);
    // since the original string (pointed to by the static pointer
    // inside strtok) is modified between iterations in order
    // to return the token.
    
    return 0;
}
   
/* steps: 
1.  provide a string that you want to tokenize

    char    s[] = "this is a string";

2.  in the above string space seems to be a good
    delimiter between words so lets use that
    
    char    *p = strtok(s, " ");
    
3.  what happens now is that 's' is searched until the
    space character is found, the first token is returned ('this')
    and p points to that token (string)
    
    p = strtok(NULL," ");

    in order to get next token and to continue with the same
    string NULL is passed as first argument since strtok maintains
    a static pointer to your previous passed string
    
4.  p now points to 'is'

    and so on until no more spaces can be found,
    then the last string is returned as the last token 'string'.

    more conveniently you could write it like
    this instead to print out all tokens:

    for (char *p = strtok(s," "); p != NULL; p = strtok(NULL, " "))
    {
        puts(p);
    }
    
5.
    If you want to store the returned values from strtok
    you need to copy the token to another buffer e.g. strdup(p);
    since the original string (pointed to by the static pointer
    inside strtok) is modified between iterations in order
    to return the token.
    
*/
