// topic   : linear combination of two fits files
//           apix[ii] = apix[ii] * value + bpix[ii] * (1-value)
//           output   = in1 * value + in2 * (1-value)

// terminal: clear; gcc linearCombination.c -O2 -lcfitsio -lm -pthread && ./a.out in1.fits in2.fits 0.3 \!out1.fits
// argc = 5                                                         argv  0       1        2         3  4



#include <string.h>
#include <stdio.h>
#include <stdlib.h> 		// for atof
#include "fitsio.h"

void printerror( int status);

int main(int argc, char *argv[])
{
    fitsfile 	    *infptr1;       //fitsfile pointers
    fitsfile	    *infptr2;       // used in fits_open_file and value is argv[2]
    fitsfile	    *outfptr;       // used in fits_create_file and value is argv[4]
    int         status  = 0;    //CFITSIO status value MUST be initialized to zero!
    int 		    check   = 1;    // flag for dimension less than 3,two images same size and operator is valid
    int         anaxis;         // value will be taken from fits_get_img_dim of first fits file
    int 		    bnaxis;         // images with naxis > 3 dimensions are not supported
    int   		ii;             // counter for fitsio functions
    long 		npixels = 1;    // npixels = anaxes[0] later and will be obtained from fits_get_img_size and will be no. of cols
    long 		firstpix[3] = {1,1,1};  // firstpix[2] <= anaxes[2] is counter for planes of cube
                                        // firstpix[1] <= anaxes[1] is counter for rows of plane
    long 		anaxes[3] = {1,1,1};    // this value is updated in fits_get_img_size
    long		    bnaxes[3] = {1,1,1};      // outside example: naxes[2]={300,200} means row*col = 200*300 pixels
    double		value;                  //value = atof(argv[2])
    double 		*apix;                  //apix = (double *) malloc(npixels * sizeof(double)); // mem for 1 row
    double		*bpix;



    if (argc != 5)
    {
        printf(
      	    "Usage: This program takes two fits files as input \n"
      		"       does some mathematical operation between them\n"
  			"       and creates a new output fits file\n\n"
  			"       first argument : name of first input fitsfile\n"
  			"       second argument: name of second input fitsfile\n"
  			"       third argument : numerical value\n"
  			"       fourth argument: name of output fitsfile\n\n");


      	  	return(1); //return 0 allows program to continue but return 1, exits the programs immediately
    }

    //removing old output file if it pre-exists
    remove(argv[4]);


    //reading value from third argument
    value = atof(argv[3]);

    if(value < 0 || value >1)
    {
        printf("the third argument should be between 0 and 1\n");
        //return (1);
    }

	//opening first fitsfile
    fits_open_file(&infptr1, argv[1], READONLY, &status);
        printerror(status);


    //opening second fitsfile
    fits_open_file(&infptr2, argv[2], READONLY, &status);
        printerror(status);


	//reading dimension of first fitsfile
    fits_get_img_dim(infptr1, &anaxis, &status);
        printerror(status);
        printf("the dimension of %s is = %d\n", argv[1], anaxis);
    // (fitsfile *fptr, > int *naxis, int *status)
    // value of anaxis is dimension and is updated here
    //dimension 3 means this program works for data cube



    //reading dimension of second fitsfile
    fits_get_img_dim(infptr2, &bnaxis, &status);
        printerror(status);
        printf("the dimension of %s is = %d\n", argv[2], bnaxis);


    //reading size of first image
    fits_get_img_size(infptr1, 3, anaxes, &status);
        printerror(status);
        printf("the size of '%s' is : anaxes[1] row = %ld and anaxes[0] col = %ld\n", argv[1],anaxes[1], anaxes[0] );
        printf("the value of anaxes[2] = %ld\n", anaxes[2]);
    //(fitsfile *fptr, int maxdim, > long *naxes, int *status)
    // maxdim 3 means this program works for data cube
    // initial value is anaxes[3] = {1,1,1}
    // value of anaxes[0] and anaxes[1] will be updated here
    // value of anaxes[2] = 1 for a plane image


    //reading size of second image
    fits_get_img_size(infptr2, 3, bnaxes, &status);
        printerror(status);
        printf("the size of '%s' is : row = %ld and col = %ld\n", argv[1],anaxes[1], anaxes[0] );

    //checking for error image having more than 3 dimensions
    if (anaxis > 3)
    {
        printf("Error: images with > 3 dimensions are not supported\n");
        check = 0;
    }


    // check that the both images have the same size
    else if ( anaxes[0] != bnaxes[0] ||  anaxes[1] != bnaxes[1] || anaxes[2] != bnaxes[2]  )
	{
        printf("Error: input images don't have same size\n");
        check = 0;
    }


    // create the new empty output file if the above checks are OK
    //(fitsfile **fptr, char *filename, > int *status)
    // check equal non zero means less than 3 dimension,two images same size and operator is valid
    if (check && !fits_create_file(&outfptr, argv[4], &status) )
    {
      	// copy all the header keywords from first image to new output file
      	fits_copy_header(infptr1, outfptr, &status);


        //allocating memory for apix and bpix
      	npixels = anaxes[0];  // no. of pixels to read in each row (anaxes is updated in fits_get_img_size)(cols of image1)


        //apix and bpix are double* and will be obtained later from 'fits_read_pix'
      	apix = (double *) malloc(npixels * sizeof(double)); // mem for 1 row i.e. no. of cols
      	bpix = (double *) malloc(npixels * sizeof(double)); //apix and bpix are double*


      	//checking error in memory allocation
      	if (apix == NULL || bpix == NULL)
      	{
        	printf("Memory allocation error\n");
        	return(1);
      	}



      	// loop over all planes of the cube (2D images have 1 plane)
      	for (firstpix[2] = 1; firstpix[2] <= anaxes[2]; firstpix[2]++)
      	{
            	// loop over all rows of the plane
        	    for (firstpix[1] = 1; firstpix[1] <= anaxes[1]; firstpix[1]++) //if anaxes[1] = rows = 20, loop goes 20 times
            	{
          	    // Read both images as doubles, regardless of actual datatype.
          	    // Give starting pixel coordinate and no. of pixels to read.
          	    // This version does not support undefined pixels in the image


          		if (fits_read_pix(infptr1, TDOUBLE, firstpix, npixels, NULL, apix, NULL, &status))
	    		        break;   // jump out of loop on error in reading pixels
	  			if (fits_read_pix(infptr2, TDOUBLE, firstpix, npixels, NULL, bpix, NULL, &status))
	    		        break;   // jump out of loop on error in reading pixels

	    		    //checking data type of variable apix
	    		    //printf("sizeof apix is %lu\n", sizeof(apix)); // ans: 8
	    		    //sizeof char =1, int = float =4, long = double = long long = 8

	    		    //printf("value of apix = %lf\n", *apix); //apix and bpix are double*
	    		    //printf("value of bpix = %lf\n", *bpix); // first loop values are 0&1, second loop 1&2 etc


                //mathematical operation
          		for(ii=0; ii< npixels; ii++)
          		    apix[ii] = apix[ii] * value + bpix[ii] * (1-value) ;


          		//update the bitpix keyword
                long        bitpix = -32; // // -32 means FLOAT_IMG, -64 means DOUBLE_IMG
                fits_update_key(outfptr, TLONG, "BITPIX", &bitpix, 0, &status);

          		//write new values to output image
          		fits_write_pix(outfptr, TDOUBLE, firstpix, npixels, apix, &status);

        	    } // end of loop over rows of a plane

        } // end of loop over planes of a cube
      	fits_close_file(outfptr, &status);      // closing output image file each time inside the loop
      	free(apix); // freeing the memory allocated by malloc each time inside the loop
      	free(bpix);

    }
    fits_close_file(infptr1, &status); // closing first input image file ( out of the loop)
    fits_close_file(infptr2, &status);

  	if (status) fits_report_error(stderr, status); // print any error message at the end of the program


    printf( "\n"
            "The first input  fits image    = %s\n"
            "The second input fits image    = %s\n"
            "The operation value            = %s\n"
            "The output fits image          = %s\n"
            "\nPlease see in the directory, you can see the output file\n\n", argv[1], argv[2] ,argv[3], argv[4]);
	return(status);
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

/*****************************************************************************************************************
  fits functions from the routine fitsio ( note: > means input)
   ==============================================================================

1. fits_open_file(         &infptr1,    argv[1],       READONLY,     &status);
    //           (fitsfile **fptr, char *filename, int iomode, > int *status)
    //note:                                                      int status = 0;

2. fits_report_error(     stderr,  status);
                    (FILE *stream, status)

3. fits_get_img_dim(         infptr1,     &anaxis,    &status);
    //             (fitsfile *fptr, > int *naxis, int *status)


4. fits_get_img_size(         infptr1,  3,             anaxes,     &status);
    //              (fitsfile *fptr, int maxdim, > long *naxes, int *status)
    //note:                                        long anaxes[3] = {1,1,1};

5. fits_create_file(         &outfptr,    argv[4],         &status) );
   //              (fitsfile **fptr, char *filename, > int *status)

6. fits_copy_header(         infptr1,          outfptr,        &status);
   //              (fitsfile *infptr, fitsfile *outfptr, > int *status)

7. fits_read_pix(fitsfile *fptr   , int datatype, long *fpixel              , LONGLONG nelements, DTYPE *nulval, > DTYPE *array, int *anynul, int *status)
   fits_read_pix(fitsfile *infptr1, TDOUBLE     , long firstpix[3] = {1,1,1}, long     npixels  , NULL         ,   double *apix, NULL       , &status)
   fits_read_pix(infptr1, TDOUBLE, firstpix, npixels, NULL, apix, NULL, &status)

8. fits_write_pix(         outfptr,   TDOUBLE,       firstpix,         npixels,        apix,       &status);
   //            (fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements,DTYPE *array, int *status)
                            this program:       long firstpix[3] = {1,1,1};      doubl *apix;

9. fits_close_file(outfptr, &status);
   //             (fptr,    &status)

***************************************************************************************************************************/
/**************************************************************************************************************************
        fits_read_pix
        ==============
Read pixels from the FITS data array. ’fpixel’ is the starting pixel location and is an array of
length NAXIS such that fpixel[0] is in the range 1 to NAXIS1, fpixel[1] is in the range 1 to
NAXIS2, etc. The nelements parameter specifies the number of pixels to read. If fpixel is set
to the first pixel, and nelements is set equal to the NAXIS1 value, then this routine would
read the first row of the image. Alternatively, if nelements is set equal to NAXIS1 * NAXIS2
then it would read an entire 2D image, or the first plane of a 3-D datacube.
The first 2 routines will return any undefined pixels in the FITS array equal to the value
of *nullval (note that this parameter gives the address of the null value, not the null value
itself) unless nulval = 0 or *nulval = 0, in which case no checks for undefined pixels will be
performed. The second 2 routines are similar except that any undefined pixels will have the
corresponding nullarray element set equal to TRUE (= 1).

int fits_read_pix(fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements,DTYPE *nulval, > DTYPE *array, int *anynul, int *status)
int fits_read_pixll(fitsfile *fptr, int datatype, LONGLONG *fpixel, LONGLONG nelements,DTYPE *nulval, > DTYPE *array, int *anynul, int *status)
int fits_read_pixnull(fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements,> DTYPE *array, char *nullarray, int *anynul, int *status)
int fits_read_pixnullll(fitsfile *fptr, int datatype, LONGLONG *fpixel, LONGLONG nelements,> DTYPE *array, char *nullarray, int *anynul, int *status)

***************************************************************************************************************************/
/*************************************************************************************************************************
        fits_write_pix
        =============
Write pixels into the FITS data array. ’fpixel’ is an array of length NAXIS which gives the
coordinate of the starting pixel to be written to, such that fpixel[0] is in the range 1 to
NAXIS1, fpixel[1] is in the range 1 to NAXIS2, etc. The first pair of routines simply writes
the array of pixels to the FITS file (doing data type conversion if necessary) whereas the
second routines will substitute the appropriate FITS null value for any elements which are
equal to the input value of nulval (note that this parameter gives the address of the null
value, not the null value itself). For integer FITS arrays, the FITS null value is defined by
the BLANK keyword (an error is returned if the BLANK keyword doesn’t exist). For floating
point FITS arrays the special IEEE NaN (Not-a-Number) value will be written into the FITS
file. If a null pointer is entered for nulval, then the null value is ignored and this routine
behaves the same as fits write pix.

int fits_write_pix(fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements,DTYPE *array, int *status);
int fits_write_pixll(fitsfile *fptr, int datatype, LONGLONG *fpixel, LONGLONG nelements,DTYPE *array, int *status);
int fits_write_pixnull(fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements,DTYPE *array, DTYPE *nulval, > int *status);
int fits_write_pixnullll(fitsfile *fptr, int datatype, LONGLONG *fpixel, LONGLONG nelements,DTYPE *array, DTYPE *nulval, > int *status);
**********************************************************************************************************************/



