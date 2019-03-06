// Autho :Bhishan Poudel
// Program: 
#include<stdio.h>
#include<string.h>
//function prototypes
void search(char marina_number[20][5],double warranty[20],double non_warranty[20],int n);
void sort(char marina_number[20][5],double warranty[20],double non_warranty[20],int n);


//main function
int main()
{
    	int code;
	FILE *fp;

	char marina_number[20][5];
	char buffer[5];			
	double warranty[20];
	double non_warranty[20];
	
	int i=0;				
	int n = 0;			
	double  sum_warranty=0.0;
	double sum_non_warranty=0.0;
	
	fp=fopen("marina.txt","r"); 	
	
	//storing data from the file in some arrays
	while(!feof(fp))			
	{			
		fscanf(fp,"%s[^\n]",buffer);		
		strcpy(marina_number[n],buffer);	
		fscanf(fp,"%lf",&warranty[n]);		
		fscanf(fp,"%lf",&non_warranty[n]);	
							
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
		printf("%d                  %s                  %.2f            %.2f\n",i+1,marina_number[i],warranty[i],non_warranty[i]);
		
		
		sum_warranty 	 = sum_warranty + warranty[i];		
		sum_non_warranty = sum_non_warranty + non_warranty[i];
	}
	
	printf("**********************************************************************\n");
	// printing sum_warranty and sum_non_warranty
	printf("\t\t   Total warranty =    \t%7.2f\n",sum_warranty);
	printf("\t\t   Total non_warranty =         \t\t%7.2f\n",sum_non_warranty);
	
	printf("\t\t   The average  warranty =%7.2f\n", (sum_warranty/9.0));	
	printf("\t\t   The average non_warranty =      \t\t%7.2f\n", (sum_non_warranty/9.0));

	// storing the code to search or sort or abort
	printf("MENU:\n");
	printf("1 : search \n");
	printf("2 : sort (de-alphabetical order)\n");
	printf("3 : exit\n");
	printf("Enter the code => ");
	scanf("%d", &code);
	
	switch(code)
	{
    
    		case 1:
        		search( marina_number, warranty, non_warranty,n);	// calling the function
        	break;

    
    		case 2:
        		sort(marina_number,warranty,non_warranty,n);
        	break;
    
    		case 3:
        		printf("Thank You for using the program!\n");
    		default:
        		printf("Sorry! you have entered the wrong code\n");
	}
printf("****************************End of Program!**********************************************\n");
return 0;
}


// defining function search

void search(char marina_number[20][5],double warranty[20],double non_warranty[20],int n)
{
	int c = 0;	// counter
	char key[20];	// string to search
	char code;	// code y or n

        do
        {
        	printf("Enter the Marina number you want to search: =>  ");	
        	scanf("%s",key);
        	int count=0;		
        	for (c=0;c<n;c++)		
        	{
            		if(strcasecmp(marina_number[c],key)==0)		
            		{
            			printf("Position 	= %d\n",c+1);
            			printf("Warranty 	= %7.2f\n",warranty[c]);
            			printf("Non Warranty 	= %7.2f\n",non_warranty[c]);
            			printf("Do you want to search again (y/n)? => ");
            			scanf("\n%c",&code);					
            			count++;
        		}
        	}
        	
        	if(count==0) 
        	{
                	printf("\nSorry, the number is not found!\n");
        	break; }


	}
    	while(code == 'y' || code == 'Y');
    	if (!(code == 'y' || code == 'Y' ||code == 'n' || code == 'N'))
    		printf("Invalid code!!\n");
    		
//void function does not have return value
}
    
// defining function sort
    
    void sort(char marina_number[20][5],double warranty[20],double non_warranty[20],int n)
    {
        char temp[20];
        int i,j,k;
        
        printf("Data after sorting (de-alphabetical order) is:\n");
        printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\n");
        printf("**************************************************************************************\n");
        
        for(i=0;i<n-1;i++)
        {
            for (j=i+1;j<n;j++)			
            {
                if(strcmp(marina_number[i],marina_number[j])<0)	// sorting dealphabetizing order
                {
                    strcpy(temp,marina_number[i]);
                    strcpy(marina_number[i],marina_number[j]);
                    strcpy(marina_number[j],temp);
                }
            }

        }

	//displaying sorted list
        for (k=0;k<n;k++)
            printf("%d                  %s                  %.2f            %.2f\n",k+1,marina_number[k],warranty[k],non_warranty[k]);



    }
//***********************The End*************************************


