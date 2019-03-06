//topic     : datatypes in c program
//ref       : https://en.wikipedia.org/wiki/C_data_types
//terminal  : clear; 

//type specifiers    : char int float double
//optional specifiers: signed, unsigned, short, long etc
//format specifiers  : %c, %d etc ( d is decimal digit)

#include<stdio.h>

int main()
{

char                    var1 = 'a';	  // %c
signed char             var2 = 'a';	  // %c (or %hhi for numerical output)
unsigned char 	         var3 = 'a';      // %c (or %hhu for numerical output)

short                   var4 = 5;        // %hi
short int               var5 = 5;        // Short signed integer type
signed short            var6 = -5;       // [−32767,+32767] 
signed short int 	    var7 = 5;        // 16 bits

unsigned short          var8 = 5;
unsigned short int 	    var9 = 5; 	      // %hu

int                     var10 = 5;      // Basic signed integer type %i or %d
signed int 	         var11 = 5;      // [−32767,+32767] 16 bits
                                                                 
unsigned                var12 = 5;
unsigned int 	         var13 = 5; 	 // %u


long                    var14 = 5;      // [−2147483647,+2147483647]
long int                var15 = 5;      // 32 bits
signed long             var16 = 5;      // %li
signed long int 	    var17 = 5;

unsigned long           var18 = 5;      // %lu
unsigned long int       var19 = 5;

long long               var20 = 5;      // [−9223372036854775807,+9223372036854775807]
long long int           var21 = 5;      // 64 bits
signed long long        var22 = 5;      // %lli
signed long long int    var23 = 5;

unsigned long long      var24 = 5;      // %llu
unsigned long long int  var25 = 5;      // %llu

float                   var26 = 0.5;    // single precision %f 
                                        //promoted automatically to double for printf

double 	 	         var27 = 0.5;    // double precision %f and %lf for scanf()
long double 	         var28 = 0.5;    // quadruple-precision  %Lf

printf("var28 = %Lf\n", var28);

return 0;
}

/****************************************************************************************
ref: http://fresh2refresh.com/c/c-data-types/

There are four data types in C language. 
=========================================
Data Types
1 	Basic data types 	    int, char, float, double
2 	Enumeration data type 	enum
3 	Derived data type 	    pointer, array, structure, union
4 	Void data type 	        void

Modifiers in C:
================

    The amount of memory space to be allocated for a variable is derived by modifiers.
    Modifiers are prefixed with basic data types to modify (either increase or decrease) 
    the amount of storage space allocated to a variable.
    For example, storage space for int data type is 4 byte for 32 bit processor. 
    We can increase the range by using long int which is 8 byte. We can decrease the 
    range by using short int which is 2 byte.

    There are 5 modifiers available in C language. They are,

    short     h
    long      l
    signed    
    unsigned  u
    long long ll


S.N 	Data types 	    Storage Size 	 Range

1 	char 	                1 	    –127 to 127
2 	int         	            2 	    –32,767 to 32,767
3 	float 	                4 	    1E–37 to 1E+37 with six digits of precision
4 	double 	                8 	    1E–37 to 1E+37 with ten digits of precision
5 	long double 	            10 	    1E–37 to 1E+37 with ten digits of precision
6 	long int 	            4 	    –2,147,483,647 to 2,147,483,647
7 	short int 	            2 	    –32,767 to 32,767
8 	unsigned short int 	    2 	    0 to 65,535
9 	signed short int 	    2 	    –32,767 to 32,767
10 	long long int 	        8 	    –(2power(63) –1) to 2(power)63 –1
11 	signed long int 	        4 	    –2,147,483,647 to 2,147,483,647
12 	unsigned long int 	    4 	    0 to 4,294,967,295
13 	unsigned long long int 	8 	    2(power)64 –1

Description
============
1. Basic data types in C:
1.1. Integer data type:

    Integer data type allows a variable to store numeric values.
    “int” keyword is used to refer integer data type.
    The storage size of int data type is 2 or 4 or 8 byte.
    It varies depend upon the processor in the CPU that we use. 
     If we are using 16 bit processor, 2 byte  (16 bit) of memory will be allocated for int data type.
    Like wise, 4 byte (32 bit) of memory for 32 bit processor and 8 byte (64 bit)
     of memory for 64 bit processor is allocated for int datatype.
    int (2 byte) can store values from -32,768 to +32,767
    int (4 byte) can store values from -2,147,483,648 to +2,147,483,647.
    If you want to use the integer value that crosses the above limit,
     you can go for “long int” and “long long int” for which the limits are very high.

Note:

    We can’t store decimal values using int data type.
    If we use int data type to store decimal values,
     decimal values will be truncated and we will get only whole number.
    In this case, float data type can be used to store decimal values in a variable.

1.2. Character data type:

    Character data type allows a variable to store only one character.
    Storage size of character data type is 1. 
    We can store only one character using character data type.
    “char” keyword is used to refer character data type.
    For example, ‘A’ can be stored using char datatype. 
    You can’t store more than one character using char data type.
    Please refer C – Strings topic to know how to store more than one characters in a variable.

1.3. Floating point data type:

Floating point data type consists of 2 types. They are,

    float
    double

1. float:

    Float data type allows a variable to store decimal values.
    Storage size of float data type is 4. 
    This also varies depend upon the processor in the CPU as “int” data type.
    We can use up-to 6 digits after decimal using float data type.
    For example, 10.456789 can be stored in a variable using float data type.

2. double:

    Double data type is also same as float data type which allows up-to 10 digits after decimal.
    The range for double datatype is from 1E–37 to 1E+37.



*****************************************************************************/
