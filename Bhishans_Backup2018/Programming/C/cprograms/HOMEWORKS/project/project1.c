/*Mariana Fishing Services:project 1*/
//CS 5900

#include<stdio.h>
#include <string.h>
#include <stdlib.h>
double compute1(double warranty[],int n);
double compute2(double warranty[],int n);
int main()
{
    FILE *fp;
    int i,j,n;
    i=0;n=0;
    char str[10][5];
    char cm[5];
    char temp[5];
    char code,code1;
    double warranty[10];
    double nwarranty[10];
    double tot1,tot2,average1,average2;

    fp = fopen("mariana.txt","r");
    while(!feof(fp))
  // for(i=0;i<9;i++)
    {
        fscanf(fp,"%s[^\n]",&str[n]);
        fscanf(fp,"%lf",&warranty[n]);
        fscanf(fp,"%lf",&nwarranty[n]);
        n=n+1;
    }
    fclose(fp);
    printf("\nMariana Number\t\tWarranty\t\tNon-Warranty\n");
    printf("**********************************************************************\n");
    for(j=0;j<n;j++)
    {
        printf("%s  \t                 %.2f   \t         %.2f\n",str[j],warranty[j],nwarranty[j]);
    }
        tot1 = compute1(warranty,n);
        tot2 = compute2(nwarranty,n);
        average1=tot1/n;
        average2=tot2/n;
        printf("\nTotal::: Warranty=%.2f\t\tNon-Warranty=%.2f\n",tot1,tot2);
        printf("\nAverage::: Warranty=%.2f\t\tNon-Warranty=%.2f\n",average1,average2);
        do
        {
            printf("\n**********************************************\n");
            printf("\nDo you want to search or sort by marina number?\n");
            printf("\npress 'y' for sorting and 'n' for searching\n");
            scanf("\n%c",&code);
        
        
            printf("\nEnter the Mariana Number you want to search:\n");
            scanf("%s",&cm);
            int count=0;
            for (i=0;i<n;i++)
            {
                if(strcmp(str[i],cm)==0)
                {
                printf("\nMariana Number:%s\n",str[i]);
                printf("\nWarranty:%.2f\n",warranty[i]);
                printf("\nNon-Warranty:%.2f\n",nwarranty[i]);
                printf("\nThe details are located at %d position of the record\n",i+1);
                count++;
            }
        }
        if(count==0)
                printf("\nSorry!There is no such number in the record\n");
        break;
    
        }
        printf("\nDo you want to continue? (y/n)\n");
        scanf("\n%c",&code1);
        }
        while (code1=='y' || code1=='Y')
    return 0;
}
double compute1(double warranty[],int n)
{
    int k;
    double total1;
    total1=0.0;
    for(k=0;k<n;k++)
    {
        total1=total1+warranty[k];
    }

    return total1;
}
double compute2(double nwarranty[],int n)
{
    int k;
    double total2;
    total2=0.0;
    for(k=0;k<n;k++)
    {
        total2=total2+nwarranty[k];
    }

    return total2;
}
