// topic     : fits read
// reference : CFITSIO User’s Reference Guide
// source    : https://heasarc.gsfc.nasa.gov/docs/software/fitsio/quick/node4.html
// filepath  : cd /Users/poudel/Copy/Programming/C/cprograms/cfitsio/fitsexamples
// terminal  : gcc fitsopen1.c -lm -lcfitsio && ./a.out 


#include <string.h>
#include <stdio.h>
#include "fitsio.h"

int main(){
  
fitsfile		*fptr;
char 		card[FLEN_CARD];
int 			status = 0;     						/* MUST initialize status */
int 			nkeys;
int			ii; 
 
fits_open_file(&fptr, "testfile2.fits", READONLY, &status); //caveat: there should be testfile2.fits file 
fits_get_hdrspace(fptr, &nkeys, NULL, &status);
 
	for (ii = 1; ii <= nkeys; ii++) {
	fits_read_record(fptr, ii, card, &status); 	/* read keyword */
	printf("%s\n", card);	
	}

	printf("END\n\n"); 	/* terminate listing with END */

	fits_close_file(fptr, &status);

	if (status) 	/* print any error messages */
	fits_report_error(stderr, status);


	return(status);
}

/*
source: cfitsio user guide page 32
==============================================================================================
5.2 FITS File Access Routines
1 Open an existing data file.

int fits_open_file / ffopen (fitsfile **fptr,  char *filename,       int iomode,   > int *status)
    fits_open_file          (         &fptr,        "testfile.fits",     READONLY,       &status)

==============================================================================================
5.4.1 Keyword Reading Routines
int fits_get_hdrspace / ffghsp (fitsfile *fptr, > int *keysexist, int *morekeys, int *status)
    fits_get_hdrspace          (         fptr,        &nkeys,         NULL,          &status)

*/


