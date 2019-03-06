//topic: operators in C
//source: http://tigcc.ticalc.org/doc/opers.html#shift
//source: http://www.cs.mun.ca/~michael/c/op.html
//source: http://www.tutorialspoint.com/cprogramming/c_operators.htm

#include <stdio.h>

int main(){

   unsigned int a = 60;	/* 60 = 0011 1100 */  
   unsigned int b = 13;	/* 13 = 0000 1101 */
   int c = 0;           

   c = a & b;       /* 12 = 0000 1100 */   // Binary AND Operator(opp of OR)
   printf("Line 1 - Value of c is %d\n", c );

   c = a | b;       /* 61 = 0011 1101 */   // Binary OR Operator 
   printf("Line 2 - Value of c is %d\n", c ); 

   c = a ^ b;       /* 49 = 0011 0001 */   // Binary XOR Operator
   printf("Line 3 - Value of c is %d\n", c );

   c = ~a;          /*-61 = 1100 0011 */   // Binary Ones Complement Operator
   printf("Line 4 - Value of c is %d\n", c );

   c = a << 2;     /* 240 = 1111 0000 */   // Binary Left Shift Operator
   printf("Line 5 - Value of c is %d\n", c );

   c = a >> 2;     /* 15 = 0000 1111 */       // Binary Right Shift Operator.
   printf("Line 6 - Value of c is %d\n", c ); // The left operands value is moved right by
   											  // the number of bits specified by the right
   											  // operand. 
   
   return 0;
}


/*

<<
    returns expr1 shifted left expr2 bit positions; 0 bits are shifted into the low order bits. Mathematically equivalent to expr1 * 2expr2 (note that there is no exponentiation operator in C, nor in netscape 1.1n :-)). 
>>
    returns expr1 shifted right expr2 bit positions; if the type of expr1 is signed, 1 bits are shifted into the high order bits, otherwise 0 bits are shifted in. Mathematically equivalent to expr1 / 2expr2. 

Example:

b = 0x12 << 2
b is assigned the value 0x48. 
*/

/*
Bitwise Operators

Bitwise operator works on bits and perform bit-by-bit operation. The truth tables for &, |, and ^ are as follows:
p	q	p & q	p | q	p ^ q      	AND IS COMPLEMENT OF OR
0 	0 	0 		0 		0
0 	1 	0 		1 		1
1 	1 	1 		1 		0
1 	0 	0 		1 		1

Assume if A = 60; and B = 13; now in binary format they will be as follows:

A = 0011 1100

B = 0000 1101

-----------------

A&B = 0000 1100		binary AND

A|B = 0011 1101		binary OR

A^B = 0011 0001		binary XOR

~A  = 1100 0011		binary	COMPLEMENT

A << 2 will give 240 which is 1111 0000

A >> 2 will give 15 which is 0000 1111


*/
