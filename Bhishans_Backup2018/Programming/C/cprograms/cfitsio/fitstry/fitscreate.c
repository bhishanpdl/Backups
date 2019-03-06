// topic     : fitsio
// filepath  : cd /Users/poudel/Copy/Programming/C/cprograms/fitsio/fitstry
// to compile: gcc fitscreate.c -O2 -lcfitsio -lm -pthread
// to run    : ./a.out test1.fits
// to run    : ./a.out
// terminal  : clear; gcc fitscreate.c -O2 -lcfitsio -lm -pthread && ./a.out \!test1.fits
// aliter    : clear; gcc fitscreate.c -O2 -lcfitsio -lm -pthread && ./a.out test1.fits
// reference : CFITSIO User’s Reference Guide

/*  This program creates a new FITS file, containing a FITS image.
 *  An ‘EXPOSURE’ keyword is
 *  written to the header, then the image data are written to the FITS file
 *  before closing the FITS file.
 */

#include<stdio.h>
#include "fitsio.h" // required by every program that uses CFITSIO 


int main(int argc, char *argv[])
{

	fitsfile 	*fptr;      // pointer to the FITS file; defined in fitsio.h
	int 		    status = 0; // initialize status before calling fitsio routines
	int         ii, jj;     // counters
	long 		fpixel = 1;
	long        naxis = 2;  // dimension of the image ( 2d plane image)
	long        nelements;  // total pixels in the image = col * row
	long        exposure;
	long 		naxes[2] = { 5, 10 }; // image is 5 pixels wide by 10 rows 
	short 		array[10][5];         // col = 5, row = 10
	
	// char        filename[] = argv[1]; // error: invalid initializer
	
	//char      filename[] =  "test1.fits"; // if we write "\!testfit.fits" we dont need remove function
	//then, change all argv[1] to filename
	//terminal: clear; gcc fitscreate.c -O2 -lcfitsio -lm -pthread && ./a.out
	
	//Deleteing old file if it already exists (defined inside stdio.h)
	remove(argv[1]);                
	

    //step 1: first we create an empty fits file
	fits_create_file(&fptr, argv[1], &status); // we can also create .fit or .fit.gz, 
	//fits_create_file(         &fptr ,      "\!testfile.fits",       &status)
    //fits_create_file(fitsfile **fptr, char *filename        , > int *status)
    
    //step 2: then we create empty image extension in that file
	// Create the primary array image (16-bit short integer pixels
	fits_create_img(fptr, SHORT_IMG, naxis, naxes, &status);
	//fits_create_img(         fptr  , SHORT_IMG ,     naxis,      naxes  ,       &status)
	//fits_create_img(fitsfile *fptr , int bitpix, int naxis, long *naxes , > int *status)
	
	//optional: we may update the keywords
	//updating the keyword 'exposure'
	// Write a keyword; must pass the ADDRESS of the value 
	exposure = 1500;
	fits_update_key(fptr, TLONG, "EXPOSURE", &exposure, "Total Exposure Time", &status);
    //fits_update_key(         fptr , TLONG        , "EXPOSURE"   , &exposure    , "Total Exposure Time", &status);
    //fits_update_key(fitsfile *fptr, char *keyname, DTYPE *numval, int decimals ,   char *comment      , > int *status)
    
    //step 3: before writing image, we initialize the values
	// Initialize the values in the image with a linear ramp function 
	for (jj = 0; jj < naxes[1]; jj++)       // naxes[1] = 10 is number of rows
	for (ii = 0; ii < naxes[0]; ii++)       // naxes[0] = 5 is number of clms
	    array[jj][ii] 	= (ii + jj) ;
	    
	nelements 		= naxes[0] * naxes[1]; // number of pixels to write = 50
	printf("nelements = %ld\n", nelements);

    //step 4: then we write the image in the fits file
	// Writing the array of integers to the image 
	fits_write_img(fptr, TSHORT, fpixel, nelements, array[0], &status);
	//fits_write_img(fitsfile *fptr, TSHORT      , long     fpixel = 1, long     nelements, short array[0], int status = 0);
	//fits_write_img(fitsfile *fptr, int datatype, LONGLONG firstelem , LONGLONG nelements, DTYPE *array  , int *status   )
	
	//last step: we close the file after writing extensions to it, and check for error
	fits_close_file(fptr, &status); // close the file
	fits_report_error(stderr, status); // print out any error messages


	printf("\nLook in the directory, you will see %s\n\n", argv[1]);
	
	return( status );
}
/***************************************************************************************************
   fits functions from fitsio library (note: > is input)
   ======================================================
1. fits_create_file(         &fptr,      "testfile.fits",       &status);

   fits_create_file(fitsfile **fptr, char *filename     , > int *status)
   fits_create_diskfile(fitsfile **fptr, char *filename, > int *status)
   
2. fits_create_img(            fptr , SHORT_IMG,      naxis,      naxes,            &status);
 
   fits_create_img  ( fitsfile *fptr, int bitpix, int naxis, long *naxes    , > int *status)
   fits_create_imgll( fitsfile *fptr, int bitpix, int naxis, LONGLONG *naxes, > int *status)
   
3. fits_update_key(         fptr , TLONG        , "EXPOSURE"   , &exposure    , "Total Exposure Time", &status);
   
   fits_update_key(fitsfile *fptr, char *keyname, char *value  , char *comment, > int  *status)
   fits_update_key(fitsfile *fptr, char *keyname, DTYPE numval , char *comment, > int  *status)
   fits_update_key(fitsfile *fptr, char *keyname, DTYPE numval , int decimals ,   char *comment      , > int *status)   
   fits_update_key(fitsfile *fptr, char *keyname, DTYPE *numval, int decimals ,   char *comment      , > int *status)
   
4. fits_write_img(fptr, TSHORT, fpixel, nelements, array[0], &status);
   
   fits_write_img(fitsfile *fptr, int datatype, LONGLONG firstelem, LONGLONG nelements, DTYPE *array,   int *status)
   fits_write_img(fitsfile *fptr, long group  , LONGLONG firstelem, LONGLONG nelements, DTYPE *array, > int *status)
   fits_write_img(fitsfile *fptr, int datatype, LONGLONG firstelem, LONGLONG nelements, DTYPE *array, DTYPE *nulval, > int *status)
   fits_write_img(fitsfile *fptr, long group  , LONGLONG firstelem, LONGLONG nelements, DTYPE *array, DTYPE nulval , > int *status)
   
5. fits_close_file(fptr, &status);

   fits_close_file (fitsfile *fptr, > int *status)
   fits_delete_file(fitsfile *fptr, > int *status)

6. fits_report_error(stderr      , status);

   fits_report_error(FILE *stream, status)
***************************************************************************************************/
/***************************************************************************************************
 If testfile.fits already exitst we get following:
   FITSIO status = 115: NULL input pointer
   failed to create new file (already exists?):
   testfile.fits
   
   now, if we delete testfile.fits, and run program again (./a.out), 
   it will create testfile.fits again.
   
    to read what is inside testfile.fits, type:
   
    more testfile.fits
***************************************************************************************************/
/***************************************************************************************************
                    DATATYPES
                    =========
C programmers should note that the ordering of arrays in FITS files, and hence in all the CFITSIO
calls, is more similar to the dimensionality of arrays in Fortran rather than C. For instance if a
FITS image has NAXIS1 = 100 and NAXIS2 = 50, then a 2-D array just large enough to hold the
image should be declared as array[50][100] and not as array[100][50].

The ‘datatype’ parameter specifies the data type of the ‘nulval’ and ‘array’ pointers and can have
one of the following values: TBYTE, TSBYTE, TSHORT, TUSHORT, TINT, TUINT, TLONG,
TLONGLONG, TULONG, TFLOAT, TDOUBLE. Automatic data type conversion is performed if
the data type of the FITS array (as defined by the BITPIX keyword) differs from that specified by
’datatype’. The data values are also automatically scaled by the BSCALE and BZERO keyword
values as they are being read or written in the FITS array.
***************************************************************************************************/

