#include <stdio.h>

int main(int argc, char *argv[])
{
    int areas[] = {10, 12, 13, 14, 20}; // quantity inside {} is called initializer
    
    char name[] = "Zed";
    
    char full_name[] = {
        'Z', 'e', 'd',
         ' ', 'A', '.', ' ',
         'S', 'h', 'a', 'w', '\0'	//if we remove \0 it will count 11 , however display full_name will be same
    };

    // WARNING: On some systems you may have to change the
    // %ld in this code to a %u since it will use unsigned ints
    
    printf("The size of an int: %ld\n", sizeof(int));	// 4 (one intger has size 4 bytes)
    
    printf("The size of areas (int[]): %ld\n",		// 20
            sizeof(areas));
            
    printf("The number of ints in areas: %ld\n",	// 5
            sizeof(areas) / sizeof(int));
            
    printf("The first area is %d, the 2nd %d.\n",	// 10 and 20
            areas[0], areas[1]);

    printf("The size of a char: %ld\n", sizeof(char));	// 1 (one character has size 1 byte)
    
    printf("The size of name (char[]): %ld\n",		// 4 note: name = "Zed" has 3 characters and \0 is also added to the string.
            sizeof(name));
            
    printf("The number of chars: %ld\n",		// 4
            sizeof(name) / sizeof(char));

    printf("The size of full_name (char[]): %ld\n",	// 12
            sizeof(full_name));
    printf("The number of chars: %ld\n",
            sizeof(full_name) / sizeof(char));		// 12

    printf("name=\"%s\" and full_name=\"%s\"\n", 	// name="Zed" and full_name="Zed A. Shaw"	
            name, full_name);

    return 0;
}
