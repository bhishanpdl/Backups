// topic: sscanf with delimiter ()
// ref  : http://stackoverflow.com/questions/12399186/sscanf-function-usage-in-c
// cmd  : clear; gcc sscanf2.c && ./a.out

#include <stdio.h>
#include<string.h>

int main(void)
{
    char part1[32];
    char part2[32];
    char command[64] = "hello how are you? (long time no see)";
    //                  0     6   10  14   19         30     36+ NULL 
    
    printf("the length of string is %lu\n", strlen(command)); //37    

    sscanf(command, "%36[^(](%31[^)])", part1, part2);
        
    
    printf("Part1 = %s \nPart2 = %s\n", part1, part2);
        
        
        
    return 0;
}
/* 

 The %[...] notation is a conversion specification; so is %31[...].  

 The C standard says:  

     Each conversion specification is introduced by the character %.
     After the %,the following appear in sequence:  

         An optional assignment-suppressing character *.  
         An optional decimal integer greater than zero that specifies the maximum field width (in characters).  
         An optional length modifier that specifies the size of the receiving object.  
         A conversion specifier character that specifies the type of conversion to be applied.  

 The 36 is an example of the (optional) maximum field width.
 The [...] part is a scanset, which could perhaps be 
 regarded as a special case of the s conversion specifier.
 The %s conversion specifier is approximately equivalent to %[^ \t\n].  

 The 36 is one less than the length of the string;
 the null at the end is not counted in that length.
 Since part1 and part2 are each
 an array of 37 char, the %36[^(] or %36[^)] conversion specifiers prevent buffer overflows.
 If the first string of characters was more
 than 36 characters before the (, you'd get a return value of 1 because
 of a mismatch on the literal open parenthesis. Similarly, 
 the second string would be limited to 36 characters,
 but you'd not easily be able to tell whether the ) was in the correct place or not.
 
 */  
