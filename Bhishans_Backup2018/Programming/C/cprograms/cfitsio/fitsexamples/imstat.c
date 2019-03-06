//topic: imstat - compute statistics of an image 
//source: https://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples.html
//filepath: cd /Users/poudel/Copy/Programming/C/cprograms/cfitsio/fitsexamples
//terminal: gcc imstat.c -lm -lcfitsio && ./a.out in.fit
//to run  : ./a.out 'in.fit[20:29,10:19]' 		// stats of 10x10 pixel section
//to run  : ./a.out 'in.fit[20:29:2,10:19:2]' 	// stat of  every other pixel
//to run  : ./a.out 'in.fit[bin (X,Y)=32]'      // will get some binning error



#include <string.h>
#include <stdio.h>
#include "fitsio.h"

int main(int argc, char *argv[])
{
    fitsfile *fptr;  /* FITS file pointer */
    int status = 0;  /* CFITSIO status value MUST be initialized to zero! */
    int hdutype, naxis, ii;
    long naxes[2], totpix, fpixel[2];
    double *pix, sum = 0., meanval = 0., minval = 1.E33, maxval = -1.E33;

    if (argc != 2) { 
      printf("Usage: imstat image \n");
      printf("\n");
      printf("Compute statistics of pixels in the input image\n");
      printf("\n");
      printf("Examples: \n");
      printf("  imarith image.fits                    - the whole image\n");
      printf("  imarith 'image.fits[200:210,300:310]' - image section\n");
      printf("  imarith 'table.fits+1[bin (X,Y) = 4]' - image constructed\n");
      printf("     from X and Y columns of a table, with 4-pixel bin size\n");
      return(0);
    }

    if ( !fits_open_image(&fptr, argv[1], READONLY, &status) )
    {
      if (fits_get_hdu_type(fptr, &hdutype, &status) || hdutype != IMAGE_HDU) { 
        printf("Error: this program only works on images, not tables\n");
        return(1);
      }

      fits_get_img_dim(fptr, &naxis, &status);
      fits_get_img_size(fptr, 2, naxes, &status);

      if (status || naxis != 2) { 
        printf("Error: NAXIS = %d.  Only 2-D images are supported.\n", naxis);
        return(1);
      }

      pix = (double *) malloc(naxes[0] * sizeof(double)); /* memory for 1 row */

      if (pix == NULL) {
        printf("Memory allocation error\n");
        return(1);
      }

      totpix = naxes[0] * naxes[1];
      fpixel[0] = 1;  /* read starting with first pixel in each row */

      /* process image one row at a time; increment row # in each loop */
      for (fpixel[1] = 1; fpixel[1] <= naxes[1]; fpixel[1]++)
      {  
         /* give starting pixel coordinate and number of pixels to read */
         if (fits_read_pix(fptr, TDOUBLE, fpixel, naxes[0],0, pix,0, &status))
            break;   /* jump out of loop on error */

         for (ii = 0; ii < naxes[0]; ii++) {
           sum += pix[ii];                      /* accumlate sum */
           if (pix[ii] < minval) minval = pix[ii];  /* find min and  */
           if (pix[ii] > maxval) maxval = pix[ii];  /* max values    */
         }
      }
      
      free(pix);
      fits_close_file(fptr, &status);
    }

    if (status)  {
        fits_report_error(stderr, status); /* print any error message */
    } else {
        if (totpix > 0) meanval = sum / totpix;

        printf("Statistics of %ld x %ld  image\n",
               naxes[0], naxes[1]);
        printf("  sum of pixels = %g\n", sum);
        printf("  mean value    = %g\n", meanval);
        printf("  minimum value = %g\n", minval);
        printf("  maximum value = %g\n", maxval);
    }

    return(status);
}

/*
imstat - compute statistics of an image

    imstat infile[ext]

    Compute simple statistics for the pixels in an input image. It computes the sum of all the pixels, the mean pixel value, and the minimum and maximum pixel values.

    Examples: 
      imstat infile.fit                - stats of the whole image
      imstat 'in.fit[20:29,10:19]'     - stats of 10x10 pixel section
      imstat 'in.fit[3][20:29,10:19]'  - stats of 3rd IMAGE extension
      imstat 'intab.fit[1][bin (X,Y)=32] - stats of an image generated
         by binning the X and Y table columns with a binning size = 32

    This program opens the file (which may have been filtered) and checks that the HDU is a 2D image. (It could easily be extended to support 3D data cubes as well, as is done in the imarith program). It then allocates memory to hold 1 row of pixels, and loops through the image, accumulating the statistics row by row. Note that the program reads the image into an array of doubles, regardless of the intrinsic datatype of the image
*/

