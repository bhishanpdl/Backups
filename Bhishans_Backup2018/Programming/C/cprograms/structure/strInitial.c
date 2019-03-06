//initialization inside structure in c
//ref: https://stackoverflow.com/questions/225089/why-cant-we-initialize-members-inside-a-structure/226228#226228 
//cmd: clear; gcc strInitial.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char *argv[])
{


/* we cannot do so
 in strucutre we only define type not the variables
struct s { int i=10; };
*/

//we can do like this:
struct s { int i; } t = { .i = 10 };

//we also can this

struct s {
    int i;
};

struct s s_instance = { 10 };

// we also can do this in C99

struct st {
    int i;
};

struct s s_instance = {
    .i = 10,
};






    return 0;
}
