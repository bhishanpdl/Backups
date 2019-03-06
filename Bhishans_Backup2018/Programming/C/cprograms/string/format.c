// string formatting
// source: http://linux.die.net/man/3/scanf
// source: https://stackoverflow.com/questions/6083045/scanf-n-skips-the-2nd-input-but-n-does-not-why


#include <stdio.h>
#include <string.h>

int main ()
{


 char 	str1[128], str2[128], str3[128];
// char* 	fmt = "%[^\n]%*c"; 	// %[^\n] is everything upto newline escape, and
 						   		// %*c    is suppressing a single character (here, newline)
 						   		// *      is assignment suppression operator
 	
//char* fmt = "%[^\n]" ;  		//the program doesnot stop for next scanf
  char* fmt = " %[^\n]"; 		// (note space between " and %) it will work, ( we can also use spaces here)
 								// here, the space will skip any leading whitespace characters 
 								// (including new-line) 
 								// solution 2: 	fmt = "\n%[^\n]";					 

  printf ("\nEnter str1: ");
  scanf (fmt, str1);
  printf ("\nstr1 = %s", str1);

  printf ("\nEnter str2: ");
  scanf (fmt, str2);
  printf ("\nstr2 = %s", str2);

  printf ("\nEnter str3: ");
  scanf (fmt, str3);
  printf ("\nstr2 = %s", str3);

  printf ("\n");

   return 0;
}

/*

the square bracket symbol [

Matches a nonempty sequence of characters from the specified set of accepted characters; the next pointer must be a pointer to char, and there must be enough room for all the characters in the string, plus a terminating null byte. The usual skip of leading white space is suppressed. The string is to be made up of characters in (or not in) a particular set; the set is defined by the characters between the open bracket [ character and a close bracket ] character. The set excludes those characters if the first character after the open bracket is a circumflex (^). To include a close bracket in the set, make it the first character after the open bracket or the circumflex; any other position will end the set. The hyphen character - is also special; when placed between two other characters, it adds all intervening characters to the set. To include a hyphen, make it the last character before the final close bracket. For instance, [^]0-9-] means the set "everything except close bracket, zero through nine, and hyphen". The string ends with the appearance of a character not in the (or, with a circumflex, in) set or when the field width runs out.
 
*/ 

/*
problem:
Scanf did not consume the \n character that stayed in the buffer from the first scanf call.

So the second scanf call did.
Answer: 
You just need to 'consume' the '\n' character after you've read what you want. Use the following format directive:

"%[^\n]%*c"

Which will read everything up to the newline into the string you pass in, then will consume a single character (the newline) without assigning it to anything (that '*' is 'assignment suppression').

Otherwise,the newline is left in the input stream waiting to immediately terminate the the subsequent "%[^\n]" format directives.

The problem with adding a space character to the format directive (" %[^\n]") is that the space will match any white space. So, it will eat the newline from the end of the previous input, but it will also eat any other whitespace (including multiple newlines).

*/

/*

  FORMAT controls the output as in C printf.  Interpreted sequences are:

       \"     double quote

       \NNN   character with octal value NNN (1 to 3 digits)

       \\     backslash

       \a     alert (BEL)

       \b     backspace

       \c     produce no further output

       \f     form feed

       \n     new line

       \r     carriage return

       \t     horizontal tab

       \v     vertical tab

       \xHH   byte with hexadecimal value HH (1 to 2 digits)

       \uHHHH Unicode (ISO/IEC 10646) character with hex value HHHH (4 digits)

       \UHHHHHHHH
              Unicode character with hex value HHHHHHHH (8 digits)

       %%     a single %
*/
