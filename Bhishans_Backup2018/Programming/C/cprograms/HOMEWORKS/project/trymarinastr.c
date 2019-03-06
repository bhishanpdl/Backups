// Autho :Bhishan Poudel
// Program: 
#include<stdio.h>
#include<string.h>

//strucutre marina_fishing
struct marina_fishing {
	char mnumber[20][5];
	double warranty[20];
	double nwarranty[20];
};

typedef struct marina_fishing NAME;
NAME marina[10], temp[10];

//function prototypes
void search_marina(int n);
void sort_marina(int n);

//main function
int main()
{
    	int option;
	FILE *fp;
		
	int i=0;				
	int n = 0;			
	double  sum_warranty=0.0;
	double sum_nwarranty=0.0;
	
	fp=fopen("marina.txt","r"); 	
	
	//storing data from the file into the structure
	while(!feof(fp))			
	{			
		fscanf(fp,"%s[^\n]",marina[n].mnumber);		
		fscanf(fp,"%lf",&marina[n].warranty);		
		fscanf(fp,"%lf",&marina[n].nwarranty);	
							
		n=n+1;
	}
	fclose(fp);
	n=n-1;			

	
	// displaying input
	printf("Data before sorting is:\n");
	printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\n");
	printf("************************************************************************\n");

	for(i=0;i<n;i++)
	{
		printf("%d                  %s                  %.2f            %.2f\n",i+1,marina[i].mnumber,marina[i].warranty,marina[i].nwarranty);
		
		
		sum_warranty 	= sum_warranty + marina[i].warranty;		
		sum_nwarranty 	= sum_nwarranty + marina[i].nwarranty;
	}
	
	printf("**********************************************************************\n");
	// printing sum_warranty and sum_nwarranty
	printf("\t\t   Total warranty =    \t%7.2f\n",sum_warranty);
	printf("\t\t   Total nwarranty =         \t\t%7.2f\n",sum_nwarranty);
	
	printf("\t\t   The average  warranty =%7.2f\n", (sum_warranty/9.0));	
	printf("\t\t   The average nwarranty =      \t\t%7.2f\n", (sum_nwarranty/9.0));

	// storing the option to search or sort or abort
	printf("MENU:\n");
	printf("1 : search \n");
	printf("2 : sort (de-alphabetical order)\n");
	printf("3 : exit\n");
	printf("Enter the option => ");
	scanf("%d", &option);
	
	switch(option)
	{
    
    		case 1:
        		search_marina( n);	// calling the function
        	break;

    
    		case 2:
        		sort_marina(n);
        	break;
    
    		case 3:
        		printf("Thank You for using the program!\n");
    		default:
        		printf("Sorry! you have entered the wrong option\n");
	}
printf("****************************End of Program!**********************************************\n");
return 0;
}

//****************************************************************************
// defining function search

void search_marina(int n)
{
	int 	c = 0;		// counter
	char 	search[20];	// string to search
	char 	option;		// option y or n

        do
        {
        	printf("Enter the Marina number you want to search: =>  ");	
        	scanf("%s", search);
        	int found=0;		
        	for (c=0;c<n;c++)		
        	{
            		if (strcasecmp (marina[n].mnumber,search)==0)		
            		{
            			printf("Position 	= %d\n",c+1);
            			printf("Warranty 	= %7.2f\n",marina[n].warranty);
            			printf("Non Warranty 	= %7.2f\n",marina[n].nwarranty);
            			printf("Do you want to search again (y/n)? => ");
            			scanf("\n%c",&option);					
            			found++;
        		}
        	}
        	
        	if(found==0) 
        	{
                	printf("\nSorry, the number is not found!\n");
        	break; }


	}
    	while(option == 'y' || option == 'Y');
    	if (!(option == 'y' || option == 'Y' ||option == 'n' || option == 'N'))
    		printf("Invalid option!!\n");
    		
//void function does not have return value
}
    
//********************************************************************
// defining function sort
    
    void sort_marina(int n)
    {
       	NAME temp;
        int i,j,k;
        
        printf("Data after sorting (de-alphabetical order) is:\n");
        printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\n");
        printf("**************************************************************************************\n");
        
        for(i=0;i<n-1;i++)
        {
            for (j=i+1;j<n;j++)			
            {
                if (strcmp(marina[i].mnumber,marina[j].mnumber)<0){	// sorting dealphabetizing order
                
                    temp 	= marina[i];
                    marina[i] 	= marina[j];
                    marina[j]	= temp;
                }
            }

        }

	//displaying sorted list
        for (k=0;k<n;k++)
            printf("%d                  %s                  %.2f            %.2f\n",k+1,marina[k].mnumber,marina[k].warranty,marina[k].nwarranty);



    }


