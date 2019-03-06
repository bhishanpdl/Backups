/*Program to create output = input * value
 * algorithm:   apix[ii] *= value
 *
to compile   : gcc multiply.c -O2 -lcfitsio -lm -pthread
terminal     : clear; gcc multiply.c -O2 -lcfitsio -lm -pthread && ./a.out in1.fits 1000.0 \!out3.fits
multiply by x: ./a.out in1.fits 0.1  \!out1.fits
argv[]       : 0       1        2      3

*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h> 		// for atof
#include "fitsio.h"
#include <math.h>

int main(int argc, char *argv[])
{


    fitsfile 	*infptr1;
    fitsfile	*outfptr;   // FITS file pointers
    int 		status = 0; //CFITSIO status value MUST be initialized to zero!
    int 		check = 1;  // checking for anaxis > 3 error
    int 		atype;
    int  		anaxis;
    int   		ii;
    long 		npixels = 1;
    long 		firstpix[3] = {1,1,1};
    long 		anaxes[3] = {1,1,1};
    double 		*apix;
    double		value;


    if (argc != 4)
    {
      printf(
      		"Usage: This program takes an input fits file \n"
      		"and multiplies each pixel by a number\n"
  			"then output fits file is created in that directory\n");

      return(0);
    }


	//opening input image (eg. in1.fits)
    fits_open_file(&infptr1, argv[1], READONLY, &status);


    //checking for error (if status = 0, it is ignored )
    if (status)
    {
       fits_report_error(stderr, status); // (FILE *stream, status)
       return(status);
    }


    value = atof(argv[2]);


    //reading dimension of first image
    fits_get_img_dim(infptr1, &anaxis, &status);  // read dimensions
    // (fitsfile *fptr, > int *naxis, int *status)



    //reading size of first image
    fits_get_img_size(infptr1, 3, anaxes, &status);
    //(fitsfile *fptr, int maxdim, > long *naxes, int *status)




    if (anaxis > 3)
    {
       printf("Error: images with > 3 dimensions are not supported\n");
       check = 0;
    }




    // create the new empty output file if the above checks are OK
    //(fitsfile **fptr, char *filename, > int *status)
    if (check && !fits_create_file(&outfptr, argv[3], &status) )
    {
      	// copy all the header keywords from first image to new output file
      	fits_copy_header(infptr1, outfptr, &status);

      	npixels = anaxes[0];  // no. of pixels to read in each row

      	apix = (double *) malloc(npixels * sizeof(double)); // mem for 1 row


      	// loop over all planes of the cube (2D images have 1 plane)
      	for (firstpix[2] = 1; firstpix[2] <= anaxes[2]; firstpix[2]++)
      	{
        		// loop over all rows of the plane
        		for (firstpix[1] = 1; firstpix[1] <= anaxes[1]; firstpix[1]++)
        		{
          	// Read the  image as doubles, regardless of actual datatype.
          	// Give starting pixel coordinate and no. of pixels to read.
          	// This program does not support undefined pixels in the image

          		if (fits_read_pix(infptr1, TDOUBLE, firstpix, npixels, NULL, apix, NULL, &status))
	    		break;   // jump out of loop on error



					for(ii=0; ii< npixels; ii++)
					{
						apix[ii] *= value;
					}


          		fits_write_pix(outfptr, TDOUBLE, firstpix, npixels, apix, &status);
        		}
      	} // end of loop over planes
      	fits_close_file(outfptr, &status);
      	free(apix);



    } // end of if statement
    fits_close_file(infptr1, &status);


  	if (status) fits_report_error(stderr, status); // print any error message
                                                   // note: value = atof(argv[2])

    printf(
            "The input  fits image is = %s\n"
            "The muliplying factor is = %f\n"
            "The output fits image is = %s\n"
            "Please see in the directory, you can see output file\n\n", argv[1], value ,argv[3]);
	return(status);
}


/* fits functions from the routine fitsio
   =======================================

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

7. fits_read_pix(infptr1,            TDOUBLE,       firstpix,         npixels,         NULL,            apix,       NULL,        &status);
                (fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements, DTYPE *nulval, > DTYPE *array, int *anynul, int *status)


8. fits_write_pix(         outfptr,   TDOUBLE,       firstpix,         npixels,        apix,       &status);
   //            (fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements,DTYPE *array, int *status)
                            this program:       long firstpix[3] = {1,1,1};      doubl *apix;

9. fits_close_file(outfptr, &status);
   //             (fptr,    &status)

*/

