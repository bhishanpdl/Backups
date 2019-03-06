// topic     : write image
// to compile: gcc writeImageFloat.c -O2 -lcfitsio -lm -pthread
// to run    : ./a.out
// terminal  : clear; gcc writeImageFloat.c -O2 -lcfitsio -lm -pthread  && ./a.out 

//****************************************************//
// Create a FITS primary array containing a 2-D image //
//****************************************************//


#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "fitsio.h"

//function declarations
void printerror   ( int status);

int  main()
{
    fitsfile        *fptr;       // pointer to the FITS file, defined in fitsio.h 
    int             status = 0;  // we must initialize it.
    int             ii;
    int             jj;
    long            fpixel;
    int             nelements;
    int             exposure;
    float           *array[200];

    // initialize FITS image parameters //
    char filename[] =  "test1.fits";     // name for new FITS file //
    float  bitpix   =  -32;      // 16-bit unsigned short pixel values   //
    long naxis      =  2;               // 2-dimensional image                  //    
    //long naxes[2]   =  { 300, 200 };    // image is 300 pixels wide by 200 rows //
    
    //trying small image (original was 300,200)
    long naxes[2]   =  { 5, 10 }; // col = 5, row = 10

    // allocate memory for the whole image // 
    array[0] = (float *)malloc( naxes[0] * naxes[1] * sizeof( float ) );
    
    
    printf("naxes[0] = %ld\nnaxes[1] = %ld\n", naxes[0],naxes[1]); // naxes[1] = 200
    printf("array[1] = %f\n", *array[1-1] + naxes[0]);
    // initialize pointers to the start of each row of the image //
    for( ii=1; ii<naxes[1]; ii++ )
        array[ii] = array[ii-1] + naxes[0];
        
        
    //checking initialized values    
    printf("naxes[0] columns        = %ld\n", naxes[0]);
    printf("naxes[1] rows           = %ld\n", naxes[1]);
    printf("array[0] initialize     = %f\n", *array[0]);  
    printf("array[1] initialize     = %f\n", *array[1]); 
    printf("array[2] initialize     = %f\n", *array[2]);


    //Delete old file if it already exists (defined inside stdio.h) //
    remove(filename);

   

    if (fits_create_file(&fptr, filename, &status)) 
        printerror( status );  


    if ( fits_create_img(fptr,  bitpix, naxis, naxes, &status) ) 
        printerror( status );

    // initialize the values in the image with a linear ramp function //
    for (jj = 0; jj < naxes[1]; jj++)
    {   for (ii = 0; ii < naxes[0]; ii++)
        {
            array[jj][ii] = (ii + jj) * 0.1;
        }
    }

    fpixel      = 1;                               // first pixel to write      //
    nelements   = naxes[0] * naxes[1];          // number of pixels to write //

    // write the array of floats to the FITS file //
    if ( fits_write_img(fptr, TFLOAT, fpixel, nelements, array[0], &status) )
        printerror( status );
    free( array[0] );  // free previously allocated memory //

             

    if ( fits_close_file(fptr, &status) )                // close the file //
        printerror( status );
    
    printf("\nPlease see in the directory, you will see output image fits file 'test1.fits'\n\n");              

    return 0;
}
//--------------------------------------------------------------------------//
void printerror( int status)
{
    //***************************************************//
    // Print out cfitsio error messages and exit program //
    //***************************************************//


    if (status)
    {
       fits_report_error(stderr, status); // print error report //

       exit( status );    // terminate the program, returning error status //
    }
    return;
}
//--------------------------------------------------------------------------//
