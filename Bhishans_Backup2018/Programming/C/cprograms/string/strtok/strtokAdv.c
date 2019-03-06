//program   : strtokAdv.c
//author    : bhishan poudel
//to compile: gcc strtokAdv.c -O2 -lcfitsio -lm -pthread
//to run    : ./a.out config.txt
//cmd       : clear; gcc strtokAdv.c -O2 -lcfitsio -lm -pthread && ./a.out config.txt


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "fitsio.h"

#define BANDHEIGHT 2048
#define BINS_PER_MAG 100
#define DELTA_MAG 0.01
#define DATABASE_PIXSCALE 0.03

char *help[] = 
    {
    "Creates a realistic catalog of galaxies.",
    "Usage: jedicatalog config_file",
    "Arguments: config_file - a text file with the configuration settings for this program.",
    0};

typedef struct 
{
    float   radius; //r50 radius of the stamp in arcseconds
    float   pixscale;   //pixel scale of the stamp in arcseconds per pixel
    float   magnitude;  //magnitude of the stamp
    char    *name;   //the file name for the postage stamp
} Stamp;


typedef struct 
{
    char    name[1024]; //the name of the galaxy
    float   x;  //the x position of the galaxy
    float   y;  //the y position of the galaxy
    float   angle;  //the angle to rotate the galaxy (in degrees)
    float   redshift;   //the redshift of the galaxy
    float   pixscale;   //the pixelscale of the galaxy in arcseconds per pixel
    float   old_mag;    //the original magnitude of the galaxy
    float   old_rad;    //the original radius (pixels) of the galaxy
    float   new_mag;    //the final magnitude of the galaxy
    float   new_rad;    //the final radius of the galaxy
    char    stamp_name[1024]; //the filepath for the postage stamp of this galaxy after its parameters are set
    char    dis_name[1024];   //the filepath for the postage stamp of this galaxy after it has been distorted
} Galaxy;



int main(int argc, char *argv[])
{
    FILE        *config_fp;      //filepointer for the configuration file
    char        buffer[1024];    //whole line
    char        buffer3[1024];   //a-z_
    char        *buffer2;        //if line doesnot start from #, words upto #

    //physics settings
    int         single_redshift = 0;    //0 -> get redshift from db; 1-> fixed redshift for all galaxies
    float       fixed_redshift;     //the fixed redshift to use if single_redshift=1
    float       pix_scale;      //pixel scale to use for the simulation in arcseconds per pixel
    long int    nx, ny;         //image size to simulate
    long int    xborder, yborder;   //borders on the image so we don't have galaxies going off the edges
    long int    ngalaxies;      //the total number of galaxies to simulate
    int         min_mag, max_mag;   //the minimum and maximum magnitude
    char        radius_db_folder[1024], red_db_folder[1024];    //the folders for the redshift and radius databases
    float       mag_power;      //the power for the power law distribution of galactic magnitudes
    
    //output settings
    char        output_folder[1024];    //the output folder for postage stamps
    char        prefix[1024];           //the prefix for all filenames associated with this trial

    //catalog file settings
    char        temp_catalog_file[1024], catalog_file[1024];//catalog of galaxy parameters
    FILE        *catalog_fp;
    char        temp_convlist_file[1024], convlist_file[1024];//list of postage stamps to be convolved
    FILE        *convlist_fp;
    char        temp_distortedlist_file[1024], distortedlist_file[1024];//list of distorted postage stamps
    FILE        *distortedlist_fp;
    char        temp_convolvedlist_file[1024], convolvedlist_file[1024];//list of convolved postage stamps
    FILE        *convolvedlist_fp;

    //source image settings
    long int    num_source_images;  //the number of source images
    Stamp       *source_images = NULL;  //array of source images
    long int    nimage=0;       //counts how many image filenames have been parsed so far

    //cosmic reality databases
    float       **radius_db;      //radius database: an array of radii for each integer bin of magnitudes, from min_mag to max_mag
    float       **red_db;         //redshift database: same format as radius_db
    long int    *radius_db_bin_sizes;   //array that lists the size of each magnitude bin for the radius database
    long int    *red_db_bin_sizes;   //array that lists the size of each magnitude bin for the redshift database
    float       *CDF;   //cumulative distribution function for the power law dist. of magnitudes  

    //parse command line input
    if(argc != 2)
    {
        int line;
        for(line = 0; help[line] != 0; line++)
        {
            fprintf(stderr, "%s\n", help[line]);
        }
        exit(1);
    
    }
    
    config_fp = fopen(argv[1],"r");
    if(config_fp == NULL)
    {
        fprintf(stderr,"Error: cannot open config file.");
        exit(1);
    }

    //parse config file
    while(fgets(buffer, 1024, config_fp) != NULL)
    {
        //read in whatever isn't a comment
        if(buffer[0] != '#')
        {
            buffer2 = strtok(buffer,"#\n");
            sscanf(buffer2,"%[a-z_]=",buffer3);
            //physics settings
            //buffer and buffer3 are char[1024], *buffer2
            //if pix_scale is present,         
            if(strcmp(buffer3,"pix_scale")==0) sscanf(buffer2,"pix_scale=%f",&pix_scale);
            else if(strcmp(buffer3,"nx")==0) sscanf(buffer2,"nx=%li", &nx);
            else if(strcmp(buffer3,"ny")==0) sscanf(buffer2,"ny=%li", &ny);
            else if(strcmp(buffer3,"x_border")==0) sscanf(buffer2,"x_border=%li", &xborder);
            else if(strcmp(buffer3,"y_border")==0) sscanf(buffer2,"y_border=%li", &yborder);
            else if(strcmp(buffer3,"num_galaxies")==0) sscanf(buffer2,"num_galaxies=%li", &ngalaxies);
            else if(strcmp(buffer3,"min_mag")==0) sscanf(buffer2,"min_mag=%i",&min_mag);
            else if(strcmp(buffer3,"max_mag")==0) sscanf(buffer2,"max_mag=%i",&max_mag);
            else if(strcmp(buffer3,"power")==0) sscanf(buffer2,"power=%f", &mag_power);
            else if(strcmp(buffer3,"single_redshift")==0) sscanf(buffer2,"single_redshift=%i", &single_redshift);
            else if(strcmp(buffer3,"fixed_redshift")==0) sscanf(buffer2,"fixed_redshift=%f", &fixed_redshift);

            //output settings
            else if(strcmp(buffer3,"output_folder")==0) sscanf(buffer2, "output_folder=\"%[^\"]", output_folder);
            else if(strcmp(buffer3,"prefix")==0) sscanf(buffer2, "prefix=\"%[^\"]", prefix);

            //catalog file settings
            else if(strcmp(buffer3,"catalog_file")==0) sscanf(buffer2, "catalog_file=\"%[^\"]", temp_catalog_file);

            else if(strcmp(buffer3,"convlist_file")==0) sscanf(buffer2, "convlist_file=\"%[^\"]", temp_convlist_file);
            else if(strcmp(buffer3,"distortedlist_file")==0) sscanf(buffer2, "distortedlist_file=\"%[^\"]", temp_distortedlist_file);
            else if(strcmp(buffer3,"convolvedlist_file")==0) sscanf(buffer2, "convolvedlist_file=\"%[^\"]", temp_convolvedlist_file);

            //cosmic reality databases
            else if(strcmp(buffer3,"radius_db_folder")==0) sscanf(buffer2, "radius_db_folder=\"%[^\"]", radius_db_folder);
            else if(strcmp(buffer3,"red_db_folder")==0) sscanf(buffer2, "red_db_folder=\"%[^\"]", red_db_folder);
            
            //image settings
            else if(strcmp(buffer3,"num_source_images")==0)
            {
                sscanf(buffer2,"num_source_images=%li",&num_source_images);
                source_images = (Stamp*) calloc(num_source_images, sizeof(Stamp));
                if(source_images == NULL)
                {
                    fprintf(stderr,"Error: could not allocate list of source images.\n");
                    exit(1);
                }
            } 
            else if(strcmp(buffer3,"image")==0 && nimage < num_source_images)
            {
                if(source_images == NULL)
                {
                    fprintf(stderr, "Error: the parameter 'num_galaxies' must come before any 'image' parametersn");
                    exit(1);
                }
                char temp[1024];
                sscanf(buffer2, "image=\"%[^\"]", temp);
                source_images[nimage].name = (char*) calloc(strlen(temp)+1, sizeof(char));
                if(source_images[nimage].name == NULL)
                {
                    fprintf(stderr,"Error: could not allocate source image struct %li.\n", nimage);
                    exit(1);
                }
                strcpy(source_images[nimage].name,temp);
                nimage++;
                
            }//end of else if 

        }//end of if not a comment
    }//end of while loop 
    
    sprintf(catalog_file, "%s%s%s", output_folder, prefix, temp_catalog_file);
    sprintf(convlist_file, "%s%s%s", output_folder, prefix, temp_convlist_file);
    sprintf(distortedlist_file, "%s%s%s", output_folder, prefix, temp_distortedlist_file);
    sprintf(convolvedlist_file, "%s%s%s", output_folder, prefix, temp_convolvedlist_file);


    //print out what was just read in
    fprintf(stdout,"pixscale: %f\n", pix_scale);
    fprintf(stdout,"nx: %li\n", nx);
    fprintf(stdout,"ny: %li\n", ny);
    fprintf(stdout,"x_border: %li\n", xborder);
    fprintf(stdout,"y_border: %li\n", yborder);
    fprintf(stdout,"num_galaxies: %li\n",ngalaxies);
    fprintf(stdout,"min_mag: %i\n", min_mag);
    fprintf(stdout,"max_mag: %i\n", max_mag);
    fprintf(stdout,"radius_db_folder: %s\n", radius_db_folder);
    fprintf(stdout,"red_db_folder: %s\n", red_db_folder);
    fprintf(stdout,"output_folder: %s\n", output_folder);
    fprintf(stdout,"power: %f\n", mag_power);
    fprintf(stdout,"catalog_file: %s\n", catalog_file);
    fprintf(stdout,"convlist_file: %s\n", convlist_file);
    fprintf(stdout,"distortedlist_file: %s\n", distortedlist_file);
    fprintf(stdout,"convolvedlist_file: %s\n", convolvedlist_file);
    fprintf(stdout,"num_source_images: %li\n", num_source_images);
    
    fclose(config_fp);
    return 0;
}
