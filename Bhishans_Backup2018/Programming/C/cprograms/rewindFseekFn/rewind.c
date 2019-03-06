//topic: rewind
//source: http://beej.us/guide/bgc/output/html/multipage/fseek.html
//syntax:
// int fseek(FILE *stream, long offset, int whence);
// void rewind(FILE *stream);
// whence = SEEK_SET or SEEK_CUR or SEEK_END

// rewind is a library function defined in stdio.h
// In the C Programming Language, the rewind function sets the file position
// to the beginning of the file for the stream pointed to by stream.
// It also clears the error and end-of-file indicators for stream.

#include <stdio.h> /* including standard library */

 
int main (void) {

	FILE *stream;
	int c;
	long seek_position;
 
	seek_position = 21;
 
	stream=fopen("test.txt", "r" );
	if (stream == 0) {
		perror("cannot open file");
	return 0;
	}
 
	fseek(stream, 0L, SEEK_SET);
	while( (c=getc(stream)) != EOF) {
    		putc(c, stdout);
	}
 
	/* SET SEEK CUR to 20 char of the file */
	fseek(stream, 0L, SEEK_SET);
	fseek(stream, seek_position, SEEK_CUR ); // seek_position = 21
 
	while( (c=getc(stream)) != EOF) {
    		putc(c, stdout);
	}
 
return 0;
}

// note:
// The C language defines an constant integer such as 0 to be of type int.
// Appending an L defines the constant as a long.
// example:
// long l = 0; // Assigns "const int literal 0" to "long variable l"
// long l = 0L; // Assigns "const long literal 0" to "long variable l"

/*

SEEK_SET

    offset is relative to the beginning of the file. This is probably what 
    you had in mind anyway, and is the most commonly used value for whence.
SEEK_CUR

    offset is relative to the current file pointer position. So, in effect,
     you can say, "Move to my current position plus 30 bytes," or, "move to 
     my current position minus 20 bytes."
SEEK_END

    offset is relative to the end of the file. Just like SEEK_SET except from 
    the other end of the file. Be sure to use negative values for offset
     if you want to back up from the end of the file, instead of going past 
     the end into oblivion.

*/

/* Return Value
For fseek(), on success zero is returned; -1 is returned on failure.

The call to rewind() never fails.
*/

/* Examples:
fseek(fp, 100, SEEK_SET); // seek to the 100th byte of the file
fseek(fp, -30, SEEK_CUR); // seek backward 30 bytes from the current pos
fseek(fp, -10, SEEK_END); // seek to the 10th byte before the end of file

fseek(fp, 0, SEEK_SET);   // seek to the beginning of the file
rewind(fp);               // seek to the beginning of the file

*/
