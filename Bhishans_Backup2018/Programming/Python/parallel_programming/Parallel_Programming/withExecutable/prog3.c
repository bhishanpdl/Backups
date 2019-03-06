
// clear; gcc -o prog3 prog3.c -std=c99 && ./prog3 arg1; rm -f *~
#include <stdio.h>
int main(int argc, char ** argv) {
    printf("This is program 3\n");
    printf("Program 3 first argument is = %s\n", argv[1]);  
return 0; } 
