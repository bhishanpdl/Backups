// topic: Transmitting a 1D fits file into an ASCII Table File
// filepath: cd /Users/poudel/Copy/Programming/C/cprograms/cfitsio/fitsexamples
/// terminal: gcc oneDfits2tab.c -lm -lcfitsio && ./a.out in.fit \!out.fits


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#include "fitsio.h"


/******************************************/
// Main :
int main(int argc, char*argv[]) 
{
  fitsfile *fptr;
  FILE *out;
  int i, k, bitpix, naxis, Xsz, status = 0;
  long naxes[2]={1,1}, fpix[2]={1,1};
  float *tab;
  double *Dtab;
  double crpix, crval, cdelt, yval;

  int silent = 0;

  // Arguments:
  char *inflnm;  // Original Fits File.
  char *outflnm; // Output ASCII File Name.

  // Minimum number of arguments :
  int Nargs = 2;

  if(argc < Nargs+1 ) {
    printf("Usage: %s 1D.fits OutName [-s]\n\n", argv[0]);
    printf("  Transmit a 1D fits file into an ASCII Table File.\n");
    printf("  Copy CR headers as table comments ( #... )\n\n");
    printf("  [-s] for silent mode\n\n");
    return 0;
  }
  
  inflnm = argv[1];
  outflnm= argv[2];

  setbuf(stdout, NULL);

   // Scan command line for arguments :
  k=Nargs+1;

  while ( k<argc && *(argv[k]) == '-') {
    if (strcmp(argv[k],"-s") == 0) {
      k++;
      silent = 1;
      if(k>=argc) break;
    }
    else k++;
  }

  // Check that it's a 1D floating point Fits file :
  if(fits_open_file(&fptr, inflnm, READONLY, &status)) {
    printf(" ! Unable to open file %s :\n", inflnm);
    fits_report_error(stdout, status); return 1;}
  
  fits_get_img_type(fptr, &bitpix, &status);
  if( bitpix != FLOAT_IMG && bitpix != DOUBLE_IMG) {
    printf(" ! Fits is not FLOAT_IMG nor DOUBLE_IMG.\n"); return 1;}


  // Get Number of Dimensions :
  fits_get_img_dim(fptr, &naxis, &status);
  if( naxis == 2 ) {

    // Get size and allocate vectors :
    fits_get_img_size(fptr, 2, naxes, &status);
    if ( naxes[0] != 1 ) {
      printf(" ! Fits is not 1D.\n"); return 1;}

    Xsz = naxes[1];

    // Read CR headers :
    fits_read_key(fptr, TDOUBLE, "CRPIX2", &crpix, NULL, &status);
    fits_read_key(fptr, TDOUBLE, "CRVAL2", &crval, NULL, &status);
    fits_read_key(fptr, TDOUBLE, "CDELT2", &cdelt, NULL, &status);
  }
  else if ( naxis == 1 ) {

    fits_get_img_size(fptr, 1, naxes, &status);

    Xsz = naxes[0];

    // Read CR headers :
    if( fits_read_key(fptr, TDOUBLE, "CRPIX1", &crpix, NULL, &status)){
      status = 0;
      crpix  = 1;
    }
    fits_read_key(fptr, TDOUBLE, "CRVAL1", &crval, NULL, &status);
    fits_read_key(fptr, TDOUBLE, "CDELT1", &cdelt, NULL, &status);
  }
  else {
    printf(" ! Fits is not 1D : %d D.\n",naxis); return 1;
  }

  if( status ) {
    printf(" ! Pbl. reading DIM or CR headers : \n");
    fits_report_error(stdout, status); return 1; }

  if( bitpix == FLOAT_IMG ) {
    tab  = new(float[Xsz]);

    // Fill vectors :
    if(fits_read_pix(fptr, TFLOAT, fpix, long(Xsz), NULL, tab, NULL, &status)) {
      printf(" ! Pbl. reading array :\n");
      fits_report_error(stdout, status); return 1;}
    
  }
  else if( bitpix == DOUBLE_IMG ) {
    Dtab  = new(double[Xsz]);

    // Fill vectors :
    if(fits_read_pix(fptr, TDOUBLE, fpix, long(Xsz), NULL, Dtab, NULL, &status)) {
      printf(" ! Pbl. reading array :\n");
      fits_report_error(stdout, status); return 1;}
  }
  else{ printf("  This shouldn't occur !"); return 1;}
  
  fits_close_file(fptr, &status);

  // Write output table:

  out = fopen(outflnm, "w");
  if( out == NULL ) {
    printf(" ! Can't create output file '%s'.\n", outflnm );
    return 1;
  }

  fprintf(out, "@ORIGFILE \t%s\n",inflnm);
  fprintf(out, "@CRPIX    \t%.6f\n", crpix);
  fprintf(out, "@CRVAL    \t%.6e\n", crval);
  fprintf(out, "@CDELT    \t%.6e\n", cdelt);
  fprintf(out, "#\n# YPIX :\n# YVAL :\n# FLUX :\n#end\n");


  if( bitpix == FLOAT_IMG ) {
    for(i=0; i<Xsz; i++) {
      yval = crval + cdelt*( float(i+1)-crpix);
      fprintf(out, "%4d  %12.5e  %12.5e\n",i+1, yval, tab[i]);
    }
  }
  else if( bitpix == DOUBLE_IMG ) {
    for(i=0; i<Xsz; i++) {
      yval = crval + cdelt*( float(i+1)-crpix);
      fprintf(out, "%4d  %12.5e  %12.5e\n",i+1, yval, Dtab[i]);
    }
  }    

  fclose(out);

  if( !silent ) printf("\n  Table %s written from %s Fits File [%d].\n",outflnm, inflnm, Xsz);

  if( bitpix == FLOAT_IMG ) {
    delete[] tab;
  }
  else if( bitpix == DOUBLE_IMG ) {
    delete[] Dtab;  
  }  
  
  return 0;
}
  
