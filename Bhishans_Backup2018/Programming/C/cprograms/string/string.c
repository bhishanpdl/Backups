//topic: array and string
// source: http://www.tutorialspoint.com/cprogramming/c_strings.htm
//   http://www.cs.nyu.edu/courses/spring05/V22.0201-001/c_tutorial/classes/String.html
// http://www.programiz.com/c-programming/c-strings
// http://www.c4learn.com/c-programming/c-pointer-to-array-of-string/


// The string in C programming language is actually a one-dimensional array of 
// characters which is terminated by a null character '\0'.

#include <stdio.h>
#include <string.h>
#include <stdlib.h> // for atof

int main (){

 	// In C, string can be initialized in different number of ways.
 	char str1[]   ="abcd";
     
	char str2[5]  ="100";
     
	char str3[]   ={'a','b','c','d','\0'};
     
	char str4[5]  ={'a','b','c','d','\0'};
	
	char *str5     ="abcdef";
 	
 	printf("\nstr1 = %s \nstr2 = %s \nstr3 = %s \nstr4 = %s \nstr5 = %s", str1,str2,str3,str4,str5);
 	
 	//atof function of header stdlib
 	
 	float   a;
 	int     b;
 	long    c;
 	a = atof(str1); // array to float
 	b = atoi(str2); // array to integer
 	c = atol(str2); // array to long int
    
    printf("\n\nvalue a = %.2f \nvalue b = %i \nvalue c = %ld \n", a,b,c);
    
    //example 4
    printf("\n\n");
    double  a1,b1;
	char    buffer [256];
	
	printf ( "Input: " );   // enter a number in the keyboard eg. 3.45  or hello i am bhishan
	gets (buffer);          //  warning: the `gets' function is dangerous and 
	                        //should not be used, but we may use instead of scanf
	                
	a1 = atof (buffer);
	b1 = a1/7;
	printf ( "a= %f and b= %.2f\n" , a1, b1 );
	printf ("keyboard input is '%s'", buffer);
		
	printf("\n");	
    return 0;
}

/* String functions:
1 	strcpy(s1, s2);

Copies string s2 into string s1.
2 	strcat(s1, s2);

Concatenates string s2 onto the end of string s1.
3 	strlen(s1);

Returns the length of string s1.
4 	strcmp(s1, s2);

Returns 0 if s1 and s2 are the same; less than 0 if s1<s2; greater than 0 if s1>s2.
5 	strchr(s1, ch);

Returns a pointer to the first occurrence of character ch in string s1.
6 	strstr(s1, s2);

Returns a pointer to the first occurrence of string s2 in string s1.


*/
