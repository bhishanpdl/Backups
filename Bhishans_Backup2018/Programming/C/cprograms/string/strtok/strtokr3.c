// topic : string tokenizing
// ref   : http://apiexamples.com/c/string/strtok_r.html
// cmd   : clear; gcc strtokr3.c && ./a.out


#include <stdio.h>
#include <string.h>
 
int main()
{
    char string[] = "a b c\nx y z";
    char *line;
    char *line_delim = "\n";
    char *line_save;
 
    char *word;
    char *word_delim = " ";
    char *word_save;
 
    line = strtok_r(string, line_delim, &line_save);
    while (line) {
        printf("%s\n", line);
 
        word = strtok_r(line, word_delim, &word_save);
        while (word) {
            printf("%s\n", word);
            word = strtok_r(NULL, word_delim, &word_save);
        }
        printf("\n");
 
        line = strtok_r(NULL, line_delim, &line_save); 
    }
 
    return 0;
}
