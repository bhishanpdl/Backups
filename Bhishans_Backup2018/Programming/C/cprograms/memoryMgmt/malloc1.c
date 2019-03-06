//topic: sscanf
//cmd  : clear; gcc malloc1.c && ./a.out


#include<stdio.h>
#include<stdlib.h> //for malloc

int main(int argc, char **argv) 
{

    int     age;
    char    *x = "19 cool kid";
    	
	char    *buffer = malloc (strlen (x) + 1);
	
	sscanf (x, "%d %[^\n]", &age, buffer);
	printf("%s is %d years old\n", buffer, age);
	
	
	free(buffer);
    return 0;
}
