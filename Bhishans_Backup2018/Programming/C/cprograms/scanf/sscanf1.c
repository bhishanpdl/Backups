//topic: sscanf
//cmd  : clear; gcc sscanf1.c && ./a.out

#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char **argv) 
{

    int age, num;
    char *x = "19 cool kid";
    	
	char *buf = malloc (strlen (x) + 1);
	
	sscanf (x, "%d %[^\n]", &age, buf);
	printf ("age    = %d\n",age);
	printf ("buffer = %s\n", buf);
	
	
	
	free(buf);
    return 0;
}
