// allocating exactly needed memory
//ref     : http://stackoverflow.com/questions/8164000/how-to-dynamically-allocate-memory-space-for-a-string-and-get-that-string-from-u
//terminal: clear; gcc mallocString2.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main()    
{    
    char    c;
    char    *str; 
    int     i=0;
    int     j=1;
    
    str = (char*)malloc(sizeof(char));
    printf("Enter String : ");
    
    
    while(c!='\n')
    {
        c = getc(stdin);     //read the input from keyboard standard input
        
        
        //re-allocate (resize) memory for character read to be stored
        str = (char*)realloc(str,j*sizeof(char));
        
        
        str[i] = c;  //store read character by making pointer point to c
        i++;
        j++;
    }
    
    
    
    str[i]='\0';   //at the end append null character to mark end of string
    printf("\nThe entered string is : '%s' \n",str);
    
    
    free(str);   //important step the pointer declared must be made free
    printf("\n\n");
    return 0;
}
