/* 
 * ptr_with_mod_c_prog.c -- program shows use of pointers in modular 
 * c program
 */
#include <stdio.h>
void find_char(char *, char);
 
int main(void)
{
    char ch;
    char str[] = "Hello";
 
    printf("which character you want to search inside the string \"Hello\"=>   ");
    ch = getchar();
    find_char(str, ch);     /* str, a string, is an address */
    				// str will be *sp and ch will be ch_cpy in the function find_char
 
    return 0;
}
//end of main function
//function find_char
 
void find_char(char *sp, char ch_cpy)	//*sp will be used to point character ch defined in main function
					// ch_cpy will be used to compare with character ch defined in main function
   /* address of string str copied into sp, pointer to string */
{
    char ch;
 
    while ( (ch = *sp++) != '\0' && ch != ch_cpy);
 
    if (ch_cpy == ch )
        printf("Character \"%c\" is found!\n", ch_cpy);
    else
        printf("Character \"%c\" isn't found!\n", ch_cpy);
}
// end of function

/*
Output of the above program for characters, say q, r, is as:

User, which character u wanna find in string, enter character: q
Character "q" isn't found!
 
User, which character u wanna find in string, enter character: r
Character "r" is found!
Notice, however, here that we copied the address of string “str” 
into the pointer variable “sp” declared in the function find_char() 
and not the full string as it is. Using of pointer here saved lots of 
memory by copying the address of the first character of string “str” and 
not the full string irrespective of string length. Also, using pointer, 
we performed manipulations on the original string.
*/
