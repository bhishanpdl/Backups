//topic: operators in C
//source: https://stackoverflow.com/questions/141525/what-are-bitwise-shift-bit-shift-operators-and-how-do-they-work

#include <stdio.h>
#include <math.h>

int main(){

   int 	a = 6 << 1;								// 6  = 0000 0110 => 6 * 2^1
   int  b = 6 << 2;                             // 6  = 0000 0110 => 6 * 2^2
   												// 12 = 0000 1100 ( last is 	padded with 0)
   printf("\nThe results are:  %d %d \n", a, b);
   
   /*****************************************************************************************
    * right shift operator ( dividing by power of 2 )
    * In this case instead of zero, it pads with the most significant bit)
    *  This is because the most significant bit is the sign bit, or the bit 
    * that distinguishes positive and negative numbers. 
    * By padding with the most significant bit, the arithmetic right shift is sign-preserving.
    *
    */
    
    int c = 2147483744 >> 4;   	// c = 10000000 00000000 00000000 01100000 = 2147483744
    								//     11111000 00000000 00000000 00000110 = 134217734
    								// 96 = 01100000 
    
    printf("\nThe results is:  %d \n", c);
    
    

	// Find the nearest power of two greater or equal to given number:
    int given = 5;
    int d;
    
    d = 1 << (int)(ceil(log2(given)));
    
    printf("\nThe results is:  %d \n", d);
    
   
   return 0;
}



/*
Left shift (<<)

Integers are stored, in memory, as a series of bits. For example, the number 6 stored as a 32-bit int would be:

00000000 00000000 00000000 00000110

Shifting this bit pattern to the left one position (6 << 1) would result in the number 12:

00000000 00000000 00000000 00001100

As you can see, the digits have shifted to the left by one position, and the last digit on the right is filled with a zero. You might also note that shifting left is equivalent to multiplication by powers of 2. So 6 << 1 is equivalent to 6 * 2, and 6 << 3 is equivalent to 6 * 8. A good optimizing compiler will replace multiplications with shifts when possible.
Non-circular shifting

Please note that these are not circular shifts. Shifting this value to the left by one position (3,758,096,384 << 1):

11100000 00000000 00000000 00000000

results in 3,221,225,472:

11000000 00000000 00000000 00000000

The digit that gets shifted "off the end" is lost. It does not wrap around.
Logical right shift (>>>)

A logical right shift is the converse to the left shift. Rather than moving bits to the left, they simply move to the right. For example, shifting the number 12:

00000000 00000000 00000000 00001100

to the right by one position (12 >>> 1) will get back our original 6:

00000000 00000000 00000000 00000110

So we see that shifting to the right is equivalent to division by powers of 2.
Lost bits are gone

However, a shift cannot reclaim "lost" bits. For example, if we shift this pattern:

00111000 00000000 00000000 00000110

to the left 4 positions (939,524,102 << 4), we get 2,147,483,744:

10000000 00000000 00000000 01100000

and then shifting back ((939,524,102 << 4) >>> 4) we get 134,217,734:

00001000 00000000 00000000 00000110

We cannot get back our original value once we have lost bits.
Arithmetic right shift (>>)

The arithmetic right shift is exactly like the logical right shift, except instead of padding with zero, it pads with the most significant bit. This is because the most significant bit is the sign bit, or the bit that distinguishes positive and negative numbers. By padding with the most significant bit, the arithmetic right shift is sign-preserving.

For example, if we interpret this bit pattern as a negative number:

10000000 00000000 00000000 01100000

we have the number -2,147,483,552. Shifting this to the right 4 positions with the arithmetic shift (-2,147,483,552 >> 4) would give us:

11111000 00000000 00000000 00000110

or the number -134,217,722.

So we see that we have preserved the sign of our negative numbers by using the arithmetic right shift, rather than the logical right shift. And once again, we see that we are performing division by powers of 2.
*/
