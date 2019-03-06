// topic   : imarith - perform arithmetic on 1 or 2 images
// ref     : https://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples.html#fitscopy
// filepath: cd /Users/poudel/Copy/Programming/C/cprograms/cfitsio/fitsexamples

// terminal: clear; gcc imarith.c -O2 -lcfitsio -lm -pthread && ./a.out in1.fits in2.fits add \!out1.fits
// terminal: clear; gcc imarith.c -O2 -lcfitsio -lm -pthread && ./a.out in1.fits 0.1 mul \!out1.fits
// argc = 5                                           argv      0       1        2   3     4
// to see the table values: open fv application and compare values


#include <string.h>
#include <stdio.h>
#include <stdlib.h> 		// for atof
#include "fitsio.h"

int main(int argc, char *argv[])
{
    fitsfile 	*infptr1;       //fitsfile pointers
    fitsfile	*infptr2;       // used in fits_open_file and value is argv[2]
    fitsfile	*outfptr;       // used in fits_create_file and value is argv[4]       
    int 		status  = 0;    //CFITSIO status value MUST be initialized to zero!
    int 		check   = 1;    // flag for dimension less than 3,two images same size and operator is valid
    int 		image2  = 1;    // flag for checking presence of image 2 or numerical value
    int  		anaxis;         // value will be taken from fits_get_img_dim of first fits file
    int 		bnaxis;         // images with naxis > 3 dimensions are not supported
    int   		ii;             // counter for fitsio functions
    int         op;             // operation used in switch
    long 		npixels = 1;    // npixels = anaxes[0] later and will be obtained from fits_get_img_size
    long 		firstpix[3] = {1,1,1};  //firstpix[2] <= anaxes[2] is counter for planes of cube, firstpix[1] <= anaxes[1] is ctr for rows of plane
    long 		anaxes[3] = {1,1,1};    // this value is updated in fits_get_img_size
    long		bnaxes[3]={1,1,1};      // outside example: naxes[2]={300,200} means row*col = 200*300 pixels
    double		value;                  //value = atof(argv[2])
    double 		*apix;                  //apix = (double *) malloc(npixels * sizeof(double)); // mem for 1 row  
    double		*bpix;                  //if (image2) bpix = (double *) malloc(npixels * sizeof(double));
                                        //if (image2 && fits_read_pix(infptr2, TDOUBLE, firstpix, npixels,NULL, bpix, NULL, &status))
                                        //if (fits_read_pix(infptr1, TDOUBLE, firstpix, npixels, NULL, apix, NULL, &status)), inside loop of rows in a plane
                                        //fits_write_pix(outfptr, TDOUBLE, firstpix, npixels, apix, &status);
                                        //free(apix); // freeing the memory allocated by malloc
    


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


	//opening input image (eg. in1.fits)
    fits_open_file(&infptr1, argv[1], READONLY, &status);
    //(fitsfile **fptr, char *filename, int iomode, > int *status)

    //checking for error (if status = 0, it is ignored )
    if (status)
    {
        fits_report_error(stderr, status); // (FILE *stream, status)
        return(status);
    }


    //opening second image, if it is not fisfile status will be non zero
    fits_open_file(&infptr2, argv[2], READONLY, &status); 

    //checking for error in opening second input image
    if (status) //if status = 0, it will be ignored i.e. ignored for second fitsfile
    {
        value = atof(argv[2]); // if argv[2] is a number array is converted to float
        
        // if argv[2] is neither fitsfile nor numerical, error is printed
        if (value == 0.0)
        {
			printf(
			    "Error: second argument (argv[2]) is neither an image name"
	       		" nor a valid numerical value.\n");
			    return(status);     // status is non zero here
        }        
        
        image2 = 0;  // if argv[2] is number, flag image2 = 0, otherwise image2 = 1
        status = 0; // status is made 0, even if the second argument is a number
    }


	//reading dimension of first image
    fits_get_img_dim(infptr1, &anaxis, &status); 
    // (fitsfile *fptr, > int *naxis, int *status)
    // value of anaxis is dimension and is updated here
    //dimension 3 means this program works for data cube


    // if image2 = 0, it will be ignored
    if (image2) fits_get_img_dim(infptr2, &bnaxis, &status);


    //reading size of first image
    fits_get_img_size(infptr1, 3, anaxes, &status);
    //(fitsfile *fptr, int maxdim, > long *naxes, int *status)
    // maxdim 3 means this program works for data cube
    // initial value is anaxes[3] = {1,1,1}
    // value of anaxes[0] and anaxes[1] will be updated here
    // value of anaxes[2] = 1 for a plane image


    //if image2 != 0, it will be executed, initialization is image2 = 1
    if (image2) fits_get_img_size(infptr2, 3, bnaxes, &status);

    //if there is error in getting size of second image, error will be printed
    if (status)
    {
        fits_report_error(stderr, status); // print error message 
        return(status);
    }


    //checking for error image having more than 3 dimensions
    if (anaxis > 3)
    {
        printf("Error: images with > 3 dimensions are not supported\n");
        check = 0;
    }
    
    
    // check that the input 2 images have the same size 
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



    // create the new empty output file if the above checks are OK 
    //(fitsfile **fptr, char *filename, > int *status)
    // check equal non zero means less than 3 dimension,two images same size and operator is valid
    if (check && !fits_create_file(&outfptr, argv[4], &status) )
    {
      	// copy all the header keywords from first image to new output file 
      	fits_copy_header(infptr1, outfptr, &status);

      	npixels = anaxes[0];  // no. of pixels to read in each row (anaxes is updated in fits_get_img_size)

      	apix = (double *) malloc(npixels * sizeof(double)); // mem for 1 row 
      	
      	
      	if (image2) bpix = (double *) malloc(npixels * sizeof(double));
      	if (apix == NULL || (image2 && bpix == NULL)) 
      	{
        	printf("Memory allocation error\n");
        	return(1);
      	}
      	
      	

      	// loop over all planes of the cube (2D images have 1 plane) 
      	for (firstpix[2] = 1; firstpix[2] <= anaxes[2]; firstpix[2]++)
      	{
        	// loop over all rows of the plane 
        	for (firstpix[1] = 1; firstpix[1] <= anaxes[1]; firstpix[1]++)
        	{
          	    // Read both images as doubles, regardless of actual datatype.
          	    // Give starting pixel coordinate and no. of pixels to read.  
          	    // This version does not support undefined pixels in the image
          	    
//fits_read_pix(fitsfile *fptr   , int datatype, long *fpixel              , LONGLONG nelements, DTYPE *nulval, > DTYPE *array, int *anynul, int *status)
//fits_read_pix(fitsfile *infptr1, TDOUBLE     , long firstpix[3] = {1,1,1}, long     npixels  , NULL         ,   double *apix, NULL       , &status)
//npixels,apix, and status will be read from the fits file

          		if (fits_read_pix(infptr1, TDOUBLE, firstpix, npixels, NULL, apix, NULL, &status))
	    		break;   // jump out of loop on error 
	  			if (image2 && fits_read_pix(infptr2, TDOUBLE, firstpix, npixels,NULL, bpix, NULL, &status))
	    		break;   // jump out of loop on error 

          		switch (op)
          		{
          		    case 1: // addition
            			for(ii=0; ii< npixels; ii++)
	      			        if (image2)
							    apix[ii] += bpix[ii];
	      				    else
							    apix[ii] += value;
            				    break;

          	        case 2: // subtraction
            			for(ii=0; ii< npixels; ii++)
	      				    if (image2)
							    apix[ii] -= bpix[ii];
	      				    else
							     apix[ii] -= value;
            				    break;

          			case 3: // muliplication
            			for(ii=0; ii< npixels; ii++)
	      				    if (image2)
							    apix[ii] *= bpix[ii];
	      				    else
							    apix[ii] *= value;
            				    break;

          		    case 4: // division
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
	      					    apix[ii] /= value;
            			} // end of case 4
          		} // end of swith statement
          		//write new values to output image
          		fits_write_pix(outfptr, TDOUBLE, firstpix, npixels, apix, &status);
        	} // end of loop over rows of a plane
        } // end of loop over planes of a cube
      	fits_close_file(outfptr, &status);      // closing output image file each time inside the loop
      	free(apix); // freeing the memory allocated by malloc each time inside the loop
      	if (image2) free(bpix);

    }
    fits_close_file(infptr1, &status);          // closing first input image file ( out of the loop)

    if (image2) fits_close_file(infptr2, &status);
  	if (status) fits_report_error(stderr, status); // print any error message 

    printf("value of anaxes[0]     = %ld is the no. of clms of first input image '%s'\n", anaxes[0], argv[1]);
    printf("value of anaxes[1]     = %ld is the no. of rows of first input image '%s'\n", anaxes[1], argv[1]);
    printf("image dimension        = 2\n");
    printf("image size 'row * col' = %ld * %ld\n", anaxes[1], anaxes[0]);
    printf("value of anaxes[2]     = %ld\n", anaxes[2]);
    printf("value of npixels       = %ld is number of pixels in each row\n", npixels);
    
    printf(
            "\nThe first input  fits image                       = %s\n"
            "The second input fits image or operation value    = %s\n"
            "The mathematical operation                        = %s\n"
            "The output fits image                             = %s\n" 
            "\nPlease see in the directory, you can see the output file\n\n", argv[1], argv[2] ,argv[3], argv[4]);
	return(status);
}

/* fits functions from the routine fitsio ( note: > means input)
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

8. fits_write_pix(fitsfile *outfptr,     TDOUBLE , long firstpix[3]  , long npixels = 1   , double *apix  ,     &status);
   fits_write_pix(fitsfile *fptr   , int datatype, long *fpixel      , LONGLONG nelements , DTYPE  *array , int *status)
   fits_write_pix(fitsfile *outfptr,     TFLOAT  , long int fpixel[2], onaxes[0]*onaxes[1], float  *oimage,     &status);
   //from jediconvolve: long int onaxes[2]:
   //fits_write_pix(outfptr, TFLOAT , fpixel  , onaxes[0]*onaxes[1], oimage  , &status); from jediconvolve.c
   //fits_write_pix(outfptr, TFLOAT , fpixel  , onaxes[0]*onaxes[1], outimage, &status); from jedidistort.c
   //fits_write_pix(outfptr, TDOUBLE, firstpix, npixels            , apix    , &status); from imarith.c
   //from imarith: npixels = anaxes[0] later and will be obtained from fits_get_img_size
                            
                            


9. fits_close_file(outfptr, &status);
   //             (fptr,    &status)

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

