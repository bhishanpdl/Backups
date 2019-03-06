// Program using stucture to read from files

#include<stdio.h>

struct marina_fishing {
    	double 	warranty;
    	double 	nwarranty;
	char 	mnumber[10];
};
 
typedef struct marina_fishing NAME;
NAME marina[10], temp[10];

void search (int i);
void sort(int w);
int main(){
	int n=0, k,j;
	FILE *mf;
	mf = fopen("marina.txt","r");	
	
	while(!feof(mf)) 
	{
        	fscanf(mf, "%s[^\n]",marina[n].mnumber);
	fscanf(mf,"%lf", &marina[n].warranty);
	fscanf(mf, "%lf", &marina[n].nwarranty);
		
        n= n+1;
	}	
    	n= n-1;
    
	fclose(mf);
    
//*****************Trying to print out the values********************
        printf("\n\n********************* Unsorted Presentation ***********************************\n\n");
        printf("Marina Number \t\tWarranty \tNon-Warranty\n");
        
            for(k=0; k<n; k=k+1)
            {
                printf("%s \t\t\t%7.2f \t%7.2f\n",marina[k].mnumber,marina[k].warranty,marina[k].nwarranty);
            }
        printf("\n******************************************************************************\n\n");
    
    sort(n);
    
    printf("\n\n*********************sorted Presentation ***********************************\n\n");
    printf("Marina Number \t\tWarranty \tNon-Warranty\n");
    
    for(k=0; k<n; k=k+1)
    {
        printf("%s \t\t\t%7.2f \t%7.2f\n",marina[k].mnumber,marina[k].warranty,marina[k].nwarranty);
    }
    printf("\n******************************************************************************\n\n");
    
        search(k);

    return 0;
}

void search (int i)
{
    char option,option2;
    char c[20];
    int found = 0, n;
    do{
        printf("Do you want to search");
        scanf(" %c",&option);
        switch(option)
        {
            case 'y':
            case 'Y':
            {
                printf("Enter the marina number\n");
                scanf("%s",&c);
                for (n=0;n<i;n=n+1)
                {
                    if (strcasecmp (marina[n].mnumber,c)==0)
                    {
                        printf("\nmarina number:\t%s\n",marina[n].mnumber);
                        printf("\nwarranty:\t%lf\n",marina[n].warranty);
                        printf("\nnwarranty\t%lf\n",marina[n].nwarranty);
                        found=1;
                    }
                }
                
                if(found==0)
                    printf("We couldnot find the number in our database\n");
                break;
            }

            default:
            printf("Wrong number");
        }
        printf("Do you want to continue");
        scanf(" %c", &option2);
    }while(option2=='y');
}

void sort(int w)
{
    int i,j;
    NAME temp;

    for(i =0;i<w-1;i=i+1)
    {
        for(j =i+1;j<w;j=j+1)
        {
            if (strcmp(marina[i].mnumber,marina[j].mnumber)<0)
            {
                temp = marina[i];
                marina[i]=marina[j];
                marina[j]=temp;
            }
        }
    }
}
