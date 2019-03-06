//topic   : C library function - remove() NOTE: defined under stdio.h
//ref     : http://www.tutorialspoint.com/c_standard_library/c_function_remove.htm
//terminal: clear; gcc remove.c && ./a.out
//declaration: remove(const char *filename) eg. remove("file.txt");
//CAVEAT     : it will delete file even if it is open somewhere, e.g. in gedit

#include <stdio.h>
#include <string.h>

int main ()
{
    int      ret; // ret is return
    FILE     *fp;
    char     filename[] = "file.txt";
   
   
    //creating a file to delete later
    fp = fopen(filename, "w");

    fprintf(fp, "%s", "This is tutorialspoint.com\n");
    fclose(fp);
    
    //deleting the file
    // if file is deleted, it will return 0, otherwise it will return -1 by default   
    ret = remove(filename);

    if(ret == 0) 
    {
      printf("File deleted successfully\n");
    }
    else 
    {
      printf("Error: unable to delete the file\n");
    }
    
    //example 2
    remove("file2.txt");  // make sure there is file2.txt in the same directory
    return(0);
}
