// topic     : fitsio
// fits      : Flexible Image Transport System
// to compile: gcc fitsread.c -O2 -lcfitsio -lm -pthread
// to run    : ./a.out in.fits
// reference : CFITSIO User’s Reference Guide
// source    : https://heasarc.gsfc.nasa.gov/docs/software/fitsio/quick/node4.html
// terminal  : clear;gcc try.c -O2 -lcfitsio -lm -pthread;./a.out 


#include <string.h>
#include <stdio.h>
#include "fitsio.h"

int main(){
  
fitsfile		*fptr;
char 		card[FLEN_CARD];
int 			status = 0;     						/* MUST initialize status */
int 			nkeys;
int			ii; 
 
fits_open_file(&fptr, "testfile.fits", READONLY, &status);
fits_get_hdrspace(fptr, &nkeys, NULL, &status);
 
for (ii = 1; ii <= nkeys; ii++) {
	fits_read_record(fptr, ii, card, &status); 	
	printf("%s\n", card);	
}

printf("END\n\n"); 								

fits_close_file(fptr, &status);

if (status) 										
fits_report_error(stderr, status);


return(status);
}


