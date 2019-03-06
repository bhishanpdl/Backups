// topic : arraysortsearch.c
// Programer: Bhishan Poudel
// terminal : clear; gcc arraysortsearch.c && ./a.out


#include<stdio.h>
#include<string.h>
#include<stdlib.h>  //for stderr

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
	printf("\n********************************Input Data**********************************\n");
	printf("%-5s %-13s %-10s %-10s\n\n", "S.N.", "Marina Number", "Warranty", "Non-Warranty") ;


	for(i=0;i<n;i++)
	{
		printf("%-5d %-13s %-10.2f %-10.2f\n",i+1,mnumber[i],warranty[i],nwarranty[i]);


		sum_warranty 	 = sum_warranty + warranty[i];
		sum_nwarranty = sum_nwarranty + nwarranty[i];
	}

	printf("**********************************************************************\n");

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


// defining function search

void search(char mnumber[20][5],double warranty[20],double nwarranty[20],int n)
{
	int 	c = 0;	// counter
	char 	key[20];	// string to search
	char 	option[10];	// option y or n

        do
        {
        	printf("Enter the Marina number you want to search: =>  ");
        	scanf("%s",key);

        	int found=0;
        	for (c=0;c<n;c++){
            		if(strcasecmp(mnumber[c],key)==0)	{
            			printf("Position 	= %d\n",c+1);
            			printf("Warranty 	= %7.2f\n",warranty[c]);
            			printf("Non Warranty 	= %7.2f\n",nwarranty[c]);
            			printf("Do you want to search again (y/n)? => ");
            			scanf("\n%s",option);
            			found++;
        		}
        	}

        	if(found==0) {
                	printf("\nSorry, the number is not found!\n");
        		printf("Do you want to search again (y/n)? => ");
            		scanf("\n%s",option);
            	}



		if (!((strcasecmp(option,"y")==0) || (strcasecmp(option,"Y")==0) || (strcasecmp(option,"n")==0) || (strcasecmp(option,"N")==0))){
    			printf("Invalid code!!\n");
    			printf("Do you want to search again (y/n)? => ");
            		scanf("\n%s",option);

    		 }


	}

	while(!((strcasecmp(option,"n")==0) || (strcasecmp(option,"n")==0)));

}

// defining function sort_name
void sort_name(char mnumber[20][5],double warranty[20],double nwarranty[20],int n)
{
        char temp[20];
        int i,j;	//local variables

        printf("\n************************Sorted by Name************************\n");
        printf("%-5s %-13s %-10s %-10s\n\n", "S.N.", "Marina Number", "Warranty", "Non-Warranty") ;

        for(i=0;i<n-1;i++){
           	 for (j=i+1;j<n;j++){
                	if(strcmp(mnumber[i],mnumber[j])<0){	// sorting dealphabetizing order

                    		strcpy(temp,mnumber[i]);
                    	strcpy(mnumber[i],mnumber[j]);
                    	strcpy(mnumber[j],temp);
                	}
            	}
	}

	//displaying sorted list
        for (i=0;i<n;i++)
            printf("%-5d %-13s %-10.2f %-10.2f\n",i+1,mnumber[i],warranty[i],nwarranty[i]);
}
// defining function sort_name
void sort_warranty(char mnumber[20][5],double warranty[20],double nwarranty[20],int n)
{
        double temp;
        int i,j;	//local variables

        printf("\n****************************Sorted by Warranty**********************************\n");
        printf("%-5s %-13s %-10s %-10s\n\n", "S.N.", "Marina Number", "Warranty", "Non-Warranty") ;

        for(i=0;i<n-1;i++){
           	 for (j=i+1;j<n;j++){
                	if(warranty[i]>warranty[j]){	// sorting dealphabetizing order

                    		temp        = warranty[i];
                            warranty[i] = warranty[j];
                            warranty[j] = temp;
                	}
            	}
	}

	//displaying sorted list
        for (i=0;i<n;i++)
            printf("%-5d %-13s %-10.2f %-10.2f\n",i+1,mnumber[i],warranty[i],nwarranty[i]);
}


