#include <stdio.h>
#include <string.h>


int main(int argc,char *argv[])
{

    FILE *fp;
    fp = fopen("in.txt","r");

    int n=0;

    char s[101][100];
    char t[101][100];
    char y[101][100];
    char z[101][100];

    // storing names of 101 galaxies
    for(n=0; n<=2; n++)
    {

        //s[n] =(char*)malloc(sizeof(char)*100);

        fscanf(fp,"%s %s %s",s[n],t[n],y[n]);

        strcpy(z[n],"!");

        strcat(z[n],y[n]);

        printf("%d.\t%s \t%s \t%s\n",n,s[n],t[n],z[n]);

        //n = n+1;

    }

    return 0;
}
