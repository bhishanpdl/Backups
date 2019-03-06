// Autho :Bhishan Poudel
// Program: marina fishing
// Qn: project 1

#include<stdio.h>
#include<string.h>
//function prototypes
void search(char marina_number[20][5],double warranty[20],double non_warranty[20],int n);
void sort(char marina_number[20][5],double warranty[20],double non_warranty[20],int n);

//*************************************************************************************************
// writing main function
int main()
{
    	int code;
	FILE *fp;

	char marina_number[20][5];
	char buffer[5];			// temporary 1D string, c[0]= marina_number[0] = AD57 later.
	double warranty[20];
	double non_warranty[20];
	
	int i=0;			// counter for for loop	
	int n = 0;			
	double  sum_warranty=0.0;
	double sum_non_warranty=0.0;
	
	fp=fopen("marina.txt","r"); 	//we get Segmentation fault error if marina.txt is not in the folder.
	
	//storing data from the file in some arrays
	while(!feof(fp))	// while loop repeats until end of file		
	{			// eg. iteration 1: buffer = AD57 copied to marina_number[0]
		fscanf(fp,"%s[^\n]",buffer);		// string scan does not have &string note: buffer[n] does not work!
		strcpy(marina_number[n],buffer);	// string = characters + null
		fscanf(fp,"%lf",&warranty[n]);		// storing 2nd coulumn values in an array warranty[n] as doubles
		fscanf(fp,"%lf",&non_warranty[n]);	// we can do math operations on double but not in strings, so we store warrany
							// and non_warranty values as double type variables instead of string type.
		n=n+1;
	}
	fclose(fp);
	n=n-1;			// here number of data reaches 10, but we have 9 data, so we do n = n-1
	//printf("value of n is now %d\n", n);	// ans =9, 0 to 8 are list values and 9th is null character \0
	//printf("the value of string is %s\n", buffer);  // SM72 the 9th or last value)
	//printf("the value of marina_number[2] is = %s\n", marina_number[2]);	// BL72 (third position value)
	//printf("the value of warranty[2] is = %.2f\n", warranty[2]);		// 217.00 (third position value)
	
	// displaying the given table of Marina Fishing data.
	printf("Data before sorting is:\n");
	printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\n");
	printf("************************************************************************\n");

	for(i=0;i<n;i++)
	{
		printf("%d                  %s                  %6.2f            %6.2f\n",i+1,marina_number[i],warranty[i],non_warranty[i]);
		
		
		sum_warranty 	 = sum_warranty + warranty[i];		// sum_warranty = 0.0 is initialized beforehand.
		sum_non_warranty = sum_non_warranty + non_warranty[i];
	}
	
	printf("**********************************************************************\n");
	
	// printing sum_warranty and sum_non_warranty
	printf("Total  =    \t\t\t\t%7.2f\t\t%7.2f\n",sum_warranty, sum_non_warranty);
	printf("Average =   \t\t\t\t%7.2f\t\t%7.2f\n", (sum_warranty/9.0) , (sum_non_warranty/9.0));	
	
	// storing the code to search or sort or abort
	printf("MENU:\n");
	printf("1 : search \n");
	printf("2 : sort (de-alphabetical order)\n");
	printf("3 : exit\n");
	printf("Enter the code => ");
	scanf("%d", &code);
	
	if ((code !=1) || (code !=2) || (code !=3) ){
		printf("Please enter 1 or 2 or 3==> ");
		scanf("%d", &code);
	}
		
	
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
printf("\n");
return 0;
}


//function search

void search(char marina_number[20][5],double warranty[20],double non_warranty[20],int n)
{
	int 	c = 0;		// counter
	char 	key[20];	// string to search
	char 	code[20];		// code y or n

        do
        {
        	printf("Enter the Marina number you want to search: =>  ");	// storing key to compare, eg. ad57,fb96  note: n=9 is no. of list
        	scanf("%s",key);
        	
        	int count=0;			// count is inside do loop, and is incremented if search is found
        	for (c=0;c<n;c++)		//eg. iteration 1: key = fb96, marina_number[0]=AD57, counter c=1<9 so again enter the loop until 9 times.
        	{
            		if(strcasecmp(marina_number[c],key)==0)		// if compared value is equal, diplays if argument.
            		{
            			printf("Position 	= %d\n",c+1);
            			printf("Warranty 	= %7.2f\n",warranty[c]);
            			printf("Non Warranty 	= %7.2f\n",non_warranty[c]);
            			printf("Do you want to search again (y/n)? => ");
            			scanf("\n%s",code);					// code can not be outside if argument
            			count++;
        		}
        	}
        	
        	if(count==0) 
        	{
                	printf("\nSorry, the number is not found!\n");
                	printf("Do you want to search again (y/n)? => ");
            		scanf("\n%s",code);
        	 }
        	 
        	 if (!((strcasecmp(code,"y")==0) || (strcasecmp(code,"Y")==0) || (strcasecmp(code,"n")==0) || (strcasecmp(code,"N")==0)))
        	 {
    				printf("Invalid code!!\n");
    				printf("Do you want to search again (y/n)? => ");
            			scanf("\n%s",code);
    				
    		 }


	}
	
	while(!((strcasecmp(code,"n")==0) || (strcasecmp(code,"n")==0)));
    	
    	
    		
//void function does not have return value
}
    

// defining function sort
    
    void sort(char marina_number[20][5],double warranty[20],double non_warranty[20],int n)
    {
        char 	temp[20];
        double	temp1,temp2; 
        int 	i,j,k;
        
        printf("Data after sorting (de-alphabetical order) is:\n");
        printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\n");
        printf("**************************************************************************************\n");
        
        for(i=0;i<n-1;i++)
        {
            for (j=i+1;j<n;j++)			// it does not work if we write (j=1;j<n;j++)
            {
                if(strcmp(marina_number[i],marina_number[j])<0)	// sorting dealphabetizing order
                {
                    strcpy(temp,marina_number[i]);		// temp is an array
                    strcpy(marina_number[i],marina_number[j]);
                    strcpy(marina_number[j],temp);
                    
                    temp1 		= warranty[i];
                    warranty[i]		= warranty[j];
                    warranty[j]		= temp1;
                    
                    temp2		= non_warranty[i];
                    non_warranty[i]	= non_warranty[j];
                    non_warranty[j]	= temp2;
                    
                }
            }

        }

	//displaying sorted list
        for (k=0;k<n;k++)
            printf("%d                  %s                  %.2f            %.2f\n",k+1,marina_number[k],warranty[k],non_warranty[k]);



    }



