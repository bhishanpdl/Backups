/* Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
 * Date        : Oct 18, 2017
 *
 * Compile     : gcc -O3 -o jeditransform jeditransform.c  -lm -lcfitsio
 * Run         :clear;gcc read_fitsheader.c -O2 -lcfitsio -lm -pthread;./a.out
 * Ref : https://heasarc.gsfc.nasa.gov/docs/software/fitsio/quick/node4.html
 * 
 * Runtime : 1 sec
 *
 */
#include <stdio.h>
#include <string.h>
#include "fitsio.h"

int main(){

fitsfile  *fptr;
char      card[FLEN_CARD];
int       status = 0;    /* MUST initialize status */
int       nkeys;
int       ii;

fits_open_file(&fptr, "scaled_disk_f8/f814w_scaled_disk134.fits", READONLY, &status);
fits_get_hdrspace(fptr, &nkeys, NULL, &status);

    for (ii = 1; ii <= nkeys; ii++) {
    fits_read_record(fptr, ii, card, &status);     /* read keyword */
    printf("%s\n", card);
    }

    printf("END\n\n");     /* terminate listing with END */

    fits_close_file(fptr, &status);

    if (status)     /* print any error messages */
    fits_report_error(stderr, status);


    return(status);
}
