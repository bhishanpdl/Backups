//topic : sscanf
//ref   : http://www.tutorialspoint.com/c_standard_library/c_function_sscanf.htm
//cmd   : clear; gcc sscanf.c && ./a.out

//int sscanf(const char *str, const char *format, ...)
//A format specifier follows this prototype: [=%[*][width][modifiers]type=]

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    int      day, year;
    char     weekday[20], month[20];
    
    //method 1
    char    dtm[] =  "Saturday March 25 1989";
    
    //method 2
    //char  dtm[100];
    //strcpy( dtm, "Saturday March 25 1989" );
    
    
    
    sscanf( dtm, "%s %s %d  %d", weekday, month, &day, &year );
    printf("%s %d, %d = %s\n", month, day, year, weekday );
   
    //example2
    char *ptr  = "19 cool kid";    
    char fmt[] = "%d %[^\n]";
    
    int  age;
	char *buf = malloc (1+ strlen (ptr) );	
	
	sscanf (ptr, fmt, &age, buf);
	printf ("age    = %d\n",age);
	printf ("buffer = %s\n", buf);
	
	
	
	
	
	
	
	
	
	
	//*************************************************************************
	//sprintf example
	int   a           = 1;
    float b           = 1.23;
    char  c           = 'u';
    char  string[100] = "My initial character array.";
 
    printf("%s\n", string);
 
    sprintf(string, "Integer = %d, Float = %f, Character = %c.", a, b, c);
 
    printf("%s\n", string);
	//*************************************************************************
	
	
	free(buf);
    return(0);
}
