//sprintf

//cmd    : clear; gcc sprintf.c && ./a.out


#include<stdio.h>
 
int main()
{
    int   a           = 1;
    float b           = 1.23;
    char  c           = 'u';
    char  string[100] = "My initial character array.";
 
    printf("%s\n", string);
 
    sprintf(string, "Integer = %d, Float = %f, Character = %c.", a, b, c);
 
    printf("%s\n", string);
    
    
    
    
    
    
    
    
    
    
  
    //*************************************************************************
    //sscanf example
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
	char *buf = malloc (strlen (ptr) + 1);	
	
	sscanf (ptr, fmt, &age, buf);
	printf ("age    = %d\n",age);
	printf ("buffer = %s\n", buf);
	//*************************************************************************
	
 
  return 0;
}
