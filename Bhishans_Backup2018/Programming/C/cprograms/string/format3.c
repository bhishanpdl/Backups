
 
#include <stdio.h>
#include <string.h>
 
int main() {

	char 	str1[128];  
	
    char*   fmt = "%[^]0-9-]"; 	// For instance, [^]0-9-] means the set "everything except close bracket,
    						 		// zero through nine, and hyphen".
    						 	
    	
    
   	printf ("\nEnter str1: ");  // type or paste : Hello there are 9 numbers in str1 [98]
   	scanf (fmt, str1);          // we must enter ] or digits or hyphen to end the string ( enter doesnot end)
   	
   	
   	printf ("\nstr1 = %s", str1);
   	
   	char str2[128] = "Hello there are 9 numbers in str1 [98]";
   	sscanf(fmt, str2);
   	printf("\nstr2 = %s", str2);
   	printf("\n\n");
 
	return 0;
}
