/* Author: Bhishan Poudel
   Question:1

Develop a C program called Marina Fishing Services that uses 
arrays and accessing the data from an input text file. 
The project should display Total and Average values of 
Warranty and Non-Warranty information. Show modular programming!
*/
//***********************************************************************************************
#include<stdio.h>
#include<string.h>

double average_sum_warranty(double warranty[],int n);
double average_sum_non_warranty(double non_warranty[],int n);
void searching(char marina_number[20][5],double warranty[20],double non_warranty[20],int n);
void sorting(char marina_number[20][5],double warranty[20],double non_warranty[20],int n);

//*************************************************************************************************
// writing main function
int main()
{
    int code;
	FILE *fp;

	char marina_number[20][5],c[5];
	double warranty[20],non_warranty[20];

	char key[20];

	int i,j,k,n=0;
	double  sum_warranty=0.0;
	double sum_non_warranty=0.0;
	fp=fopen("marina1.txt","r");
	
	while(!feof(fp))
	{
		fscanf(fp,"%s[^\n]",c);		// string scan does not have &string
		strcpy(marina_number[n],c);
		fscanf(fp,"%lf",&warranty[n]);	// storing 2nd coulumn values in an array warranty[n]
		fscanf(fp,"%lf",&non_warranty[n]);

		n=n+1;
	}
	fclose(fp);
	n=n-1;
	
	// displaying the given talbe of Marina Fishing data.
	printf("Data before sorting is:\n");
	printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\n");
	printf("*********************************************************************************************\n");

	for(i=0;i<n;i++)
		printf("%d                  %s                  %.2f            %.2f\n",i+1,marina_number[i],warranty[i],non_warranty[i]);
		printf("\n");
	
	for(j=0;j<n;j++)
	{
		sum_warranty 	 = sum_warranty + warranty[j];		// sum_warranty = 0.0 is initialized beforehand.
		sum_non_warranty = sum_non_warranty + non_warranty[j];

	}
	printf("\t\t   Total warranty =    \t%.2f\n",sum_warranty);
	printf("\t\t   Total non_warranty =         \t\t%.2f\n",sum_non_warranty);

	printf("\t\t   The average  warranty =%.2f\n",average_sum_warranty(warranty,n));
	printf("\t\t   The average non_warranty =  \t\t%.2f\n",average_sum_non_warranty(non_warranty,n));

	printf("To search press 1\n");
	printf("To sort press 2\n");
	printf("To abort the program press 3\n");
	scanf("%d", &code);
	switch(code)
	{
    
    		case 1:
        		searching( marina_number, warranty, non_warranty,n);
        	break;

    
    		case 2:
        		sorting(marina_number,warranty,non_warranty,n);
        	break;
    
    		case 3:
        		printf("Have a good day\n");
    		default:
        		printf("Sorry! you have entered the wrong code\n");
	}
printf("****************************End of Program!**********************************************\n");
return 0;
}
//*********************************************************************************************
//definition of function average_sum_warranty 
double average_sum_warranty(double warranty[],int n)
{
    double sum_warranty=0.0;
    double avgw;
    int i;
    for(i=0;i<n;i++)
    {
    sum_warranty =sum_warranty+warranty[i];
    }
    avgw=sum_warranty/9.0;
    return (avgw);
}
//****************************************************************
//definition of function average_sum_non_warranty

double average_sum_non_warranty(double non_warranty[],int n)
{
    double sum_non_warranty=0.0;
    double avgnw;
    int i;
    for(i=0;i<10;i++)
    {
        sum_non_warranty=sum_non_warranty+non_warranty[i];
    }

    avgnw=(sum_non_warranty)/9.0;
    return (avgnw);
}
//****************************************************************************
// defining function searching

void searching(char marina_number[20][5],double warranty[20],double non_warranty[20],int n)
{
	int c;
	char key[20];
	char code;

        do
        {
        printf("Enter the Marina number you want to search:\n");
        scanf("%s",key);
        	for (c=0;c<n;c++)
        	{
            		if(strcasecmp(marina_number[c],key)==0)
            		{
            		printf("%s is present in position %d\n",key,c+1);
            		printf("The Corresponding values for warranty = %.2f and non_warranty = %.2f\n",warranty[c],non_warranty[c]);
            		printf("If you want to search again more press y, otherwise press n\n");
            		scanf("\n%c",&code);
        		}
    		}


	}
    	while(code == 'y' || code == 'Y');
    	if (!(code == 'y' || code == 'Y' ||code == 'n' || code == 'N'))
    		printf("Invalid code!!\n");
}
    
//********************************************************************
// defining function sorting
    
    void sorting(char marina_number[20][5],double warranty[20],double non_warranty[20],int n)
    {
        char temp[20];
        double temp1[20];
        int i,j,k;
        
        printf("After sorting it looks like:\n");
        printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\n");
        printf("*****************************************************************\n");
        
        for(i=0;i<n-1;i++)
        {
            for (j=i+1;j<n;j++)
            {
                if(strcmp(marina_number[i],marina_number[j])>0)
                {
                    strcpy(temp,marina_number[i]);
                    strcpy(marina_number[i],marina_number[j]);
                    strcpy(marina_number[j],temp);
                }
            }

        }


        for (k=0;k<n;k++)
            printf("%d                  %s                  %.2f            %.2f\n",k+1,marina_number[k],warranty[k],non_warranty[k]);



    }
//***********************The End*************************************



