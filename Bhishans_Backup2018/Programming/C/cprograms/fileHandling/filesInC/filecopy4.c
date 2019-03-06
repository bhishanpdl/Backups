//topic   : file copy
//terminal: clear; gcc filecopy.c && ./a.out

# include<stdio.h>
#include<stdio.h>
#include<stdlib.h> // for exit

int main (void) 
{
    FILE    *fin;
    FILE    *fout;
    int     count;
    
    //giving filepath for file pointers
    fin = fopen ("in.txt", "r");
    fout = fopen ("out.txt", "w");    
       
    //checking for error
	if (fin == NULL) 
 	{
        	fprintf(stderr, "Could not open file\n");	
        	exit(1);// if we use printf("No files"), we will get segmentation fault.
    }
    
    count = fgetc (fin);
    while (count >= 0) 
    {
          fputc (count, fout);
          count = fgetc (fin);
    }
    fclose (fout);
    fclose (fin);
    
    //printing usage
    printf("this program copies contents of in.txt into out.txt\n");
    
    return 0;    
}

