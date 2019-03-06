// topic: sscanf
// ref  : http://docs.roxen.com/pike/7.0/tutorial/strings/sscanf.xml
// cmd  : clear; gcc sscanf3.c && ./a.out

#include <stdio.h>
#include<string.h>

int main(void)
{
   //Some examples of sscanf:

    //This call to sscanf will return 1, and the variable
    // a will be given the value "oo":
    char a[100];
    sscanf("foo", "f%s", a);
    printf("%s\n", a);

    //The return value from sscanf will be 2. a will be given the value 4711. 
    // b will be given the value "bar".
    int a1;
    char b[100];
    sscanf("4711bar", "%d%s", &a1, b);
    printf("%d  %s\n", a1, b);

    //The return value from sscanf will be 1, a will be given the value "test":
    sscanf(" \t test", "%*[ \t]%s", a);
    printf("%s\n", a);

    //This removes "the " from the beginning of the string in str. 
    //If str does not begin with "the ", it will not be changed
    char str[100];

    sscanf(str, "the %s", str);
    printf("%s\n", str);

    
        
        
    return 0;
}


