#include<stdio.h>

int main(){

    printf("This is my first C program\n");
    return 0; }

// To reformat C codes:
// indent -linux -l120 -i4 -nut a.c
// astyle -A1 -Y example.c
// or, in geany add an custom command :
// build > set custom build commands
// Reformat using Astyle astyle -A1 -Y %f
// then, go to build and reformat it, and to reload ctrl R
