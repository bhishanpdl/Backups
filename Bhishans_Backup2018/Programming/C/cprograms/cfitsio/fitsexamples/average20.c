// topic   : average of two input fitsfiles whose name is taken from a text file
// ref     : https://heasarc.gsfc.nasa.gov/docs/software/fitsio/cexamples.html#fitscopy
// filepath: cd /Users/poudel/Copy/Programming/C/cprograms/cfitsio/fitstry
// terminal: clear; gcc average20.c -O2 -lcfitsio -lm -pthread && ./a.out

#include <stdio.h>
#include <string.h>
#include <stdlib.h> 		// for atof
#include "fitsio.h"
#include <math.h>

void printerror( int status);

int main(int argc, char *argv[])
{
    fitsfile    *in1,  *in2,  *in3,  *in4,  *in5;
    fitsfile    *in6,  *in7,  *in8,  *in9,  *in10;
    fitsfile    *in11, *in12, *in13, *in14, *in15;
    fitsfile    *in16, *in17, *in18, *in19, *in20;
    fitsfile    *out;
    
    fitsfile    *names[21] = {  in1,  in2,  in3,  in4,  in5,
                                in6,  in7,  in8,  in9,  in10,
                                in11, in12, in13, in14, in15,
                                in16, in17, in18, in19, in20, out
                          }; 
                   
    int         status  = 0;    //CFITSIO status value MUST be initialized to zero!
    int         check   = 1;    // flag for dim< 3,two images same size and operator is valid
    
        
    int         naxis1,  naxis2,  naxis3,  naxis4,  naxis5;
    int         naxis6,  naxis7,  naxis8,  naxis9,  naxis10;
    int         naxis11, naxis12, naxis13, naxis14, naxis15;
    int         naxis16, naxis17, naxis18, naxis19, naxis20;
    int         naxis[20] = { naxis1,  naxis2,  naxis3,  naxis4,  naxis5,
                              naxis6,  naxis7,  naxis8,  naxis9, naxis10,
                              naxis11, naxis12,  naxis13,  naxis14,  naxis15,
                              naxis16,  naxis17,  naxis18,  naxis19, naxis20 
                            };
    
    
    int   		ii;             // counter for fitsio functions
    long 		npixels = 1;    
    long 		firstpix[3] = {1,1,1};  // firstpix[2] <= naxes1[2] is counter for planes of cube
                    // firstpix[1] <= naxes1[1] is counter for rows of plane
                    // this value is updated in fits get size                                    
                                        
    long 		naxes1[3]  = {1,1,1}, naxes2[3]  = {1,1,1}, naxes3[3]  = {1,1,1}, naxes4[3]  = {1,1,1};     
    long 		naxes5[3]  = {1,1,1}, naxes6[3]  = {1,1,1}, naxes7[3]  = {1,1,1}, naxes8[3]  = {1,1,1};
    long 		naxes9[3]  = {1,1,1}, naxes10[3] = {1,1,1}, naxes11[3] = {1,1,1}, naxes12[3] = {1,1,1};
    long 		naxes13[3] = {1,1,1}, naxes14[3] = {1,1,1}, naxes15[3] = {1,1,1}, naxes16[3] = {1,1,1};
    long 		naxes17[3] = {1,1,1}, naxes18[3] = {1,1,1}, naxes19[3] = {1,1,1}, naxes20[3] = {1,1,1};
    long        *naxes[20]  = {     naxes1,  naxes2,  naxes3,  naxes4,
                                    naxes5,  naxes6,  naxes7,  naxes8,
                                    naxes9,  naxes10, naxes11, naxes12,
                                    naxes13, naxes14, naxes15, naxes16,
                                    naxes17, naxes18, naxes19, naxes20 };
    
         
    double 		*pix1,  *pix2,  *pix3,  *pix4,  *pix5;                    
    double 		*pix6,  *pix7,  *pix8,  *pix9,  *pix10;
    double 		*pix11, *pix12, *pix13, *pix14, *pix15;
    double 		*pix16, *pix17, *pix18, *pix19, *pix20;
    double      *pix[20] =   {  pix1,   pix2,   pix3,  pix4,  pix5,
                                pix6,   pix7,   pix8,  pix9,  pix10,
                                pix11,  pix12,  pix13, pix14, pix15,
                                pix16,  pix17,  pix18, pix19, pix20 };              
                      
    
    
   //routine to read and store names of fitsfiles 
   //***********************************************************************
    char    buffer[100]; // length of one string should be less than this
	char    filename[50][100]; // there are 50 strings
	FILE    *fp;
	int     n = 0;     // total no. of items in the file
	int     i = 0; // counter to print items
	
	
	fp = fopen("filenames.txt", "r");
	

	//displaying error if filename is absent.	
	if (fp == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);
    }
	
	//storing data from the file in some arrays
	while(!feof(fp))			
	{			
		fscanf(fp,"%s[^\n]",buffer);	  // spaces, tabs, newlines will be ignored
		strcpy(filename[n],buffer);	
									
		n=n+1;
	}
	fclose(fp);
	n=n-1;	// true total no. of items
	
	// printing input	
	printf("Contents inside the text file are following:\n\n");
	for(i=0;i<n;i++)
	    printf("%d: %s\n", i, filename[i]);
	    
    //**************************************************************
    
    //Delete old output file
    remove(filename[20]);
    
    
	
	
	int j=0;
	for (j=0;j<20;j++)
	{
	    //opening fitsfiles
        fits_open_file(&names[j], filename[j], READONLY, &status);
        printerror(status);
        
        //reading dimension of fitsfile
        fits_get_img_dim(names[j], &naxis[j], &status);
        printerror(status);
        //printf("\nthe dimension of %s is = %d", filename[j], naxis[j]);
        
        //reading size of images
        fits_get_img_size(names[0],  3, naxes[j],  &status);
        printerror(status);
        
    }
        
    
    
    //printing sizes obtained from fits get image size     
    printf( "\nthe size of '%s' is following :"
            "\ncol naxes1[0] = %ld \nrow naxes1[1] = %ld\n\n",
            filename[0],naxes1[0], naxes1[1] 
          );
       
        
      
       
        
        
        

    //checking for error image having more than 3 dimensions
    if (naxis1 > 3)
    {
        printf("Error: images with > 3 dimensions are not supported\n");
        check = 0;
    }
    
    
    
    
    
    //check all images has same size
    
    printf("col naxes1[0] = %ld and naxes20[0] = %ld    \n", naxes1[0], naxes20[0]);
    printf("row naxes1[1] = %ld and naxes20[1] = %ld    \n", naxes1[1], naxes20[1]);
    printf("third dim naxes1[2] = %ld and naxes20[2] = %ld    \n", naxes1[2], naxes20[2]);
    
    
    /* bug, why?
    printf("\n");
    printf("col naxes1[0] = %ld\n", naxes1[0]);
    printf("col naxes2[0] = %ld\n", naxes2[0]);
    printf("col naxes3[0] = %ld\n", naxes3[0]);
    
    
     if (naxes1[0]  == naxes2[0] == naxes3[0])
        printf("col have same size\n");
     
     
     */
    
    
    
    
    // check that all the images have the same size of columns            
    if( naxes1[0]  == naxes2[0] && naxes1[0] == naxes11[0] &&
        naxes1[0]  == naxes3[0] && naxes1[0] == naxes12[0] &&
        naxes1[0]  == naxes4[0] && naxes1[0] == naxes13[0] &&
        naxes1[0]  == naxes5[0] && naxes1[0] == naxes14[0] &&
        naxes1[0]  == naxes6[0] && naxes1[0] == naxes15[0] &&
        naxes1[0]  == naxes7[0] && naxes1[0] == naxes16[0] &&
        naxes1[0]  == naxes8[0] && naxes1[0] == naxes17[0] &&
        naxes1[0]  == naxes9[0] && naxes1[0] == naxes18[0] &&
        naxes1[0]  == naxes10[0] && naxes1[0] == naxes19[0] &&
        naxes1[0]  == naxes20[0] )        
    {
        printf("\nall the images have the same size of clm  = %ld", naxes1[0]);
    }
            
    else
    {
        printf("\nError: input images don't have same size of columns");
        check = 0;
    }
    
    // check that all the images have the same size of rows            
    if( naxes1[1]  == naxes2[1]  && naxes1[1] == naxes11[1] &&
        naxes1[1]  == naxes3[1]  && naxes1[1] == naxes12[1] &&
        naxes1[1]  == naxes4[1]  && naxes1[1] == naxes13[1] &&
        naxes1[1]  == naxes5[1]  && naxes1[1] == naxes14[1] &&
        naxes1[1]  == naxes6[1]  && naxes1[1] == naxes15[1] &&
        naxes1[1]  == naxes7[1]  && naxes1[1] == naxes16[1] &&
        naxes1[1]  == naxes8[1]  && naxes1[1] == naxes17[1] &&
        naxes1[1]  == naxes9[1]  && naxes1[1] == naxes18[1] &&
        naxes1[1]  == naxes10[1] && naxes1[1] == naxes19[1] &&
        naxes1[1]  == naxes20[1] )        
    {
        printf("\nall the images have the same size of row  = %ld", naxes1[1]);
    }
            
    else
    {
        printf("\nError: input images don't have same size of columns");
        check = 0;
    }
    
    

    // create the new empty output file if the above checks are OK 
    if (check && !fits_create_file(&names[20], filename[20], &status) )
    {
      	// copy all the header keywords from first image to new output file 
      	fits_copy_header(names[0], names[20], &status);
      	
      	
        // allocating memory for pix1 and pix2
        // no. of pixels to read in each row
        // naxes1 is updated in fits_get_img_size)(cols of image1
      	npixels = naxes1[0]; 
      	
      	
        //allocating memory for pixels
      	pix1  = (double *) malloc(npixels * sizeof(double));     	
      	pix2  = (double *) malloc(npixels * sizeof(double));
      	pix3  = (double *) malloc(npixels * sizeof(double));     	
      	pix4  = (double *) malloc(npixels * sizeof(double));
      	pix5  = (double *) malloc(npixels * sizeof(double));     	
      	pix6  = (double *) malloc(npixels * sizeof(double));
      	pix7  = (double *) malloc(npixels * sizeof(double));     	
      	pix8  = (double *) malloc(npixels * sizeof(double));
      	pix9  = (double *) malloc(npixels * sizeof(double));     	
      	pix10 = (double *) malloc(npixels * sizeof(double));
      	pix11 = (double *) malloc(npixels * sizeof(double));     	
      	pix12 = (double *) malloc(npixels * sizeof(double));
      	pix13 = (double *) malloc(npixels * sizeof(double));     	
      	pix14 = (double *) malloc(npixels * sizeof(double));
      	pix15 = (double *) malloc(npixels * sizeof(double));     	
      	pix16 = (double *) malloc(npixels * sizeof(double));      	
      	pix17 = (double *) malloc(npixels * sizeof(double));     	
      	pix18 = (double *) malloc(npixels * sizeof(double));
      	pix19 = (double *) malloc(npixels * sizeof(double));     	
      	pix20 = (double *) malloc(npixels * sizeof(double));
      	
      	
      	
      	
      	
      	//checking error in memory allocation
      	if  (   pix1  == NULL || pix2  == NULL || pix3  == NULL || pix4  == NULL ||
      	        pix5  == NULL || pix6  == NULL || pix7  == NULL || pix8  == NULL ||
      	        pix9  == NULL || pix10 == NULL || pix11 == NULL || pix12 == NULL ||
      	        pix13 == NULL || pix14 == NULL || pix15 == NULL || pix16 == NULL ||
      	        pix17 == NULL || pix18 == NULL || pix19 == NULL || pix20 == NULL 
      	
      	    ) 
      	{
        	printf("\nMemory allocation error");
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
                // jump out of loop on error in reading pixels     	    
          	    
                
          		if (fits_read_pix(names[0], TDOUBLE, firstpix, npixels, NULL, pix1, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[1], TDOUBLE, firstpix, npixels, NULL, pix2, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[2], TDOUBLE, firstpix, npixels, NULL, pix3, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[3], TDOUBLE, firstpix, npixels, NULL, pix4, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[4], TDOUBLE, firstpix, npixels, NULL, pix5, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[5], TDOUBLE, firstpix, npixels, NULL, pix6, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[6], TDOUBLE, firstpix, npixels, NULL, pix7, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[7], TDOUBLE, firstpix, npixels, NULL, pix8, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[8], TDOUBLE, firstpix, npixels, NULL, pix9, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[9], TDOUBLE, firstpix, npixels, NULL, pix10, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[10], TDOUBLE, firstpix, npixels, NULL, pix11, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[11], TDOUBLE, firstpix, npixels, NULL, pix12, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[12], TDOUBLE, firstpix, npixels, NULL, pix13, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[13], TDOUBLE, firstpix, npixels, NULL, pix14, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[14], TDOUBLE, firstpix, npixels, NULL, pix15, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[15], TDOUBLE, firstpix, npixels, NULL, pix16, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[16], TDOUBLE, firstpix, npixels, NULL, pix17, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[17], TDOUBLE, firstpix, npixels, NULL, pix18, NULL, &status))
	    		        break;
	    		    if (fits_read_pix(names[18], TDOUBLE, firstpix, npixels, NULL, pix19, NULL, &status))
	    		        break;   
	  			if (fits_read_pix(names[19], TDOUBLE, firstpix, npixels, NULL, pix20, NULL, &status))
	    		        break;

	    		 
	    		        
	    		
	    		
                //mathematical operation
          		for(ii=0; ii< npixels; ii++)
          		    pix1[ii] = ((   pix1[ii]  + pix2[ii]   + pix3[ii]  + pix4[ii]  +
          		                    pix5[ii]  + pix6[ii]   + pix7[ii]  + pix8[ii]  +
          		                    pix9[ii]  + pix10[ii]  + pix11[ii] + pix12[ii] +
          		                    pix13[ii] + pix14[ii]  + pix15[ii] + pix16[ii] +
          		                    pix17[ii] + pix18[ii]  + pix19[ii] + pix20[ii]
          		                
          		                ) / 1.0 ); 
          		    
          		    
          		//update the bitpix keyword
                long        bitpix = -32; // // -32 means FLOAT_IMG, -64 means DOUBLE_IMG
                fits_update_key(names[20], TLONG, "BITPIX", &bitpix, 0, &status);  
          		    	      				
          		//write new values to output image
          		fits_write_pix(names[20], TDOUBLE, firstpix, npixels, pix1, &status);
          		
        	    } // end of loop over rows of a plane
        	
        } // end of loop over planes of a cube
         // closing output image file each time inside the loop
      	fits_close_file(names[20], &status);
      	
        // freeing the memory allocated by malloc each time inside the loop
        for(j=0;j<20;j++)
        {
            free(pix[j]);
        }
        

    }//end of if statement when checks are ok
    
    // closing input fitsfiles
    for(j=0;j<20;j++)
    {
        fits_close_file(names[j], &status);
    }
    
    
  	if (status) fits_report_error(stderr, status); // print any error message at the end of the program

    
    //printing success
    printf("\n\nPlease see in the directory, you can see the output file\n\n");
    
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
