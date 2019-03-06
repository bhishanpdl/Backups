#include<stdio.h>
#include<stdlib.h> // for atof i.e. array to float

int main(int argc, char *argv[])  // int main() does not works for arguments inside main
{
    double factor;
    factor = atof(argv[1]);

    if (factor<0 || factor >1)
    {
    	printf("Error: The argument %lf is not between 0 and 1\n", factor);
    	return (1);
    }

    return 0;
}
