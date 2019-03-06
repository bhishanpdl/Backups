// topic   : linear combination of two fits files
// terminal: clear; gcc averageTwo.c -O2 -lcfitsio -lm -pthread && ./a.out out.fits
// Usage   : this program reads name of two fits fitsfiles from a text file called "filenames.txt"
//           and reads name of output fitsfile from the argument.
//           it reads data as doubles but when writing pixels to out.fits it makes it floats

#include <stdio.h>
#include <string.h>
#include <stdlib.h> 		// for atof
#include "fitsio.h"
#include <math.h>

void printerror( int status);

int main(int argc, char *argv[])
{
    fitsfile    *in1 ,*in2;       
    fitsfile	    *out;
                  
    int         status  = 0;    //CFITSIO status value MUST be initialized to zero!
    int 		    check   = 1;    // flag for dimension less than 3,two images same size and operator is valid    
    int         naxis1;         // value will be taken from fits_get_img_dim of first fits file
    int 		    naxis2;         // images with naxis > 3 dimensions are not supported
    int   		ii;             // counter for fitsio functions
    long 		npixels = 1;    
    long 		firstpix[3] = {1,1,1};  // firstpix[2] <= naxes1[2] is counter for planes of cube
                                        // firstpix[1] <= naxes1[1] is counter for rows of plane
    long 		naxes1[3] = {1,1,1};    // this value is updated in fits_get_img_size
    long		    naxes2[3] = {1,1,1};      
    double 		*pix1;                    
    double		*pix2;                  
    
    
   //routine to read and store names of fitsfiles 
   //************************************************************************************
    char    buffer[100]; // length of one string should be less than this
	char    filename[20][100]; // there are 20 strings
	FILE    *fp;
	int     n;     // total no. of items in the file
	int     i = 0; // counter to print items
	
	
	fp = fopen("filenames.txt", "r");
	

	//displaying error if filename is absent.	
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
	
	//storing data from the file in some arrays
	while(!feof(fp))			
	{			
		fscanf(fp,"%s[^\n]",buffer);	  // spaces, tabs, newlines will be ignored, only items will be read in the file	
		strcpy(filename[n],buffer);	
									
		n=n+1;
	}
	fclose(fp);
	n=n-1;	// true total no. of items
	
	// printing input	
	
	for(i=0;i<n;i++)
	    printf("%d: %s\n", i+1, filename[i]);
	    
    //********************************************************************************
    //removing old output file
    remove(argv[1]);
    
    
	//opening first fitsfile
    fits_open_file(&in1, filename[0], READONLY, &status);
        printerror(status);


    //opening second fitsfile
    fits_open_file(&in2, filename[1], READONLY, &status); 
        printerror(status);


	//reading dimension of first fitsfile
    fits_get_img_dim(in1, &naxis1, &status);
        printerror(status);
        printf("the dimension of %s is = %d\n", filename[0], naxis1);    


    //reading dimension of second fitsfile
    fits_get_img_dim(in2, &naxis2, &status);
        printerror(status);
        printf("the dimension of %s is = %d\n", filename[1], naxis2);


    //reading size of first image
    fits_get_img_size(in1, 3, naxes1, &status);
        printerror(status);
        
    //reading size of second image
    fits_get_img_size(in2, 3, naxes2, &status);
        printerror(status);
        printf("the size of '%s' is : row = %ld and col = %ld\n", filename[0],naxes1[1], naxes1[0] );

    //checking for error image having more than 3 dimensions
    if (naxis1 > 3)
    {
        printf("Error: images with > 3 dimensions are not supported\n");
        check = 0;
    }
    
    
    // check that the both images have the same size 
    else if ( naxes1[0] != naxes2[0] ||  naxes1[1] != naxes2[1] || naxes1[2] != naxes2[2]  )
	{
        printf("Error: input images don't have same size\n");
        check = 0;
    }


    // create the new empty output file if the above checks are OK 
    if (check && !fits_create_file(&out, argv[1], &status) )
    {
      	// copy all the header keywords from first image to new output file 
      	fits_copy_header(in1, out, &status);
      	
      	
        //allocating memory for pix1 and pix2
        // no. of pixels to read in each row (naxes1 is updated in fits_get_img_size)(cols of image1)
      	npixels = naxes1[0];  
      	
      	
        //pix1 and pix2 are double* and will be obtained later from 'fits_read_pix'
      	pix1 = (double *) malloc(npixels * sizeof(double)); // mem for 1 row i.e. no. of cols      	
      	pix2 = (double *) malloc(npixels * sizeof(double)); //pix1 and pix2 are double*
      	
      	
      	//checking error in memory allocation
      	if (pix1 == NULL || pix2 == NULL) 
      	{
        	printf("Memory allocation error\n");
        	return(1);
      	}
      	
      	

      	// loop over all planes of the cube (2D images have 1 plane) 
      	for (firstpix[2] = 1; firstpix[2] <= naxes1[2]; firstpix[2]++)
      	{
            	// loop over all rows of the plane 
        	    for (firstpix[1] = 1; firstpix[1] <= naxes1[1]; firstpix[1]++) //if naxes1[1] = rows = 20, loop goes 20 times
            	{
          	    // Read both images as doubles, regardless of actual datatype.
          	    // Give starting pixel coordinate and no. of pixels to read.  
          	    // This version does not support undefined pixels in the image
          	    

          		if (fits_read_pix(in1, TDOUBLE, firstpix, npixels, NULL, pix1, NULL, &status))
	    		        break;   // jump out of loop on error in reading pixels 
	  			if (fits_read_pix(in2, TDOUBLE, firstpix, npixels, NULL, pix2, NULL, &status))
	    		        break;   // jump out of loop on error in reading pixels 
	    		
	    		
                //mathematical operation
          		for(ii=0; ii< npixels; ii++)
          		    pix1[ii] = ((pix1[ii] + pix2[ii] ) / 1.0 ); 
          		    
          		    
          		//update the bitpix keyword
                long        bitpix = -32; // // -32 means FLOAT_IMG, -64 means DOUBLE_IMG
                fits_update_key(out, TLONG, "BITPIX", &bitpix, 0, &status);  
          		    	      				
          		//write new values to output image
          		fits_write_pix(out, TDOUBLE, firstpix, npixels, pix1, &status);
          		
        	    } // end of loop over rows of a plane
        	
        } // end of loop over planes of a cube
      	fits_close_file(out, &status);      // closing output image file each time inside the loop
      	free(pix1); // freeing the memory allocated by malloc each time inside the loop
      	free(pix2);

    }
    fits_close_file(in1, &status); // closing first input image file ( out of the loop)
    fits_close_file(in2, &status);
    
  	if (status) fits_report_error(stderr, status); // print any error message at the end of the program

    
    printf( "\n"
            "The first input  fits image    = %s\n"
            "The second input fits image    = %s\n"
            "The output fits image          = %s\n" 
            "\nPlease see in the directory, you can see the output file '%s'\n\n", filename[0], filename[1] , argv[1], argv[1]);
	return(status);
}

//--------------------------------------------------------------------------
void printerror( int status)
{

    if (status)
    {
       fits_report_error(stderr, status); 

       exit( status );    
    }
    return;
}//end of function printerror
//--------------------------------------------------------------------------
