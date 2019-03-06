//topic: array pointer

#include<stdio.h>

int main() {

	char *help[] = {
    "Takes in a catalog of images, and produces a FITS image for each entry, transformed to the correct specifications.",
    "Usage: jeditransform catalog distort_list",
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
    0};
	
	
	//reading the help pointer
 	int line;
        for(line = 0; help[line] !=0; line++)
            printf( "%s\n", help[line]);
            
    //checking help[4] string
    printf("\nThe fifth line string is :\n%s", help[4]);
    printf("\nThe size of help[3] = %d", sizeof(help[3])); // all are 8
    printf("\nThe size of help = %d", sizeof(help));

printf("\n\n");
return 0;
}
