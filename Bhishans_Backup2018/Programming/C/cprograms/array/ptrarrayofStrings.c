/* 	program : array pointer
 *	author  : Bhishan Poudel
 *  ref     : https://www.google.com/search?q=array+of+pointers+in+c&ie=utf-8&oe=utf-8
 *  terminal: clear; gcc ptrarrayofStrings.c && ./a.out
 */

#include <stdio.h>
 
const int MAX = 3;
 
int main ()
{
    //storing strings in pointer to array
    char *names[] = {
                        "Bhishan",
                        "Poudel",
                        "Ohio University",
                        "USA",
                    };
                    
                    
    //printing strings                
    int k = 0;
    for ( k = 0; k < 4; k++)
      printf("Value of names[%d] = %s\n", k, names[k] );
      
      
   
   
   return 0;
}
