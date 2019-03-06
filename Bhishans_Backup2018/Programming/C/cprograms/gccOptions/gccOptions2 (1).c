//topic   : gcc Options
//ref     : http://www.rapidtables.com/code/linux/gcc.htm
//compile : 
//run     : ./gccOptions -O2 3 4
//note    : O2 is optimization
//terminal: clear; gcc -o gccOptions gccOptions2.c && ./gccOptions2 3 4


#include<stdio.h>
#include<stdlib.h>
#include<string.h>
 
 int main(int argc, char **argv)
{
  int a, b, i;
  float c;
  a = atoi(argv[1]);
  b = atoi(argv[2]);
  c = a/b;
  printf("%d/%d = %f\n",a,b,c);
  
  return 0;
}

/*
GCC syntax

$ gcc [options] [source files] [object files] [-o output file]



GCC main options:
option 	            description
gcc -c 	            compile source files to object files without linking
gcc -Dname[=value] 	define a preprocessor macro
gcc -fPIC 	        generate position independent code for shared libraries
gcc -glevel 	        generate debug information to be used by GDB
gcc -Idir 	        add include directory of header files
gcc -llib 	        link with library file
gcc -Ldir 	        look in directory for library files
gcc -o output file 	write build output to output file
gcc -Olevel         	optimize for code size and execution time
gcc -shared 	        generate shared object file for shared library
gcc -Uname 	        undefine a preprocessor macro
gcc -w 	            disable all warning messages
gcc -Wall 	        enable all warning messages
gcc -Wextra 	        enable extra warning messages

*/
