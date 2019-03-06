// topic   : average of two input fitsfiles whose name is taken from a text file
// ref     : https://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples.html#fitscopy
// filepath: cd /Users/poudel/Copy/Programming/C/cprograms/cfitsio/fitstry
// terminal: clear; gcc b.c -O2 -lcfitsio -lm -pthread && ./a.out

#include <stdio.h>
#include <string.h>
#include <stdlib.h> 		// for atof
#include "fitsio.h"
#include <math.h>

void printerror( int status);

int main(int argc, char *argv[])
{
    fitsfile *in1, *in2, *out ;
    fitsfile *names[3] = { in1, in2, out }; 
                   
    int         status  = 0;    //CFITSIO status value MUST be initialized to zero!
    int         check   = 1;    // flag for dim< 3,two images same size and operator is valid
    
        
    int         naxis1;         // value will be taken from fits_get_img_dim of first fits file
    int         naxis2;         // images with naxis > 3 dimensions are not supported
    int         naxis[2] = { naxis1, naxis2 };
    
    
    int   		ii;             // counter for fitsio functions
    long 		npixels = 1;    
    long 		firstpix[3] = {1,1,1};  // firstpix[2] <= naxes1[2] is counter for planes of cube
                    // firstpix[1] <= naxes1[1] is counter for rows of plane
                    // this value is updated in fits get size                                    
                                        
    long 		naxes1[3] = {1,1,1};    
    long        naxes2[3] = {1,1,1};
    long        naxes[2]  = { naxes1[3], naxes2[3] }; 
    
         
    double 		*pix1;                    
    double		*pix2;
    double      *pix[2] = { pix1, pix2 };                  
    
    
   //routine to read and store names of fitsfiles 
   //***********************************************************************
    char    buffer[100]; // length of one string should be less than this
	char    filename[20][100]; // there are 20 strings
	FILE    *fp;
	int     n = 0;     // total no. of items in the file
	int     i = 0; // counter to print items
	
	
	fp = fopen("writeImageFile.txt", "r");
	

	//displaying error if filename is absent.	
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
    
    
    
    //..........
    
    
    //while (fgets(buffer, sizeof(buffer), fp) != NULL)
    while (fscanf(fp,"%s",buffer) > 0)
    {
	    n=n+1;
    }
    fprintf(stdout,"%i lines in the text file\n", n);
    printf("value of n = %d\n", n);
    
    rewind(fp);
    
    for(i=0; i<n;i++)
    {
        fscanf(fp,"%s[^\n]",buffer);	  // spaces, tabs, newlines will be ignored
		strcpy(filename[i],buffer);	
    
    }
    fclose(fp);
    
    
    
    //...........
    
    
    
    
    
	/*
	//storing data from the file in some arrays
	while(!feof(fp))			
	{			
		fscanf(fp,"%s[^\n]",buffer);	  // spaces, tabs, newlines will be ignored
		strcpy(filename[n],buffer);	
									
		n=n+1;
	}
	fclose(fp);
	n=n-1;	// true total no. of items
	
	*/
	
	
	
	
	
	
	printf("value of n = %d\n", n);
	// printing input	
	printf("\nContents inside the text file are following:\n");
	for(i=0;i<n;i++)
	    printf("%d: %s\n", i+1, filename[i]);
	    
    //**************************************************************
    
    //Delete old output file (defined inside stdio.h) //
    remove(filename[2]);
    
    
	
	
	int j=0;
	for (j=0;j<2;j++)
	{
	    //opening fitsfiles
        fits_open_file(&names[j], filename[j], READONLY, &status);
        printerror(status);
        
        //reading dimension of fitsfile
        fits_get_img_dim(names[j], &naxis[j], &status);
        printerror(status);
        printf("\nthe dimension of %s is = %d", filename[j], naxis[j]);
        
        
        /*
        //reading size of first image
        fits_get_img_size(names[j], 3, naxes[j], &status);
        printerror(status);
        
        */
        
        //we get a warning  and no out.fits will be created
        /* warning: incompatible integer to pointer conversion
      passing 'long' to parameter of type 'long *'; take the address
      with & [-Wint-conversion]
        fits_get_img_size(names[j], 3, naxes[j], &status);
                                       ^~~~~~~~
                                       &
        /usr/local/include/fitsio.h:1089:54: note: passing argument to
        parameter 'naxes' here
        int CFITS_API ffgisz(fitsfile *fptr, int nlen, long *naxes, int ...

        
        */
        
        
        
    }
        
        
        

    
    //reading size of first image
    fits_get_img_size(names[0], 3, naxes1, &status);
    printerror(status);
        
    //reading size of second image
    fits_get_img_size(names[1], 3, naxes2, &status);
    printerror(status);
    printf("\nthe size of '%s' is : row = %ld and col = %ld\n", filename[0],naxes1[1], naxes1[0] );
       
        
      
        
        
        
        

    //checking for error image having more than 3 dimensions
    if (naxis1 > 3)
    {
        printf("Error: images with > 3 dimensions are not supported\n");
        check = 0;
    }
    
    
    // check that the both images have the same size 
    if ( naxes1[0] == naxes2[0] &&
         naxes1[1] == naxes2[1] &&
         naxes1[2] == naxes2[2]  )
	{
        printf("\nAll images have the same size\n");
        check = 1;
    }

    else
    {
        printf("\nError: input images don't have same size\n");
        check = 0;
    }
    




    // create the new empty output file if the above checks are OK 
    if (check && !fits_create_file(&names[2], filename[2], &status) )
    {
      	// copy all the header keywords from first image to new output file 
      	fits_copy_header(names[0], names[2], &status);
      	
      	
        // allocating memory for pix1 and pix2
        // no. of pixels to read in each row
        // naxes1 is updated in fits_get_img_size)(cols of image1
      	npixels = naxes1[0]; 
      	
      	/* here, we get segmentation fault
      	//allocating memory for pixels
      	for(j=0;j<2;j++)
      	{
      	    pix[j] = (double *) malloc(npixels * sizeof(double));
      	} 
      	*/ 
      	

      	
      	
        //pix1 and pix2 are double* and will be obtained later from 'fits_read_pix'
        //allocating memory for pixels
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
            	//if naxes1[1] = rows = 20, loop goes 20 times 
        	    for (firstpix[1] = 1; firstpix[1] <= naxes1[1]; firstpix[1]++) 
            	{
          	    // Read both images as doubles, regardless of actual datatype.
          	    // Give starting pixel coordinate and no. of pixels to read.  
          	    // This version does not support undefined pixels in the image
          	    
          	    
          	    /* here, we get segmentation fault
          	     // jump out of loop on error in reading pixels
          	     for(j=0;j<2;j++)
          	     {
          	        if (fits_read_pix(names[j], TDOUBLE, firstpix, npixels, NULL, pix[j], NULL, &status))
	    		        break; 
          	     }
          	    
          	    */
          	    
          	    
          	    
                
          		if (fits_read_pix(names[0], TDOUBLE, firstpix, npixels, NULL, pix1, NULL, &status))
	    		        break;   // jump names[2] of loop on error in reading pixels 
	  			if (fits_read_pix(names[1], TDOUBLE, firstpix, npixels, NULL, pix2, NULL, &status))
	    		        break;   // jump names[2] of loop on error in reading pixels 
	    		        
	    		  
	    		        
	    		        
	    		
	    		
                //mathematical operation
          		for(ii=0; ii< npixels; ii++)
          		    pix1[ii] = ((pix1[ii] + pix2[ii] ) / 1.0 ); 
          		    
          		    
          		//update the bitpix keyword
                long        bitpix = -32; // // -32 means FLOAT_IMG, -64 means DOUBLE_IMG
                fits_update_key(names[2], TLONG, "BITPIX", &bitpix, 0, &status);  
          		    	      				
          		//write new values to output image
          		fits_write_pix(names[2], TDOUBLE, firstpix, npixels, pix1, &status);
          		
        	    } // end of loop over rows of a plane
        	
        } // end of loop over planes of a cube
         // closing output image file each time inside the loop
      	fits_close_file(names[2], &status);
      	
        // freeing the memory allocated by malloc each time inside the loop
        for(j=0;j<2;j++)
        {
            free(pix[j]);
        }
        

    }//end of if statement when checks are ok
    
    // closing input fitsfiles
    for(j=0;j<2;j++)
    {
        fits_close_file(names[j], &status);
    }
    
    
  	if (status) fits_report_error(stderr, status); // print any error message at the end of the program

    
    //printing success
    printf("\nPlease see in the directory, you can see the output file\n\n");
    
	return(status);
}

//--------------------------------------------------------
void printerror( int status)
{
    /*****************************************************/
    /* Print names[2] cfitsio error messages and exit program */
    /*****************************************************/


    if (status)
    {
       fits_report_error(stderr, status); /* print error report */

       exit( status );    /* terminate the program, returning error status */
    }
    return;
}//end of function printerror
//--------------------------------------------------------------------------
