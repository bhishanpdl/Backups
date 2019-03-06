//topic: scanf
//ref  : https://en.wikipedia.org/wiki/Scanf_format_string
//cmd  : clear; gcc scanf2.c && ./a.out

#include <stdio.h>

int main()
{
    char  word[20];

    if (scanf("%19s", word) == 1) //type hello i am bhishan
        puts(word); // it will print only i, since %s terminates at space
    return 0;
}

/*

Some of the most commonly used placeholders follow:
======================================================

    %d : Scan an integer as a signed decimal number.
    %i : Scan an integer as a signed number. Similar to %d, 
        but interprets the number as hexadecimal when preceded by 0x and 
        octal when preceded by 0. For example, the string 031 would be read 
        as 31 using %d, and 25 using %i. The flag h in %hi indicates 
        conversion to a short and hh conversion to a char.
    %u : Scan for decimal unsigned int (Note that in the C99 standard the 
        input value minus sign is optional, so if a minus sign is read, 
        no errors will arise and the result will be the two's complement 
        of a negative number, likely a very large value. See strtoul().
        [not in citation given]) Correspondingly, %hu scans for an unsigned 
        short and %hhu for an unsigned char.
    %f : Scan a floating-point number in normal (fixed-point) notation.
    %g, %G : Scan a floating-point number in either normal or exponential 
            notation. %g uses lower-case letters and %G uses upper-case.
    %x, %X : Scan an integer as an unsigned hexadecimal number.
    %o : Scan an integer as an octal number.
    %s : Scan a character string. The scan terminates at whitespace. 
        A null character is stored at the end of the string, 
        which means that the buffer supplied must be at least one character 
        longer than the specified input length.
    %c : Scan a character (char). No null character is added.
        whitespace: Any whitespace characters trigger a scan for zero or 
        more whitespace characters. The number and type of whitespace 
        characters do not need to match in either direction.
    %lf : Scan as a double floating-point number.
    %Lf : Scan as a long double floating-point number.

    An optional asterisk (*) right after the percent symbol denotes 
    that the datum read by this format specifier is not to be stored
    in a variable. No argument behind the format string should be included
    for this dropped variable.



An example of a format string is
================================

    "%7d%s %c%lf"

    The above format string scans the first seven characters as a 
    decimal integer, then reads the remaining as a string until a 
    space, new line or tab is found, then scans the first non-whitespace 
    character following and a double-precision floating-point number afterwards.

*/

