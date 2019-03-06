#include <stdio.h>
#include <stdlib.h>

char *help[] = {
    "Takes in a catalog of images, and produces a FITS image for each entry, transformed to the correct specifications.",  // help[0] string
    "Usage: jeditransform catalog distort_list",                                                                           // help[1] string
    "Arguments: catalog - text file containing galaxy catalog",
    "           distort_list - file path to output instructions for jedidistort",
    "catalog file:  image x y angle redshift old_mag old_r50 new_mag new_r50 stamp1 stamp2 [tab separated]",
    "               image - file path for the base galaxy postage stamp image",
    "               x - x coordinate for the image center",
    "               y - y coordinate for the image center",
    "               angle - angle through which to rotate the input postage stamp",
    "               redshift - redshift for the galaxy",
    "               pixscale - pixel scale for the galaxy (arcseconds per pixel)",
    "               old_mag - magnitude of the base galaxy postage stamp image",
    "               old_r50 - r50-type radius of the base galaxy postage stamp image",
    "               new_mag - magnitude that the galaxy should have",
    "               new_r50 - r50-type radius that the galaxy should have",
    "               stamp1 - filepath for the galaxy's rotated, scaled, and photoscaled, postage stamp",
    "               stamp2 - filepath for the final distorted postage stamp",
    0}; // null character

//********************************************************************************************************************************************************************************************

int main (int argc, char *argv[]){
printf("help[0] is \n");

printf ("%s\n\n", help[0]);  // help is array of strings, help[0] is first string.

 //print help
    if(argc != 3){
        int line;
        for(line = 0; help[line] !=0; line++)
            fprintf(stderr, "%s\n", help[line]);
        exit(1);
    }
    
    
printf("\n");
return 0;
}


