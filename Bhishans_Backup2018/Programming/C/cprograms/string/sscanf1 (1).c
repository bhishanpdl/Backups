#include<stdio.h>
#include<stdlib.h>
#include<string.h>	//for memset

int main(int argc, char** argv) {

    	int age;
    	char *x = "19 cool kid";
    	
	char *buffer = malloc (strlen (x) + 1);
	
	sscanf (x, "%d %[^\n]", &age, buffer);
	printf("%s is %d years old\n", buffer, age);
	
    return 0;
}
