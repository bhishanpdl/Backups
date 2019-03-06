//topic: 2D Arrays in C Using malloc
//ref  : 

//cmd  : clear; gcc malloc2d2.c && ./a.out


#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char **argv)
{
    int **p1;


p1 = malloc(2 * sizeof *p1);

for(int i=0;i<2;i++)
{
    p1[i] = malloc(3 * sizeof *p1[i]);
    for(int j=0;j<3;j++)
    {
       scanf("%d", &p1[i][j]);
    }

}


for(int i=0;i<2;i++)
{

    for(int j=0;j<3;j++)
    {
       printf("%d\n", p1[i][j]);
    }

}




    return 0;
}






