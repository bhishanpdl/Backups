// topic: fitsio
// fits = Flexible Image Transport System
// filepath: cd /Users/poudel/Copy/Programming/C/cprograms/fitsio/createfits
// to compile: gcc b.c -O2 -lcfitsio -lm -pthread
// to run    : ./a.out
// terminal: cd /Users/poudel/Copy/Programming/C/cprograms/fitsio/createfits; gcc b.c -O2 -lcfitsio -lm -pthread; ./a.out 
// reference: CFITSIO User’s Reference Guide

/*  This program creates a new FITS file, containing a FITS image.
 *  An ‘EXPOSURE’ keyword is
 *  written to the header, then the image data are written to the FITS file
 *  before closing the FITS file.
 */


#include "fitsio.h" /* required by every program that uses CFITSIO */


int main(){

	fitsfile 	*fptr; /* pointer to the FITS file; defined in fitsio.h */
	int 			status, ii, jj;
	long 		fpixel = 1, naxis = 2, nelements, exposure;
	long 		naxes[2] = { 300, 200 }; /* image is 300 pixels wide by 200 rows */
	short 		array[200][300];

	status = 0; /* initialize status before calling fitsio routines */


	fits_create_file(&fptr, "testfile.fit", &status); /* we can also create .fits  */


	/* Create the primary array image (16-bit short integer pixels */
	fits_create_img(fptr, SHORT_IMG, naxis, naxes, &status);
	/* Write a keyword; must pass the ADDRESS of the value */

	exposure = 1500;
	fits_update_key(fptr, TLONG, "EXPOSURE", &exposure,
	"Total Exposure Time", &status);


	/* Initialize the values in the image with a linear ramp function */
	for (jj = 0; jj < naxes[1]; jj++)
	for (ii = 0; ii < naxes[0]; ii++)
	array[jj][ii] 	= ii + jj;
	nelements 		= naxes[0] * naxes[1]; /* number of pixels to write */


	/* Write the array of integers to the image */
	fits_write_img(fptr, TSHORT, fpixel, nelements, array[0], &status);
	fits_close_file(fptr, &status); /* close the file */
	fits_report_error(stderr, status); /* print out any error messages */


	printf("\nLook in the directory, you will see testfile.fit"
			

	return( status );
}

/* If testfile.fits already exitst we get following:
   FITSIO status = 115: NULL input pointer
   failed to create new file (already exists?):
   testfile.fits
   
   now, if we delete testfile.fits, and run program again (./a.out), 
   it will create testfile.fits again.
   
    to read what is inside testfile.fits, type:
   
    more testfile.fits
*/
