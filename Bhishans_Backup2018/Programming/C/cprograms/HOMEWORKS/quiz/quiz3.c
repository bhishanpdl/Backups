// Autho :Bhishan Poudel
// Program: tv shopping qn.3
#include<stdio.h>
#include<string.h>
//function prototypes

void sort_price(int size[20],double price[20],char brand[20][20],int n);
void sort_brand(int size[20],double price[20],char brand[20][20],int n);

//*************************************************************************************************
// writing main function
int main()
{
    	int code;
	FILE *fp;
	
	int 	size[20];
	double 	price[20];	// storing as string, to compare later
	char 	brand[20][20];
	char 	buffer[20];			
	
	
	
	int i=0;				
	int n = 0;			
	
	
	fp=fopen("wallmart.txt","r"); 	
	
	//storing data from the file in some arrays
	while(!feof(fp))			
	{			
		fscanf(fp,"%d",&size[n]);
		fscanf(fp,"%lf",&price[n]);		
		
		fscanf(fp,"%s[^\n]",buffer);		
		strcpy(brand[n],buffer);	
			
		n=n+1;
	}
	fclose(fp);
	n=n-1;			
	
	
	// displaying the given input
	printf("Data before sorting is:\n");
	printf("Screen Size\t\tPrice\tBrand-name\n");
	printf("************************************************************************\n");

	for(i=0;i<n;i++)
	{
		printf("%d                  %.2f            %s\n",size[i],price[i],brand[i]);
		
	}
	
	
	
	

	
	
	printf("**********************************************************************\n");
	
	// storing the code to search or sort or abort
	printf("MENU:\n");
	printf("1 : sort by price \n");
	printf("2 : sort by name)\n");
	printf("3 : exit\n");
	printf("Enter the code => ");
	scanf("%d", &code);
	
	switch(code)
	{
    
    		case 1:
        		sort_price(size, price,brand,n);	// calling the function
        	break;

    
    		case 2:
        		sort_brand(size,price,brand,n);
        	break;
    
    		case 3:
        		printf("Thank You for using the program!\n");
    		
	}
printf("****************************End of Program!**********************************************\n");
return 0;
}


 
// defining function sort_price
    
    void sort_price(int size[20],double price[20],char brand[20][20],int n)
    {
        int 	temp;
        double 	temp1;
       	char 	temp2[20];
        int 	i,j,k;
        
        printf("Data after sorting by price is:\n");
        printf("Size\t\tPrice\tBrand name\n");
        printf("**************************************************************************************\n");
        
        for(i=0;i<n-1;i++)
        {
            for (j=i+1;j<n;j++)			
            {
                if((price[i]>price[j]))	
                {
                    temp1=price[i];
            	price[i]=price[j];
            	price[j]=temp1;

            	temp=size[i];
            	size[i]=size[j];
            	size[j]=temp;

            	strcpy(temp2,brand[i]);
            	strcpy(brand[i],brand[j]);
            	strcpy(brand[j],temp2);
                }
            }

        }
       

	//displaying sorted list
        for (k=0;k<n;k++)
            printf("%d                  %.2f            %s\n",size[k],price[k],brand[k]);



    }
    // defining function sort_brand
    
    void sort_brand(int size[20],double price[20],char brand[20][20],int n)
    {
    	int 	temp;
    	double 	temp1;
        char 	temp2[20];	// to store string.
        int 	i,j,k;
        
        printf("Data after sorting by brand is:\n");
        printf("Size\t\tPrice\tBrand name\n");
        printf("**************************************************************************************\n");
        
        for(i=0;i<n-1;i++)
        {
            for (j=i+1;j<n;j++)			
            {
                if(strcmp(brand[i],brand[j])>0)	
                {
                    	strcpy(temp2,brand[i]);	// to store string we need array type
            	strcpy(brand[i],brand[j]);
            	strcpy(brand[j],temp2);

            	temp1=price[i];
            	price[i]=price[j];
            	price[j]=temp1;

            	temp=size[i];
            	size[i]=size[j];
            	size[j]=temp;
                }
          }

        }

	//displaying sorted list
        for (k=0;k<n;k++) 
        {
            printf("%d                  %.2f            %s\n",size[k],price[k],brand[k]); 
        }



    }
    
