// topic     : update keyword
// filepath  : cd /Users/poudel/Copy/Programming/C/cprograms/fitsio/fitstry
// to compile: gcc updateKeyword.c -O2 -lcfitsio -lm -pthread
// to run    : ./a.out test2.fits
// terminal  : clear; gcc updateKeyword.c -O2 -lcfitsio -lm -pthread && ./a.out test1.fits
// reference : CFITSIO User’s Reference Guide


#include<stdio.h>
#include "fitsio.h" // required by every program that uses CFITSIO 

void printerror( int status);
int main(int argc, char *argv[])
{

	fitsfile 	*fptr;      // pointer to the FITS file; defined in fitsio.h
	int 		    status = 0; // initialize status before calling fitsio routines
		
	
	//step1: opening  fitsfile
    fits_open_file(&fptr, argv[1], READWRITE, &status); // we cannot update READONLY
        printerror(status);
	

	
	//step2: update the keywords
	//updating the keyword 'exposure'
	// Write a keyword; must pass the ADDRESS of the value 
	long        exposure;
	exposure    = 3200;
	fits_update_key(fptr, TLONG, "EXPOSURE", &exposure, "Total Exposure Time", &status);
    //fits_update_key(         fptr , TLONG        , "EXPOSURE"   , &exposure    , "Total Exposure Time", &status);
    //fits_update_key(fitsfile *fptr, char *keyname, DTYPE *numval, int decimals ,   char *comment      , > int *status)
    
    
    //second example:
    long        programmer;
	fits_update_key(fptr, TLONG, "PROGRAMMER", &programmer, "Bhishan Poudel", &status);
    
    //third example
    //update the bitpix keyword
    long        bitpix = -32; 
    fits_update_key(fptr, TLONG, "BITPIX", &bitpix, 0, &status);
        
    
	//last step: we close the file after writing extensions to it, and check for error
	fits_close_file(fptr, &status); // close the file
	fits_report_error(stderr, status); // print out any error messages


	printf("\nLook in the directory, you will see %s\n\n", argv[1]);
	
	return( status );
}
/*--------------------------------------------------------------------------*/
void printerror( int status)
{
    /*****************************************************/
    /* Print out cfitsio error messages and exit program */
    /*****************************************************/


    if (status)
    {
       fits_report_error(stderr, status); /* print error report */

       exit( status );    /* terminate the program, returning error status */
    }
    return;
}

/*******************************************************************************
         Update Keyword Routines
        =======================
    These update routines modify the value, and optionally the comment field,
    of the keyword if it already exists, otherwise the new keyword is appended to the
    header. A separate routine is provided for each keyword data type. The ‘longstr’
    version has the same functionality as the ‘str’ version except that it also supports
    the local long string keyword convention for strings longer than 68 characters. 
    A null pointer may be entered for the comment parameter which will leave the comment
    field unchanged or blank. The flt, dbl, cmp, and dblcmp versions of 
    this routine have the added feature that if the ’decimals’ parameter is negative, 
    then the ’G’ display format rather then the ’E’ format will be used when constructing
    the keyword value, taking the absolute value of ’decimals’ for the precision. 
    This will suppress trailing zeros, and will use a fixed format rather than an
    exponential format, depending on the magnitude of the value.
    
    
int fits_update_key_[str, longstr] / ffu[kys, kls]
(fitsfile *fptr, char *keyname, char *value, char *comment,
> int *status)


int fits_update_key_[log, lng] / ffuky[lj]
(fitsfile *fptr, char *keyname, DTYPE numval, char *comment,
> int *status)


int fits_update_key_[flt, dbl, fixflt, fixdbl] / ffuky[edfg]
(fitsfile *fptr, char *keyname, DTYPE numval, int decimals,
char *comment, > int *status)


int fits_update_key_[cmp, dblcmp, fixcmp, fixdblcmp] / ffuk[yc,ym,fc,fm]
(fitsfile *fptr, char *keyname, DTYPE *numval, int decimals,
char *comment, > int *status)          

********************************************************************************/
/********************************************************************************
examples form cookbook.c
update the NAXIS2 keyword with the correct number of rows
    if ( fits_update_key(outfptr, TLONG, "NAXIS2", &noutrows, 0, &status) )
         printerror( status );






********************************************************************************/
