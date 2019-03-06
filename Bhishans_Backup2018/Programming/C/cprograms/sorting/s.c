#include<stdio.h>
#include<string.h>

//*************************************************************************************************
// writing main function
int main()
{
    
    
	FILE *fp;

	char name[20][5];
	char buffer[5];			// temporary 1D string, c[0]= marina_number[0] = AD57 later.
	double num[20];
	
	
	int i=0;			// counter for for loop	
	int n = 0;			
	
	
	fp=fopen("sortingfile.txt","r");
	
	//storing data from the file in some arrays
	while(!feof(fp))	// while loop repeats until end of file		
	{			
		fscanf(fp,"%s[^\n]",buffer);		// string scan does not have &string note: buffer[n] does not work!
		strcpy(name[n],buffer);		
		fscanf(fp,"%lf",&number[n]);		// storing 2nd coulumn values in an array warranty[n] as doubles
			
		n=n+1;
	}
	fclose(fp);
	n=n-1;			
	
	// displaying the given input
	printf("Data before sorting is:\n");
	printf("Serial No.\tName\t\tNumber\n");
	printf("************************************************************************\n");

	for(i=0;i<n;i++)
	{
		printf("%d                  %s                  %.2f            \n",i+1,name[i],num[i];
		
	}
	
return 0;
}
