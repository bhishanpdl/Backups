// topic     : fitsio
// fits      : Flexible Image Transport System
// to compile: gcc fitsread.c -O2 -lcfitsio -lm -pthread
// to run    : ./a.out in.fits
// reference : CFITSIO User’s Reference Guide
// source    : https://heasarc.gsfc.nasa.gov/docs/software/fitsio/quick/node4.html
/// filepath : cd /Users/poudel/Copy/Programming/C/cprograms/cfitsio/fitsexamples
// terminal  : clear ; gcc fitsopen2.c -lm -lcfitsio && ./a.out in.fits
// terminal  : clear ; gcc fitsopen2.c -o fitsopen2 -lm -lcfitsio && ./fitsopen2 in.fits

#include <string.h>
#include <stdio.h>
#include "fitsio.h"

int main(int argc, char *argv[]){
  
	fitsfile		*fptr;
	char 		card[FLEN_CARD];
	int 			status = 0;     						/* MUST initialize status */
	int 			nkeys;
	int			ii; 
 
	fits_open_file(&fptr, argv[1], READONLY, &status);
	fits_get_hdrspace(fptr, &nkeys, NULL, &status);
 
	for (ii = 1; ii <= nkeys; ii++) {
	fits_read_record(fptr, ii, card, &status); 	/* read keyword */
	printf("%s\n", card);	
	}

	printf("END\n\n"); 								/* terminate listing with END */

	fits_close_file(fptr, &status);

	if (status) 										/* print any error messages */
	fits_report_error(stderr, status);


	return(status);
}

/*
 A FITS file consists of one or more Header + Data Units (HDUs), where the first HDU is called
 the ‘Primary HDU’, or ‘Primary Array’. The primary array contains an N-dimensional array of
 pixels, such as a 1-D spectrum, a 2-D image, or a 3-D data cube. Six different primary data types
 are supported: Unsigned 8-bit bytes, 16-bit, 32-bit, and 64-bit signed integers, and 32 and 64-bit
 floating point reals. FITS also has a convention for storing 16 and 32-bit unsigned integers (see the
 later section entitled ‘Unsigned Integers’ for more details). The primary HDU may also consist of
 only a header with a null array containing no data pixels.
 
 Any number of additional HDUs may follow the primary array; these additional HDUs are called
 FITS ‘extensions’. There are currently 3 types of extensions defined by the FITS standard:
 • Image Extension - a N-dimensional array of pixels, like in a primary array
 • ASCII Table Extension - rows and columns of data in ASCII character format
 • Binary Table Extension - rows and columns of data in binary representation
 In each case the HDU consists of an ASCII Header Unit followed by an optional Data Unit. For
 historical reasons, each Header or Data unit must be an exact multiple of 2880 8-bit bytes long.
 Any unused space is padded with fill characters (ASCII blanks or zeros).

*/

/* This program opens the specified FITS file and prints out all the header
  keywords in the current HDU. Some other points to notice about the program are:

    The fitsio.h header file must be included to define the various routines 
    and symbols used in CFITSIO.

    The fitsfile parameter is the first argument in almost every CFITSIO routine.
     It is a pointer to a structure (defined in fitsio.h) that stores information
      about the particular FITS file that the routine will operate on. Memory for 
      this structure is automatically allocated when the file is first opened or
       created, and is freed when the file is closed.
    Almost every CFITSIO routine has a status parameter as the last argument. 
    The status value is also usually returned as the value of the function itself.
     Normally status = 0, and a positive status value indicates an error of some sort. 
     The status variable must always be initialized to zero before use, because
      if status is greater than zero on input then the CFITSIO routines will 
      simply return without doing anything. This `inherited status' feature,
       where each CFITSIO routine inherits the status from the previous routine,
        makes it unnecessary to check the status value after every single
         CFITSIO routine call. Generally you should check the status after 
         an especially important or complicated routine has been called, 
         or after a block of closely related CFITSIO calls. This example 
         program has taken this feature to the extreme and only checks the 
         status value at the very end of the program.

    In this example program the file name to be opened is given as an argument
     on the command line (arg[1]). If the file contains more than 1 HDU or extension,
      you can specify which particular HDU to be opened by enclosing the name or
       number of the HDU in square brackets following the root name of the file.
        For example, file.fts[0] opens the primary array, while file.fts[2] 
        will move to and open the 2nd extension in the file, and file.fit[EVENTS]
         will open the extension that has a EXTNAME = 'EVENTS' keyword in the header.
          Note that on the Unix command line you must enclose the file name in 
          single or double quote characters if the name contains special 
          characters such as `[' or `]'.

    All of the CFITSIO routines which read or write header keywords,
     image data, or table data operate only within the currently opened HDU
      in the file. To read or write information in a different HDU you must 
      first explicitly move to that HDU (see the fits_movabs_hdu and 
      fits_movrel_hdu routines in section 4.3).

    The fits_report_error routine provides a convenient way to print out 
    diagnostic messages about any error that may have occurred.
*/

