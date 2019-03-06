// program   : fitsread2.c
// to compile: gcc fitsread2.c -O2 -lcfitsio -lm -pthread
// to run    : ./a.out in.fits
// Usage     : opens a fits file from the argument and read the keywords and prints them
// reference : CFITSIO User’s Reference Guide
// reference : https://heasarc.gsfc.nasa.gov/docs/software/fitsio/quick/node4.html
// note      : we can use fv or ds9 to read header keyword of a given fits file and can export as text

// terminal  : clear;gcc fitsread2.c -O2 -lcfitsio -lm -pthread;./a.out in.fits
// terminal  : clear;gcc fitsread2.c -o fitsread -O2 -lcfitsio -lm -pthread;./fitsread2 in.fits

#include <string.h>
#include <stdio.h>
#include "fitsio.h"

int main(int argc, char *argv[])
{
  
    fitsfile	*fptr;      //fitsfile pointer
    int 		status = 0; // MUST initialize status 
    int 		nkeys;      //total no. of keywords in header(from get hdrspace)
    int			ii;         //counter to print all header keywords
    
    //#define FLEN_CARD 81  / max length of a FITS header card (in-built)
    char 		card[FLEN_CARD]; 
 
    //opening fits file from the argument
    fits_open_file(&fptr, argv[1], READONLY, &status);
    
    //reading the header keywords
    fits_get_hdrspace(fptr, &nkeys, NULL, &status);
//  fits_get_hdrspace(         fptr ,        &nkeys   ,     NULL     ,     &status)
//  fits_get_hdrspace(fitsfile *fptr, > int *keysexist, int *morekeys, int *status)


//    fits_read_record (         fptr ,     1     ,        card,      &status)
//int fits_read_record (fitsfile *fptr, int keynum, > char *card, int *status)

    //reading the nth header record in the CHU ( current header unit)
    fits_read_record(fptr, 1, card, &status);  // 1 is first keyword, not 0
	    printf("%s\n", card);
    
 
    /* 
    //readign and printing all the keywords
    for (ii = 1; ii <= nkeys; ii++) 
    {
	    fits_read_record(fptr, ii, card, &status); 	// read keyword 
	    printf("%s\n", card);	
    }
    
    */

    
    //printf("END\n\n"); 								// terminate listing with END

    fits_close_file(fptr, &status);

    if (status) 										// print any error messages
    fits_report_error(stderr, status);


    return(status);
}

/******************************************************************************
 A FITS file consists of one or more Header + Data Units (HDUs),
  where the first HDU is called
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

******************************************************************************/

/****************************************************************************** 
    This program opens the specified FITS file and prints out all the header
    keywords in the current HDU. Some other points to notice
    about the program are:

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
******************************************************************************/

/******************************************************************************
Keyword Reading Routines
========================
    Return the number of existing keywords (not counting the END keyword)
    and the amount of
    space currently available for more keywords.
    It returns morekeys = -1 if the header has not
    yet been closed. Note that CFITSIO will dynamically
    add space if required when writing new
    keywords to a header so in practice there is no limit to the number
    of keywords that can be
    added to a header. A null pointer may be entered for the
    morekeys parameter if it’s value is
    not needed.

int fits_get_hdrspace / ffghsp
(fitsfile *fptr, > int *keysexist, int *morekeys, int *status)

******************************************************************************/

/****************************************************************************** 
    fits read record
   ================
    Return the nth header record in the CHU.
    The first keyword in the header is at keynum =1;
    if keynum = 0 then these routines simply reset
    the internal CFITSIO pointer to the
    beginning of the header so that subsequent keyword
    operations will start at the top of the
    header (e.g., prior to searching for keywords using
    wild cards in the keyword name). The first
    routine returns the entire 80-character header record
    (with trailing blanks truncated), while
    the second routine parses the record and returns
    the name, value, and comment fields as
    separate (blank truncated) character strings.
    If a NULL comment pointer is given on input,
    then the comment string will not be returned.
    
    int fits_read_record / ffgrec
(fitsfile *fptr, int keynum, > char *card, int *status)

int fits_read_keyn / ffgkyn
(fitsfile *fptr, int keynum, > char *keyname, char *value,
char *comment, int *status)

******************************************************************************/

/****************************************************************************** 
header keywords exported from fv
====================================================================
SIMPLE  =                    T / file does conform to FITS standard
BITPIX  =                   16 / number of bits per data pixel
NAXIS   =                    2 / number of data axes
NAXIS1  =                  300 / length of data axis 1
NAXIS2  =                  200 / length of data axis 2
EXTEND  =                    T / FITS dataset may contain extensions
COMMENT   FITS (Flexible Image Transport System) format is defined in 'Astronomy
COMMENT   and Astrophysics', volume 376, page 359; bibcode: 2001A&A...376..359H
EXPOSURE=                 1500 / Total Exposure Time
END
******************************************************************************/


/******************************************************************************
String Lengths, for use when allocating character arrays:
===========================================================

#define FLEN_FILENAME   1025/ max length of a filename

#define FLEN_KEYWORD    72  /max length of a keyword

#define FLEN_CARD       81  / max length of a FITS header card

#define FLEN_VALUE      71  / max length of a keyword value string

#define FLEN_COMMENT    73  / max length of a keyword comment string

#define FLEN_ERRMSG     81  / max length of a CFITSIO error message

#define FLEN_STATUS     31  / max length of a CFITSIO status text string
 
Note that FLEN_KEYWORD is longer than the nominal 8-character keyword

******************************************************************************/
