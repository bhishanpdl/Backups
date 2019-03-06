// Autho :Bhishan Poudel
// Program:
#include<stdio.h>
#include<string.h>
#include<stdlib.h>  //for stderr
#include"marinaheader.h"    //it works also without this header file

//function prototypes
void search(char mnumber[20][5],double warranty[20],double nwarranty[20],int n);
void sort_name(char mnumber[20][5],double warranty[20],double nwarranty[20],int n);
void sort_warranty(char mnumber[20][5],double warranty[20],double nwarranty[20],int n);


//main function
int main()
{
printf("\n");
    	int code;
        FILE *fp;
        fp=fopen("marina.txt","r");

	char    mnumber[20][5];
	char    buffer[5];
	double  warranty[20];
	double  nwarranty[20];

	int i=0;
	int n = 0;
	double  sum_warranty=0.0;
	double sum_nwarranty=0.0;

	if (fp == NULL) {
        	fprintf(stderr, "Could not open file\n");	// if we use printf("No files"), we will get segmentation fault.
        	exit(-1);
        }

    //storing data from the file in some arrays
	while(!feof(fp)){
		fscanf(fp,"%s[^\n]",buffer);
		strcpy(mnumber[n],buffer);
		fscanf(fp,"%lf",&warranty[n]);
		fscanf(fp,"%lf",&nwarranty[n]);

		n=n+1;
	}
	fclose(fp);
	n=n-1;


	// displaying input
	printf("\n**********************Input Data*************************\n");
	printf("%-5s %-13s %-10s %-10s\n\n", "S.N.", "Marina Number", "Warranty", "Non-Warranty") ;


	for(i=0;i<n;i++)
	{
		printf("%-5d %-13s %-10.2f %-10.2f\n",i+1,mnumber[i],warranty[i],nwarranty[i]);


		sum_warranty 	 = sum_warranty + warranty[i];
		sum_nwarranty = sum_nwarranty + nwarranty[i];
	}

	printf("*******************************************************\n");

	// printing sum_warranty and sum_nwarranty
	printf("%-19s %-7.2f\n", "Total warranty =", sum_warranty);
	printf("%-19s %-7.2f\n\n", "Average  Warranty =", (sum_warranty/9.0));

	printf("%-30s %-7.2f\n", "Total nwarranty =", sum_nwarranty);
	printf("%-30s %-7.2f\n", "Average nwarranty =", (sum_nwarranty/9.0));

	// storing the code to search or sort or abort
	printf("\nMENU:\n");
	printf("1 : search \n");
	printf("2 : sort (de-alphabetical order)\n");
	printf("3 : sort by warranty\n");
	printf("Enter the code => ");
	scanf("%d", &code);

	if (code !=1 && code !=2 && code!=3){
		printf("Enter the correct code => ");
		scanf("%d", &code);
	}

	switch(code)
	{

    		case 1:
        		search( mnumber, warranty, nwarranty,n);	// calling the function
                break;


    		case 2:
        		sort_name(mnumber,warranty,nwarranty,n);
                break;

    		case 3:
        		sort_warranty(mnumber,warranty,nwarranty,n);
        		break;
    		default:
        		printf("Sorry! you have entered the wrong code\n");
	}
printf("\n");
return 0;
}
