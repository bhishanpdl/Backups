//color.txt //Program written by Riffat Munir

#include <stdio.h>
#include <string.h>
#include "fitsio.h"

int main(int argc,char *argv[]){

 int check =1;

 double m;

 m = atof(argv[2])/20.0;
 
FILE *fp;

int status = 0;

fp = fopen(argv[1],"r");

int n=0;

int i;

char s[31][100];
char t[31][100];
char y[31][100];


for(n=0;n<=30;n++){

//s[n] =(char*)malloc(sizeof(char)*100);

fscanf(fp,"%s %s %s",s[n],t[n],y[n]);

 printf("%d.\t%s \t%s \t%s\n",n,s[n],t[n],y[n]);

//n = n+1;

}

fclose(fp);

return 0;

}
