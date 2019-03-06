//topic: command Line Arguments
// source: http://www.tutorialspoint.com/cprogramming/c_command_line_arguments.htm

// Description:
// The command line arguments are handled using main() function arguments where 
// argc refers to the number of arguments passed, and argv[] is a pointer array
//  which points to each argument passed to the program.

#include <stdio.h>

int main( int argc, char *argv[] )  {
   if( argc == 2 )
         printf("The argument supplied is = %s\n", argv[1]);
   
   else if( argc > 2 )
      printf("Too many arguments supplied.\n");
   
   else
      printf("One argument expected.\n");
   
   return 0;
}
