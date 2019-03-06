//topic: 2D Arrays in C Using malloc
//ref  : 

//cmd  : clear; gcc malloc2d3.c && ./a.out


#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char **argv)
{
    FILE *fp;
    char **ptr;
    fp=fopen("file.txt","r");
    ptr=(char**)malloc(sizeof(char*)*50);
    for(int i=0;i<20;i++)
    {
       ptr[i]=(char*)malloc(sizeof(char)*50);
       fgets(ptr[i],50,fp);
       
    }



    return 0;
}
