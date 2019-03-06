/* Author   : Bhishan Poudel
* Date     : Feb 23, 2016
* Command  : clear; gcc -Wall a.f; ./a.out; rm a.out

* gcc      : gcc -Wall -o filename filename.c
*/

#include<stdio.h>
int main(int argc, char** argv) {
    printf("Executable name: %s\n", argv[0]);
    printf("This is %s() from %s, line %d\n", __FUNCTION__, __FILE__, __LINE__);

    return 0;
}
