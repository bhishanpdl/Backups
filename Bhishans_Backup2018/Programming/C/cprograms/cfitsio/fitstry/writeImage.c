// topic     : write image
// to compile: gcc writeImage.c -O2 -lcfitsio -lm -pthread
// to run    : ./a.out
// terminal  : clear; gcc writeImage.c -O2 -lcfitsio -lm -pthread  && ./a.out 

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
    unsigned short  *array[200];

    // initialize FITS image parameters //
    char filename[] =  "test1.fits";     // name for new FITS file //
    int  bitpix     =  USHORT_IMG;      // 16-bit unsigned short pixel values, create_img
    long naxis      =  2;               // 2-dimensional image                  //    
    //long naxes[2]   =  { 300, 200 };    // image is 300 pixels wide by 200 rows //
    
    //trying small image (original was 300,200)
    long naxes[2]   =  { 5, 10 }; // col = 5, row = 10

    // allocate memory for the whole image // 
    array[0] = (unsigned short *)malloc( naxes[0] * naxes[1] * sizeof( unsigned short ) );
    
    
    printf("naxes[0] = %ld\nnaxes[1] = %ld\n", naxes[0],naxes[1]); // naxes[1] = 200
    printf("array[1] = %ld\n", *array[1-1] + naxes[0]);
    // initialize pointers to the start of each row of the image //
    for( ii=1; ii<naxes[1]; ii++ )
        array[ii] = array[ii-1] + naxes[0];
        
        
    //checking initialized values    
    printf("naxes[0] columns        = %ld\n", naxes[0]);
    printf("naxes[1] rows           = %ld\n", naxes[1]);
    printf("array[0] initialize     = %hu\n", *array[0]);  
    printf("array[1] initialize     = %hu\n", *array[1]); 
    printf("array[2] initialize     = %hu\n", *array[2]);


    //Delete old file if it already exists (defined inside stdio.h) //
    remove(filename);

   
    // all fits functions return non zero on error,
    // so when argument of if if non zero, error will be printed
    //creating new fitsfile
    if (fits_create_file(&fptr, filename, &status)) 
        printerror( status );  

    // write the required keywords for the primary array image.     //
    // Since bitpix = USHORT_IMG, this will cause cfitsio to create //
    // a FITS image with BITPIX = 16 (signed short integers) with   //
    // BSCALE = 1.0 and BZERO = 32768.  This is the convention that //
    // FITS uses to store unsigned integers.  Note that the BSCALE  //
    // and BZERO keywords will be automatically written by cfitsio  //
    // in this case.                                                //


    //writing image extension to newly created fitsfile
    if ( fits_create_img(fptr,  bitpix, naxis, naxes, &status) ) 
        printerror( status );      

    // writing the values in the image with a linear ramp function //
    for (jj = 0; jj < naxes[1]; jj++)
    {   for (ii = 0; ii < naxes[0]; ii++)
        {
            array[jj][ii] = ii + jj;
        }
    }

    fpixel      = 1;                               // first pixel to write      //
    nelements   = naxes[0] * naxes[1];          // number of pixels to write //

    // write the array of unsigned integers to the FITS file //
    if ( fits_write_img(fptr, TUSHORT, fpixel, nelements, array[0], &status) )
        printerror( status );
    free( array[0] );  // free previously allocated memory //
    
    //optional***********************************************************
    // write another optional keyword to the header //
    // Note that the ADDRESS of the value is passed in the routine //
    exposure = 1500.;
    if ( fits_update_key(fptr, TLONG, "EXPOSURE", &exposure,
         "Total Exposure Time", &status) )
        printerror( status ); 
     //****************************************************************           
    // closing the file 
    if ( fits_close_file(fptr, &status) )                
        printerror( status );
    
    printf("\nPlease see in the directory"
            "you will see output image fits file 'test1.fits'\n\n");              

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


example of fits_get_image_type
===============================
Get the data type or equivalent data type of the image. The first routine returns the physical
data type of the FITS image, as given by the BITPIX keyword, with allowed values of
BYTE IMG (8), SHORT IMG (16), LONG IMG (32), LONGLONG IMG (64), FLOAT IMG
(-32), and DOUBLE IMG (-64).
 
The second routine is similar, except that if the image pixel
values are scaled, with non-default values for the BZERO and BSCALE keywords,
then the routine will return the ’equivalent’ data type that is needed to store the scaled values.

e.g.1: if BITPIX = 16 and BSCALE = 0.1 then the equivalent data type is FLOAT IMG.
e.g.2: if BITPIX = 16,    BSCALE = 1, and BZERO = 32768, then the the pixel values span
the range of an unsigned short integer and the returned data type will be USHORT IMG.

int fits_get_img_type / ffgidt
(fitsfile *fptr, > int *bitpix, int *status)
int fits_get_img_equivtype / ffgiet
(fitsfile *fptr, > int *bitpix, int *status)
***************************************************************************************************/

