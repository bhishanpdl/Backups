// topic   : fitscopy - copy a file with optional filtering
// terminal: clear; gcc fitscopy.c -lm -lcfitsio &&./a.out in.fit out.fits
// terminal: clear; gcc fitscopy.c -lm -lcfitsio &&./a.out in.fit \!out.fits //here we dont need remove(argv[2])
// terminal: clear; gcc fitscopy.c -lm -lcfitsio && ./a.out 'convolve.fits[1:5,1:10]' \!convolveparts.fits  // 10 rows and 5 clms of input file
// terminal: clear; gcc fitscopy.c -lm -lcfitsio && ./a.out 'create.fits[1:6:1,1:20:2]' \!copy1.fits  // pre: create.fits has row*col = 20*6
// inputs and outputs : in.fit or in.fits or in.fit.gz ( but not .zip format)
// in unix \! means replace the file if it exists.
// Usage: create and paste contents of in.fit into out.fit


#include <stdio.h>
#include "fitsio.h"

int main(int argc, char *argv[])
{
	//fitsfile paramters
	fitsfile    *infptr;    //fitsfile pointer to input fitsfile
	fitsfile    *outfptr;   //fitsfile pointer to input fitsfile
    int         status = 0; // status must always be initialized = 0
    int         ii = 1;     //counter to copy HDU ( header data unit)      

    if (argc != 3)
    {
    
    		printf("\n\nError:\n");
    		printf("********************************************************************\n\n");
 		printf("Usage:  fitscopy inputfile outputfile\n");
 		printf("\n");
 		printf("Copy an input file to an output file, optionally filtering\n");
 		printf("the file in the process.  This seemingly simple program can\n");
		printf("apply powerful filters which transform the input file as\n");
 		printf("it is being copied.  Filters may be used to extract a\n");
 		printf("subimage from a larger image, select rows from a table,\n");
 		printf("filter a table with a GTI time extension or a SAO region file,\n");
 		printf("create or delete columns in a table, create an image by\n");
 		printf("binning (histogramming) 2 table columns, and convert IRAF\n");
 		printf("format *.imh or raw binary data files into FITS images.\n");
 		printf("See the CFITSIO User's Guide for a complete description of\n");
 		printf("the Extended File Name filtering syntax.\n");
 		printf("\n");
 		printf("Examples:\n");
 		printf("\n");
 		printf("fitscopy in.fit out.fit                   (simple file copy)\n");
 		printf("fitscopy - -                              (stdin to stdout)\n");
 		printf("fitscopy 'in.fit[11:50,21:60]' out.fit    (copy a subimage)\n");
 		printf("fitscopy iniraf.imh out.fit               (IRAF image to FITS)\n");
 		printf("fitscopy in.dat[i512,512] out.fit         (raw array to FITS)\n");
 		printf("fitscopy in.fit[events][pi>35] out.fit    (copy rows with pi>35)\n");
 		printf("fitscopy in.fit[events][bin X,Y] out.fit  (bin an image) \n");
 		printf("fitscopy in.fit[events][col x=.9*y] out.fit        (new x column)\n");
 		printf("fitscopy in.fit[events][gtifilter()] out.fit       (time filter)\n");
 		printf("fitscopy in.fit[2][regfilter(\"pow.reg\")] out.fit (spatial filter)\n");
 		printf("\n");
 		printf("Note that it may be necessary to enclose the input file name\n");
 		printf("in single quote characters on the Unix command line.\n\n");
 	
      	return(0);
    }
    
    //delete old output file, if present
    remove(argv[2]);

    // Open the input file &infpter is of type fitsfile* and argv[1] is of type string
    if ( !fits_open_file(&infptr, argv[1], READONLY, &status) )
    {
        // Create the output file
        if ( !fits_create_file(&outfptr, argv[2], &status) )
        { 		 
            // Copy every HDU until we get an error
      	    while( !fits_movabs_hdu(infptr, ii++, NULL, &status) )	 
          	fits_copy_hdu(infptr, outfptr, 0, &status);
 
            // Reset status after normal error
            if (status == END_OF_FILE) status = 0;
            
             					
            //close the output fits file after copying
            fits_close_file(outfptr,  &status);
        }
        
        //close the input fits file
        fits_close_file(infptr, &status);
    }
    
    //checking the value of the status
    //printf("value of status = %d\n", status);

    // if error occured, print out error message
    // if status == 0 , error will not be printed
    if (status) fits_report_error(stderr, status);
    
              
    //if status == 0, print success
    if(status == 0)
    {
        printf("Please see in the directory you will see output fits file '%s'\n\n", argv[2]);
    }
    return(0); //end of int main
}

/***************************************************************************************************************************
fitscopy - copy a file with optional filtering

    fitscopy infile[ext][filters] outfile

    This seemingly simple program can apply complex filtering methods which transform the input file as it is copied. For example, it can select a subimage out of a larger image, select rows in a table based on a logical expression, create new table columns or modify the values in existing columns, and filter tables based on time (using GTI extensions) or on spatial position (using spatial region files). See the Extended File Name syntax page for more examples of the filtering syntax, and refer to the CFITSIO User's Guide for a complete description.

    Note that in these examples it is often necessary to enclose the input filename in single quote characters on the Unix command line if the name contains special characters such as '[' or '*'.

    EXAMPLES
    fitscopy in.fit out.fit                - simple file copy
    fitscopy in.fit \!out.fit              - overwrite out.fit file
      (In Unix,  the '!' must be preceded by a '\' on the command line)
    fitscopy 'in.fit[11:50,21:50]' out.fit - copy 40x30 pixel subimage
    fitscopy 'in.fit[-*,*]' out.fit        - mirror reverse the image
    fitscopy 'stdin[11:50,21:60]' stdout   - piped subimage 
    fitscopy iniraf.imh out.fit            - convert IRAF image to FITS
    fitscopy 'in.dat[i512,512]' out.fit    - binary file to FITS
    fitscopy 'in.fit[evt][pi>35]' out.fit  - copy rows which have pi>35
    fitscopy 'in.fit[2][bin X,Y]' out.fit  - bin X,Y cols to make image
    fitscopy 'in.fit[evt][col Xc=3.*X]' out.fit - create new Xc column
    fitscopy 'in.fit[evt][gtifilter()]' out.fit - apply GTI time filter
    fitscopy 'in.fit[2][regfilter("pow.reg")]' out.fit - region filter

    The program itself is almost trivial, with just 6 lines of code required to open the input file, create the empty output file, copy each HDU from the input file to the output file, then close the 2 files. (See a listing of fitscopy.c). 

*/
