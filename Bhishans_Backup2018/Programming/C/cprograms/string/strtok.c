//program: string tokenizing
//author : bhishan poudel
//cmd    : clear; gcc strtok.c && ./a.out

#include <stdio.h>
#include <string.h>

int main ()
{
  	
  	char 	string[] ="string1 is Apple,string2 is Ball,string3 is 10 % :string4 is A; string5 is 1";
  			 //str1                 str2                str3           str4                ; is not delimiter here
  	
  	
  	char 	*p;
  	char 	*word;
  
  
  	//displaying source string
  	printf ("Given string is:\n%s\n\n",string);
  
  	//string tokenizing
  	p = strtok (string,",:");	// , and : are string delimiters
  	
  	
  	//printing tokenized strings
  	while (p!= NULL)
  	{
        printf ("%s\n",p);
    	p = strtok (NULL, ",:");
  	}
  	printf("********************************************\n");
  	
  	//another example
  	
  	word = strtok(string, " ");		//separated by space 
  	printf("\n1st token: %s\n", word);	//1st word: string1 	
  	
  	word = strtok(NULL, ",");	//we need NULL to neglect previous string
	printf("2nd token: %s\n", word);	//2nd word: is "Apple"
	
	word = strtok(NULL, ",");	//this works upto first comma of the string
	printf("3rd token: %s\n", word);	//3rd word: (null)
	
	word = strtok(NULL, ",");		//we need NULL to neglect previous string
	printf("Next token: %s\n", word);	//Next word: (null)
	
	
printf("\n");  	
return 0;
}

/*
 * The following description is from Linux Programmer's Manual (strtok(3)):
 *
 * #include <string.h>
 * char *strtok(char *str, const char *delim);
 *
 * The  strtok() function breaks a string into a sequence of zero or more
 * nonempty tokens.  On the first call to strtok() the string to be parsed
 * should be specified in str. In each subsequent call that should parse
 * the same string, str must be NULL.
 *
 * The delim argument specifies a set of bytes that delimit the tokens in
 * the parsed string.  The caller may specify different strings in  delim
 * in  successive  calls  that parse the same string.
 *
 * Each  call  to strtok() returns a pointer to a null-terminated string
 * containing the next token.  This string does not include the delimiting
 * byte.  If no more tokens are found, strtok() returns NULL.
 */
