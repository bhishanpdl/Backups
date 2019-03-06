/* Program   : colour.c
 * Algorithm : pix3[ii] = ((1-m)*pix1[ii])+ (m*pix2[ii])
 *
 * compile:  gcc -Wall -O2 colour.c -o cl -lcfitsio -lm -pthread
 * run    :  ./cl color.txt 17
 * usage  :  for x in range(0,21):  ./cl color.txt str(x)
 *
 * Note   :  we need a whitespace after last filename inside color.txt
 *
 *
 * clear; gcc -Wall -O2 colour.c -o cl -lcfitsio -lm -pthread && ./cl color.txt 0.1
 *
 *
 * blue s[n]           red t[n]             output y[n]
*/


#include <stdio.h>
#include <string.h>
#include "fitsio.h"
#include <math.h>

int main(int argc,char *argv[])
{
    int check =1;
    double m;

    printf("Input value of m = %.2f\n", atof(argv[2]));
    m = atof(argv[2]) / 20.0 ; // in editedjedi.py we iterate 21 times.
    printf("m divided by 20  = %f\n",m);

    FILE *fp;
    int status = 0;
    fp = fopen(argv[1],"r"); // argv[1] = color.txt

    int n=0;

    char s[101][100];
    char t[101][100];
    char y[101][100];
    char z[101][100];

    // storing names of galaxies
    printf("The contents of %s is: \n", argv[1]);
    for(n=0; n<=3; n++)
    {

        //s[n] =(char*)malloc(sizeof(char)*100);

        fscanf(fp,"%s %s %s",s[n],t[n],y[n]);

        strcpy(z[n],"!");

        strcat(z[n],y[n]);

        printf("%s \t%s \t%s\n",s[n],t[n],z[n]);

        //n = n+1;

    }

    fitsfile *in1[101]; //fits file for reading blue images
    fitsfile *in2[101]; //fits file for reading red images
    fitsfile *in3[101]; //fitsfile for reading output images

    for(n=0; n<=3; n++) //for loop operation
    {

        fits_open_file(&in1[n],s[n],READONLY,&status); // reading blue  files
        //printf("%d %s\n",status,s[n]);

        fits_open_file(&in2[n],t[n],READONLY,&status); //reading red files
        //printf("%d %s\n",status,t[n]);

        long anaxes1[3]= {1,1,1};
        long anaxes2[3]= {1,1,1};
        int anaxis1=0;
        int anaxis2=0;
        long npixels = 1;
        double *pix1,*pix2,*pix3;
        long firstpix[3]= {1,1,1};
        int ii;


        if (status)
        {
            fits_report_error(stderr, status);
            return(status);
        }

        fits_get_img_dim(in1[n],&anaxis1,&status);
        fits_get_img_dim(in2[n],&anaxis2,&status);
        fits_get_img_size(in1[n],3,anaxes1,&status);
        fits_get_img_size(in1[n],3,anaxes2,&status);
        //printf("%ld %ld\n",anaxes1[0],anaxes2[0]); // no. of pixels in each axis
        //printf("%d\n",anaxis2); // total no. of axis(suppose x,y or z)

        if(check && !fits_create_file(&in3[n],z[n],&status))
        {
            fits_copy_header(in1[n],in3[n],&status);
            npixels = anaxes1[0];
            //printf("the value of npixels is %ld\n",npixels);
            pix1 = (double*)malloc(npixels*sizeof(double));
            pix2= (double*)malloc(npixels*sizeof(double));
            pix3= (double*)malloc(npixels*sizeof(double));

            if(pix1==NULL|| pix2==NULL)
            {
                printf("Memory allocation error\n");
                return(1);
            }

            //printf("%ld\n",npixels);

            for(firstpix[2]=1; firstpix[2]<=anaxes1[2]; firstpix[2]++)
            {
                for(firstpix[1]=1; firstpix[1]<=anaxes1[1]; firstpix[1]++)
                {

                    if(fits_read_pix(in1[n],TDOUBLE,firstpix,npixels,NULL,pix1,NULL,&status))  break;
                    if(fits_read_pix(in2[n],TDOUBLE,firstpix,npixels,NULL,pix2,NULL,&status))  break;

                    for(ii=0; ii<npixels; ii++)
                    {
                        // pix1[ii] += pix2[ii];
                        pix3[ii] = ((1-m)*pix1[ii])+(m*pix2[ii]);
                    } //for loop of ii

                    long bitpix= -32;

                    fits_update_key(in3[n],TLONG,"BITPIX",&bitpix,0,&status);

                    fits_write_pix(in3[n],TDOUBLE,firstpix,npixels,pix3,&status);

                }//for loop for firstpix[2]
            } //for loop for for firstpix[1]

            free(pix1);
            free(pix2);
            free(pix3);
            fits_close_file(in3[n],&status);

        } // end of if statement
        fits_close_file(in1[n],&status);
        fits_close_file(in2[n],&status);
        //printf("loop value m = %.2f and 1-m = %.2f\n",m,1-m);

    } // end of first row of galaxy names

    m=0;
    fclose(fp);
    return 0;

}
