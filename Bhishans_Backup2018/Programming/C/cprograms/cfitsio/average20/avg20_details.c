// gcc -O3 -Wall avg20.c -o avg20 -lm -lcfitsio -lm && ./avg20 filenames.txt avg20.fits


#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include "fitsio.h"


int main(int argc,char *argv[])
{

    char s[100];
    char l[100];


    strcpy(l,argv[2]);
    strcpy(s,"!");
    strcat(s,l);
    printf("The second argument output fitsfile name is:\n");
    printf("%s %s\n",l,s);

    char fn[25][100];
    int check =1;
    FILE *fp;
    fp = fopen(argv[1],"r");
    int n;

    printf("The first argument textfile contents is:\n");
    for(n=1; n<=20; n++)
    {
        fscanf(fp,"%s",fn[n]);
        printf("%s\n",fn[n]);
    }


    fclose(fp);
    fitsfile *in1;
    fitsfile *in2;

    int status =0;


    fits_open_file(&in1,fn[1],READONLY,&status); //opening the first fitsfile e.g. aout1.fits

    fits_create_file(&in2,s,&status); //created an empty fits file e.g. !trial1/trial1_LSST_convolved.fits

    long anaxes[3] = {1,1,1};
    int anaxis=0;
    long npixels =1;
    double *pix1;
    long firstpix[3]= {1,1,1};
    int ii;

    if(status)
    {
        fits_report_error(stderr,status);
        return(status);
    }


    fits_get_img_dim(in1,&anaxis,&status);
    fits_get_img_size(in1,3,anaxes,&status);

    //printf("\nInitial fitsfile values: naxis = %d, anxes[1]= %ld\n",anaxis,anaxes[1]);

    if(check)  // starts checking
    {


        fits_copy_header(in1,in2,&status);

        npixels = anaxes[0];

        pix1 = (double*)malloc(npixels*sizeof(double));

        if(pix1==NULL)
        {

            printf("memeory allocation error\n");

            return(1);

        }

        for(firstpix[2]=1; firstpix[2]<=anaxes[2]; firstpix[2]++)
        {
            for(firstpix[1]=1; firstpix[1]<=anaxes[1]; firstpix[1]++)
            {

                if(fits_read_pix(in1,TDOUBLE,firstpix,npixels,NULL,pix1,NULL,&status))  break;

                for(ii=0; ii<npixels; ii++)
                {

                    pix1[ii] = 0;

                }

                long bitpix = -32;

                fits_update_key(in2,TLONG,"BITPIX",&bitpix,0,&status);

                fits_write_pix(in2,TDOUBLE,firstpix,npixels,pix1,&status);

            }

        }


    }

    free(pix1);

    fits_close_file(in1,&status);

    fits_close_file(in2,&status);

    //printf("\nInitial fitsfile: naxis = %d, naxes[0] = %ld, naxes[1]= %ld, npixels= %ld\n",anaxis, anaxes[0], anaxes[1],npixels);
    //printf(" the no. of npixels is %ld\n",npixels);

    // starts reading each file




    for(n=1; n<=20; n++)
    {

        fitsfile *inp;

        fitsfile *out;

        fits_open_file(&inp,fn[n],READONLY,&status);

        fits_open_file(&out,l,READWRITE,&status);

        double *pix;

        pix = (double*)malloc((npixels)*sizeof(double));

        //printf("this isfile : %s\n",fn[n]);

        long anaxes1[3]= {1,1,1};
        int anaxis1=0;
        long npixels;
        long firstpix[3]= {1,1,1};
        double *pixn =0;
        int ii;

        if(status)
        {
            fits_report_error(stderr,status);
            return status;
        }

        fits_get_img_dim(inp,&anaxis1,&status);
        fits_get_img_size(inp,3,anaxes1,&status);
        npixels = anaxes1[0];

        //printf("this is file : %s\n",fn[n]);
        //printf("%ld %d\n",anaxes1[0],anaxis1);

        pixn = (double*)malloc((npixels)*sizeof(double));

        //pix = (double*)malloc((npixels)*sizeof(double));


        for(firstpix[2]=1; firstpix[2]<=anaxes1[2]; firstpix[2]++)
        {
            for(firstpix[1]=1; firstpix[1]<=anaxes1[1]; firstpix[1]++)
            {

                fits_read_pix(inp,TDOUBLE,firstpix,npixels,NULL,pixn,NULL,&status);
                fits_read_pix(out,TDOUBLE,firstpix,npixels,NULL,pix,NULL,&status);

                for(ii=0; ii<npixels; ii++)
                {

                    pix[ii] = ((pix[ii]+pixn[ii]));

                    // pixm[ii] = pix[ii];

                }// end loop for ii



                //	long bitpix1 = -32;

                //	fits_update_key(out,TLONG,"BITPIX",&bitpix1,0,&status);

                fits_write_pix(out,TDOUBLE,firstpix,npixels,pix,&status);


            } // end lop for firstpix1
        } // end loop for firstpix2

        //	fits_write_pix(out,TDOUBLE,firstpix,npixels,pix,&status);

        fits_close_file(inp,&status);

        free(pixn);

	//printf("\nfile %s : naxis1 = %d, naxes1[0] = % ld (row pixel), naxes1[1] = %ld (column pixel), *pix = %.0f" ,fn[n], anaxis1, anaxes1[0],anaxes1[1], *pix);
	printf("\n writing the file : %s " ,fn[n] );

        fits_close_file(out,&status);
        free(pix);


    } // end of for loop


    fitsfile *out1;
    fits_open_file(&out1,l,READWRITE,&status);
    if(status)
    {

        fits_report_error(stderr,status);

        return(status);

    }

    double *pixm;

    pixm=(double*)malloc(npixels*sizeof(double));

    long firstpix1[3]= {1,1,1};

    long anaxesl[3]= {1,1,1};

    int jj;

    long npixels1;

    fits_get_img_size(out1,3,anaxesl,&status);

    npixels1= anaxesl[0];

    for(firstpix1[2]=1; firstpix1[2]<=anaxesl[2]; firstpix1[2]++)
    {
        for(firstpix1[1]=1; firstpix1[1]<=anaxesl[1]; firstpix1[1]++)
        {

            fits_read_pix(out1,TDOUBLE,firstpix1,npixels1,NULL,pixm,NULL,&status);

            for(jj=0; jj< npixels; jj++)
                pixm[jj] = ((pixm[jj] )/ 20.0 );

            fits_write_pix(out1,TDOUBLE,firstpix1,npixels1,pixm,&status);

        }

    }

    fits_close_file(out1,&status);
    free(pixm);
    printf("\n");
    return 0;
}







