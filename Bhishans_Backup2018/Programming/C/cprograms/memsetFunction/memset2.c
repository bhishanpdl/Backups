//topic: Using memset(), memcpy(), and memmove() in C
// source: http://www.java-samples.com/showtutorial.php?tutorialid=591

/* Demonstrating memset(), memcpy(), and memmove(). */

 #include <stdio.h>  // memset doesnot require stdlib.h
 #include <string.h> // for strcpy
 

 char message1[60] = "Four score and seven years ago ...";
 char message2[60] = "abcdefghijklmnopqrstuvwxyz"; // (a=1,e=5,g=7,n=14,o=15,q=17)
 char temp[60];

 int main(){
 
    printf("\nmessage1[] before memset():\t%s", message1); // Four score and seven years ago ... 
    memset(message1 + 5, '#', 10);					       // 6th thru 15th char are #
    printf("\nmessage1[] after memset():\t%s", message1);  // Four ##########seven years ago ...

    strcpy(temp, message2);
    printf("\n\nOriginal message: %s", temp); // abcdefghijklmnop qrstuvwxyz
    memcpy(temp + 4, temp + 16, 10); // total = 10 , FROM: 17-27 (q thru z), TO 5-15 (e thru n)
    printf("\nAfter memcpy() without overlap:\t%s", temp); // abcd qrstuvwxyz opqrstuvwxyz  ( e-n replaced by q-z)
    
    
    strcpy(temp, message2); // When the function tries to copy 10 characters starting at position 4 to position 6,
     						//an overlap of 8 positions occurs. You might expect the letters e through n to be 
     						//copied over the letters g through p.
    memcpy(temp + 6, temp + 4, 10); // Instead, the letters e and f are repeated five times. (e,f)*5 = 10
    printf("\nAfter memcpy() with overlap:\t%s", temp); // abcd efef ghijklklqrstuvwxyz

    strcpy(temp, message2);
    printf("\n\nOriginal message: %s", temp);               // abcdefghijklmnopqrstuvwxyz
    memmove(temp + 4, temp + 16, 10);  // total = 10 , FROM: 17-27 (q thru z), TO 5-15 ( e thru n)
    printf("\nAfter memmove() without overlap:\t%s", temp); // abcd qrstuvwxyz opqrstuvwxyz
    
    
    strcpy(temp, message2);				// abcd efghijklmn opqrstuvwxyz (a=1,e=5,g=7,n=14,o=15,q=17)
    memmove(temp + 6, temp + 4, 10);    // TOTAL =10, FROM = 5-15 (15=o excluded) , TO = 7-17 (17=q will remain intact) 
    printf("\nAfter memmove() with overlap:\t%s\n", temp);  // abcdef efghijklmn qrstuvwxyz
    														    //        7          17  
    
return 0;
 }
/* DO:
	use memmove() instead of memcpy() in case you're dealing with overlapping memory regions.
DON'T 
	try to use memset() to initialize type int, float, or double arrays to any value other than 0. 
*/

/*

The memset() Function

To set all the bytes in a block of memory to a particular value, use memset(). The function prototype is

void * memset(void *dest, int c, size_t count);

The argument dest points to the block of memory. c is the value to set, and count is the number of bytes, starting at dest, to be set. Note that while c is a type int, it is treated as a type char. In other words, only the low-order byte is used, and you can specify values of c only in the range 0 through 255.

Use memset() to initialize a block of memory to a specified value. Because this function can use only a type char as the initialization value, it is not useful for working with blocks of data types other than type char, except when you want to initialize to 0. In other words, it wouldn't be efficient to use memset() to initialize an array of type int to the value 99, but you could initialize all array elements to the value 0. memset() will be demonstrated in program below.
The memcpy() Function

memcpy() copies bytes of data between memory blocks, sometimes called buffers. This function doesn't care about the type of data being copied--it simply makes an exact byte-for-byte copy. The function prototype is

void *memcpy(void *dest, void *src, size_t count);

The arguments dest and src point to the destination and source memory blocks, respectively. count specifies the number of bytes to be copied. The return value is dest. If the two blocks of memory overlap, the function might not operate properly--some of the data in src might be overwritten before being copied. Use the memmove() function, discussed next, to handle overlapping memory blocks. memcpy() will be demonstrated in program below.
The memmove() Function

memmove() is very much like memcpy(), copying a specified number of bytes from one memory block to another. It's more flexible, however, because it can handle overlapping memory blocks properly. Because memmove() can do everything memcpy() can do with the added flexibility of dealing with overlapping blocks, you rarely, if ever, should have a reason to use memcpy(). The prototype is

void *memmove(void *dest, void *src, size_t count);

dest and src point to the destination and source memory blocks, and count specifies the number of bytes to be copied. The return value is dest. If the blocks overlap, this function ensures that the source data in the overlapped region is copied before being overwritten. Sample program below demonstrates memset(), memcpy(), and memmove().
*/

/*
ANALYSIS: The operation of memset() is straightforward. Note how the pointer notation message1 + 5 is used to specify that memset() is to start setting characters at the sixth character in message1[] (remember, arrays are zero-based). As a result, the 6th through 15th characters in message1[] have been changed to @.

When source and destination do not overlap, memcpy() works fine. The 10 characters of temp[] starting at position 17 (the letters q through z) have been copied to positions 5 though 14, where the letters e though n were originally located. If, however, the source and destination overlap, things are different. When the function tries to copy 10 characters starting at position 4 to position 6, an overlap of 8 positions occurs. You might expect the letters e through n to be copied over the letters g through p. Instead, the letters e and f are repeated five times.

If there's no overlap, memmove() works just like memcpy(). With overlap, however, memmove() copies the original source characters to the destination.
*/
