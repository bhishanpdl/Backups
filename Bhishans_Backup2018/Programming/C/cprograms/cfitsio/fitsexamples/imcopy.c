// topic   : imcopy - copy a FITS image with optional data compression
// source  : https://heasarc.gsfc.nasa.gov/docs/software/cfitsio/cexamples.html#fitscopy
// filepath: cd /Users/poudel/Copy/Programming/C/cprograms/cfitsio/fitsexamples
// terminal: clear;gcc imcopy.c -lm -lcfitsio && ./a.out in.fit 'out.fit[compress GZIP]'
// Usage   : it will compress the fits file and creates copy of it (creates out.fit)
// caveat  : if there is already out.fit file, it will show error




#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "fitsio.h"

int main(int argc, char *argv[])
{
    fitsfile *infptr, *outfptr;   /* FITS file pointers defined in fitsio.h */
    int status = 0, ii = 1, iteration = 0, single = 0, hdupos;
    int hdutype, bitpix, bytepix, naxis = 0, nkeys, datatype = 0, anynul;
    long naxes[9] = {1, 1, 1, 1, 1, 1, 1, 1, 1};
    long first, totpix = 0, npix;
    double *array, bscale = 1.0, bzero = 0.0, nulval = 0.;
    char card[81];

    if (argc != 3)
    {
 printf("\n");
 printf("Usage:  imcopy inputImage outputImage[compress]\n");
 printf("\n");
 printf("Copy an input image to an output image, optionally compressing\n");
 printf("or uncompressing the image in the process.  If the [compress]\n");
 printf("qualifier is appended to the output file name then the input image\n");
 printf("will be compressed using the tile-compressed format.  In this format,\n");
 printf("the image is divided into rectangular tiles and each tile of pixels\n");
 printf("is compressed and stored in a variable-length row of a binary table.\n");
 printf("If the [compress] qualifier is omitted, and the input image is\n");
 printf("in tile-compressed format, then the output image will be uncompressed.\n");
 printf("\n");
 printf("If an extension name or number is appended to the input file name, \n");
 printf("enclosed in square brackets, then only that single extension will be\n");
 printf("copied to the output file.  Otherwise, every extension in the input file\n");
 printf("will be processed in turn and copied to the output file.\n");
 printf("\n");
 printf("Examples:\n");
 printf("\n");
 printf("1)  imcopy image.fit 'cimage.fit[compress]'\n");
 printf("\n");
 printf("    This compresses the input image using the default parameters, i.e.,\n");
 printf("    using the Rice compression algorithm and using row by row tiles.\n");
 printf("\n");
 printf("2)  imcopy cimage.fit image2.fit\n");
 printf("\n");
 printf("    This uncompress the image created in the first example.\n");
 printf("    image2.fit should be identical to image.fit if the image\n");
 printf("    has an integer datatype.  There will be small differences\n");
 printf("    in the pixel values if it is a floating point image.\n");
 printf("\n");
 printf("3)  imcopy image.fit 'cimage.fit[compress GZIP 100,100;4]'\n");
 printf("\n");
 printf("    This compresses the input image using the following parameters:\n");
 printf("         GZIP compression algorithm;\n");
 printf("         100 X 100 pixel compression tiles;\n");
 printf("         noise_bits = 4 (only used with floating point images)\n");
 printf("\n");
 printf("The full syntax of the compression qualifier is:\n");
 printf("    [compress ALGORITHM TDIM1,TDIM2,...; NOISE_BITS]\n");
 printf("where the allowed ALGORITHM values are Rice, GZIP, PLIO, \n");
 printf("and TDIMn is the size of the compression tile in each dimension,\n");
 printf("and NOISE_BITS = 1, 2, 3, or 4 and controls the amount of noise\n");
 printf("suppression when compressing floating point images. \n");
 printf("\n");
 printf("Note that it may be necessary to enclose the file names\n");
 printf("in single quote characters on the Unix command line.\n");
      return(0);
    }

    /* Open the input file and create output file */
    fits_open_file(&infptr, argv[1], READONLY, &status);
    fits_create_file(&outfptr, argv[2], &status);

    if (status != 0) {    
        fits_report_error(stderr, status);
        return(status);
    }

    fits_get_hdu_num(infptr, &hdupos);  /* Get the current HDU position */

    /* Copy only a single HDU if a specific extension was given */ 
    if (hdupos != 1 || strchr(argv[1], '[')) single = 1;

    for (; !status; hdupos++)  /* Main loop through each extension */
    {

      fits_get_hdu_type(infptr, &hdutype, &status);

      if (hdutype == IMAGE_HDU) {

          /* get image dimensions and total number of pixels in image */
          for (ii = 0; ii < 9; ii++)
              naxes[ii] = 1;

          fits_get_img_param(infptr, 9, &bitpix, &naxis, naxes, &status);

          totpix = naxes[0] * naxes[1] * naxes[2] * naxes[3] * naxes[4]
             * naxes[5] * naxes[6] * naxes[7] * naxes[8];
      }

      if (hdutype != IMAGE_HDU || naxis == 0 || totpix == 0) { 

          /* just copy tables and null images */
          fits_copy_hdu(infptr, outfptr, 0, &status);

      } else {

          /* Explicitly create new image, to support compression */
          fits_create_img(outfptr, bitpix, naxis, naxes, &status);

          /* copy all the user keywords (not the structural keywords) */
          fits_get_hdrspace(infptr, &nkeys, NULL, &status); 

          for (ii = 1; ii <= nkeys; ii++) {
              fits_read_record(infptr, ii, card, &status);
              if (fits_get_keyclass(card) > TYP_CMPRS_KEY)
                  fits_write_record(outfptr, card, &status);
          }

          switch(bitpix) {
              case BYTE_IMG:
                  datatype = TBYTE;
                  break;
              case SHORT_IMG:
                  datatype = TSHORT;
                  break;
              case LONG_IMG:
                  datatype = TLONG;
                  break;
              case FLOAT_IMG:
                  datatype = TFLOAT;
                  break;
              case DOUBLE_IMG:
                  datatype = TDOUBLE;
                  break;
          }

          bytepix = abs(bitpix) / 8;

          npix = totpix;
          iteration = 0;

          /* try to allocate memory for the entire image */
          /* use double type to force memory alignment */
          array = (double *) calloc(npix, bytepix);

          /* if allocation failed, divide size by 2 and try again */
          while (!array && iteration < 10)  {
              iteration++;
              npix = npix / 2;
              array = (double *) calloc(npix, bytepix);
          }

          if (!array)  {
              printf("Memory allocation error\n");
              return(0);
          }

          /* turn off any scaling so that we copy the raw pixel values */
          fits_set_bscale(infptr,  bscale, bzero, &status);
          fits_set_bscale(outfptr, bscale, bzero, &status);

          first = 1;
          while (totpix > 0 && !status)
          {
             /* read all or part of image then write it back to the output file */
             fits_read_img(infptr, datatype, first, npix, 
                     &nulval, array, &anynul, &status);

             fits_write_img(outfptr, datatype, first, npix, array, &status);
             totpix = totpix - npix;
             first  = first  + npix;
          }
          free(array);
      }

      if (single) break;  /* quit if only copying a single HDU */
      fits_movrel_hdu(infptr, 1, NULL, &status);  /* try to move to next HDU */
    }

    if (status == END_OF_FILE)  status = 0; /* Reset after normal error */

    fits_close_file(outfptr,  &status);
    fits_close_file(infptr, &status);

    /* if error occurred, print out error message */
    if (status)
       fits_report_error(stderr, status);
    return(status);
}

/*
imcopy - copy a FITS image with optional data compression

    imcopy inimage[ext] outimage[compress]

    Copy the input FITS image to the new output file with optional data compression. The output image maybe externally compressed with the gzip or Unix compress algorithm, or it may be internally compressed with the new tile compression format. The output image may be written in the tile-compressed FITS image format by adding the compression qualifiers in square brackets following the output file name.

    Examples: 

      imcopy infile.fit 'outfile.fit[compress]' 

           This will use the default compression algorithm (Rice) and the
           default tile size (row by row)

      imcopy infile.fit 'outfile.fit[compress GZIP]' 

           This will use the GZIP compression algorithm and the default
           tile size (row by row).  The allowed compression algorithms are
           Rice, GZIP, and PLIO.  Only the first letter of the algorithm
           name needs to be specified.

      imcopy infile.fit 'outfile.fit[compress G 100,100]' 

           This will use the GZIP compression algorithm and 100 X 100 pixel
           tiles.

      imcopy infile.fit 'outfile.fit[compress R 100,100; 4]' 

           This will use the Rice compression algorithm, 100 X 100 pixel
           tiles, and noise_bits = 4 (assuming the input image has a
           floating point data type).  Decreasing the value of noisebits
           will improve the overall compression efficiency at the expense
           of losing more information.

      imcopy infile.fit outfile.fit

           If the input file is in tile-compressed format, then it will be
           uncompressed to the output file.  Otherwise, it simply copies
           the input image to the output image.

      imcopy 'infile.fit[1001:1500,2001:2500]'  outfile.fit

           This extracts a 500 X 500 pixel section of the much larger
           input image (which may be in tile-compressed format).  The
           output is a normal uncompressed FITS image.

      imcopy 'infile.fit[1001:1500,2001:2500]'  outfile.fit.gz

           Same as above, except the output file is externally compressed
           using the gzip algorithm.

*/
