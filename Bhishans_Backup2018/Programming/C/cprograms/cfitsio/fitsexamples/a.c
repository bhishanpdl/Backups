/*

to compile : gcc a.c -O2 -lcfitsio -lm -pthread
to add     : ./a.out in1.fits in2.fits add \!testfile3.fits
to divide  : ./a.out testfile3.fits 2 div \!testfile4.fits
to run     : ./a.out in1.fits testfile2.fits add \!testfile3.fits && ./a.out testfile3.fits 2 div \!testfile4.fits
*/

#include <string.h>
#include <stdio.h>
#include <stdlib.h> 		// for atof
#include "fitsio.h"

int main(int argc, char *argv[])
{


    fitsfile 	*infptr1, *infptr2, *outfptr;  /* FITS file pointers */
    int 			status = 0;  //CFITSIO status value MUST be initialized to zero!
    int 			check = 1;  // checking for error
    int 			image2 = 1; // image2 = 0 in line 63
    int 			atype, btype;
    int  		anaxis, bnaxis; // images with naxis > 3 dimensions are not supported
    int   		ii;
    int         op; // operation, look line 109, 157, used in switch
    long 		npixels = 1, firstpix[3] = {1,1,1};
    long			ntodo;
    long 		anaxes[3] = {1,1,1}, bnaxes[3]={1,1,1};  // naxes[2]={300,200} means row*col = 200*300 pixels
    double 		*apix, *bpix;
    double		value;


    if (argc != 5)
    {
      printf(
      		"Usage: imarith image1 { image2 | value } operation outimage \n"
      		"                      image 2 or value   add etc.\n"
  			"Perform 'image1 oper image2' or 'image1 operation value'\n"
     		"creating a new output image.  Supported arithmetic\n"
      		"operators are add, sub, mul, div (first character required\n"

      	  	"Examples: \n"
      	  	"  imarith in1.fits in2.fits a out.fits - add the 2 files\n"
     	  	"  imarith in1.fits 1000.0 mul out.fits - mult in1 by 1000\n");

      return(0);
    }


	//opening input image (eg. testfile1.fits)
    fits_open_file(&infptr1, argv[1], READONLY, &status);
    //(fitsfile **fptr, char *filename, int iomode, > int *status)

    //checking for error (if status = 0, it is ignored )
    if (status)
    {
       fits_report_error(stderr, status); // (FILE *stream, status)
       return(status);
    }


    //opening argv[2] (eg. testfile2.fits or 2) (second image or operation value)
    fits_open_file(&infptr2, argv[2], READONLY, &status);

    //when status = 0, reading argv[2]
    if (status)
    {
      value = atof(argv[2]); // atof is array to float
      if (value == 0.0)
      {
			printf("Error: second argument is neither an image name"
	       		   " nor a valid numerical value.\n");
			return(status);
      }
      image2 = 0;
      status = 0;
    }


	//reading dimension of first image
    fits_get_img_dim(infptr1, &anaxis, &status);  /* read dimensions */
    // (fitsfile *fptr, > int *naxis, int *status)


    // if image2 = 0, it will be ignored
    if (image2) fits_get_img_dim(infptr2, &bnaxis, &status);


    //reading size of first image
    fits_get_img_size(infptr1, 3, anaxes, &status);
    //(fitsfile *fptr, int maxdim, > long *naxes, int *status)


    //if image2 != 0, it will be executed (line 25)
    if (image2) fits_get_img_size(infptr2, 3, bnaxes, &status);

    if (status)
    {
       fits_report_error(stderr, status); /* print error message */
       return(status);
    }



    if (anaxis > 3)
    {
       printf("Error: images with > 3 dimensions are not supported\n");
       check = 0;
    }
         /* check that the input 2 images have the same size */
    else if ( image2 && ( anaxes[0] != bnaxes[0] ||
			  anaxes[1] != bnaxes[1] ||
			  anaxes[2] != bnaxes[2]     ) )
	{
       printf("Error: input images don't have same size\n");
       check = 0;
    }


    //checking for arithmetic operator ( op is an integer later used in switch)

    if      (*argv[3] == 'a' || *argv[3] == 'A')
      op = 1;
    else if (*argv[3] == 's' || *argv[3] == 'S')
      op = 2;
    else if (*argv[3] == 'm' || *argv[3] == 'M')
      op = 3;
    else if (*argv[3] == 'd' || *argv[3] == 'D')
      op = 4;

    else
    {
      printf("Error: unknown arithmetic operator\n");
      check = 0;
    }



    /* create the new empty output file if the above checks are OK */
    //(fitsfile **fptr, char *filename, > int *status)
    if (check && !fits_create_file(&outfptr, argv[4], &status) )
    {
      	/* copy all the header keywords from first image to new output file */
      	fits_copy_header(infptr1, outfptr, &status);

      	npixels = anaxes[0];  /* no. of pixels to read in each row */

      	apix = (double *) malloc(npixels * sizeof(double)); /* mem for 1 row */
      	if (image2) bpix = (double *) malloc(npixels * sizeof(double));

      	if (apix == NULL || (image2 && bpix == NULL)) {
        		printf("Memory allocation error\n");
        		return(1);
      	}

      	/* loop over all planes of the cube (2D images have 1 plane) */
      	for (firstpix[2] = 1; firstpix[2] <= anaxes[2]; firstpix[2]++)
      	{
        		/* loop over all rows of the plane */
        		for (firstpix[1] = 1; firstpix[1] <= anaxes[1]; firstpix[1]++)
        		{
          	/* Read both images as doubles, regardless of actual datatype.  */
          	/* Give starting pixel coordinate and no. of pixels to read.    */
          	/* This version does not support undefined pixels in the image. */

          		if (fits_read_pix(infptr1, TDOUBLE, firstpix, npixels,
          		    NULL, apix, NULL, &status))
	    			 	break;   /* jump out of loop on error */
	  			if (image2 && fits_read_pix(infptr2, TDOUBLE, firstpix, npixels,
	  			    NULL, bpix, NULL, &status))
	    				break;   /* jump out of loop on error */

          		switch (op)
          		{
          			case 1:
            				for(ii=0; ii< npixels; ii++)
	      				if (image2)
							apix[ii] += bpix[ii];
	      				else
							apix[ii] += value;
            				break;

          			case 2:
            				for(ii=0; ii< npixels; ii++)
	      				if (image2)
							apix[ii] -= bpix[ii];
	      				else
							apix[ii] -= value;
            				break;

          			case 3:
            				for(ii=0; ii< npixels; ii++)
	      				if (image2)
							apix[ii] *= bpix[ii];
	      				else
							apix[ii] *= value;
            				break;

          			case 4:
            				for(ii=0; ii< npixels; ii++)
            				{
	      					if (image2)
	      					{
								if (bpix[ii] !=0.)
		  							apix[ii] /= bpix[ii];
								else
		  							apix[ii] = 0.;
	      					}
	      					else
	      					{
								apix[ii] /= value;
	      					}
            				}
          		} /* write new values to output image */
          		fits_write_pix(outfptr, TDOUBLE, firstpix, npixels, apix, &status);
        		}
      	} /* end of loop over planes */
      	fits_close_file(outfptr, &status);
      	free(apix);
      	if (image2) free(bpix);

    }
    fits_close_file(infptr1, &status);

    if (image2) fits_close_file(infptr2, &status);
  	if (status) fits_report_error(stderr, status); /* print any error message */


    printf("Please see in the directory, you can see output file\n\n");
	return(status);
}

/* fits routines used in this program
   ====================================

1. fits_open_file(&infptr1, argv[1], READONLY, &status);
    //(fitsfile **fptr, char *filename, int iomode, > int *status)

2. fits_report_error(stderr, status);
                    (FILE *stream, status)

3. fits_get_img_dim(infptr1, &anaxis, &status);
    // (fitsfile *fptr, > int *naxis, int *status)


4. fits_get_img_size(infptr1, 3, anaxes, &status);
    //(fitsfile *fptr, int maxdim, > long *naxes, int *status)


5. fits_create_file(&outfptr, argv[4], &status) )   line 121
   //(fitsfile **fptr, char *filename, > int *status)

6. fits_copy_header(infptr1, outfptr, &status		line 124
   //(fitsfile *infptr, fitsfile *outfptr, > int *status)

7. fits_read_pix(infptr1, TDOUBLE, firstpix, npixels,
				 NULL, apix, NULL, &status)
(fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements,
				 DTYPE *nulval, > DTYPE *array, int *anynul, int *status)


8. fits_write_pix(outfptr, TDOUBLE, firstpix, npixels,
                       apix, &status)
   // (fitsfile *fptr, int datatype, long *fpixel, LONGLONG nelements,
						DTYPE *array, int *status)


9. fits_close_file(outfptr, &status)
   //(fptr, &status)






*/

/*
imarith - perform arithmetic on 1 or 2 images

    imarith image1[ext] image2[ext] operation outimage  (2 images)
    or
    imarith image[ext] value operation outimage         (1 image)

    Add, subtract, multiply, or divide the pixels in one image by another image or a constant and write the result to a new output image. Supported arithmetic operations are 'add', 'sub', 'mul', or 'div' (only the first character need be supplied)

    Examples:
      imarith in1.fit in2.fit add out.fit     - add the 2 images
      imarith in.fit 1.2 mul out.fit         - multiply image by 1.1
      imarith 'in1.fit[1:20,1:20]' 'in2.fit[1:20,1:20]' add \!out.fit
         - add 2 image sections; also overwrite out.fit if it exists.
      imarith data.fit[1] data.fit[2] mul out.fit - multiply the images
                   in the 1st and 2nd extensions of the file data.fit

    This program first opens the input images. If 2 images, it checks that they have the same dimensions. It then creates the empty output file and copies the header of the first image into it (thus duplicating the size and data type of that image). Memory is allocated to hold one row of the images. The program computes the output image values by reading one row at a time from the input image(s), performing the desired arithmetic operation, and then writing the resulting row to the output file. The program reads and writes the row of data in double precision format, regardless of the intrinsic datatype of the images; CFITSIO transparently converts the data format if necessary as the rows are read and written. This program also supports 3D data cubes by looping through each plane of the cube.
*/

