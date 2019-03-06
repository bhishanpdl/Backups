//topic: sscanf
//cmd  : clear; gcc sscanf.c && ./a.out


#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(int argc, char **argv) 
{
    int     age;
    char    *buffer;
    char    string[] = "19 cool kid";
    	
    buffer = malloc((strlen(string)+1) * sizeof(char));
    
    //example1:
    sscanf(string, "%d %s", &age, buffer);
    printf("age    = %d\n", age);       //age = 19 
    printf("buffer = %s\n\n", buffer);  // buffer = cool
   
    	
    	
    //example2:    	
    sscanf(string, "%d %[^\t\n]", &age, buffer);
	printf("age    = %d\n", age);     // age = 19
	printf("buffer = %s\n", buffer);  // buffer = cool kid
	                                               
																											
	free(buffer);
    return 0;
}
