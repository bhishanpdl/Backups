// topic   : fitscopy - copy a file with optional filtering
// terminal: clear; gcc fitscopyclean.c -lm -lcfitsio &&./a.out test.fits out.fits



#include <stdio.h>
#include "fitsio.h"

int main(int argc, char *argv[])
{
	
	//******************************************************************************************
	//routine to copy fits file
	
	//fitsfile paramters
	fitsfile    *infptr;    //fitsfile pointer to input fitsfile
	fitsfile    *outfptr;   //fitsfile pointer to input fitsfile
    int         status = 0; // status must always be initialized = 0
    int         ii = 1;     //counter to copy HDU ( header data unit)      

    
    
    //delete old output file, if present
    remove(argv[2]);

    // Open the input file
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
    
    //check for the error
    if (status) fits_report_error(stderr, status);
    
    //print success
    if (status==0)
        printf("Success: The fits file '%s' is successfully copied to '%s'\n\n", argv[1], argv[2]);
    //******************************************************************************************
            
            
    //end of int main
    return(0);
}
