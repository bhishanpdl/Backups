/* 
 * topic: rewind example code 
 * void rewind(FILE *stream);
 * source: http://code-reference.com/c/stdio.h/rewind 
 */
 
#include <stdio.h> /* including standard library */
//#include <windows.h> /* uncomment this for Windows */
 
 
int main (void) {
  	FILE *stream;
  	int c;
  	long seek_position;
 
  	seek_position = 15;
 
  	stream = fopen("test.txt", "r" );
 	
 	//checking for error
    if (stream == 0) {
        perror("cannot open file");
        return 0;
    }
 	
 	//getting and printing file contents
    while( (c=getc(stream)) != EOF) {
      putc(c, stdout);
    }
 
    /* Set Position with rewind to the beginning of the file */
    rewind(stream);
    printf ("\n");
 
    /* SET SEEK CUR to 20 char of the file */
    fseek(stream, seek_position, SEEK_CUR );
 
    while( (c=getc(stream)) != EOF) {
        putc(c, stdout);
    }


    printf ("\n");
    return 0;
}

