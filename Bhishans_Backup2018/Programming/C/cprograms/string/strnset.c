/* In this program, first 4 characters of the string “Test String” is set to “#” using strnset( ) function and output is displayed as “#### String”.
*/

#include<stdio.h>
#include<string.h>
int main()
{
    char str[20] = "Test String";
    printf("Original string is : %s", str);
    printf("Test string after string n set" \" : %s", strnset(str,'#',4));
    printf("After string n set : %s", str);
    return 0;
}

/*Output:

Original string is                 : Test String
Test string after string set : #### String
*/
