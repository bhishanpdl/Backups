//topic    : array of strings
//ref      : https://stackoverflow.com/questions/2257735/assigning-memory-to-double-pointer
//terminal : clear; gcc arrayofStrings3.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>


int main(int argc, char *argv[])
{

//question

    char **ptr;
    fp=fopen("file.txt","r");
    
    ptr=(char**)malloc(sizeof(char*)*50);
    
    for(int i=0;i<20;i++)
    {
       ptr[i]=(char*)malloc(sizeof(char)*50);
       fgets(ptr[i],50,fp);
    }


//answer:
    char *x;  // Memory locations pointed to by x contain 'char'
    char **y; // Memory locations pointed to by y contain 'char*'

x = (char*)malloc(sizeof(char) * 100);   // 100 'char'
y = (char**)malloc(sizeof(char*) * 100); // 100 'char*'
    


    return 0;
}
