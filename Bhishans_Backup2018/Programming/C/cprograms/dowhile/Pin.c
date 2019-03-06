//Marina Fishing Services
#include<stdio.h>
#include<string.h>
double average_sum_warranty(double warranty[],int n);
double average_sum_non_warranty(double non_warranty[],int n);
//void searching(char marina_number[],double warranty[],double non_warranty[],int n);
//void sorting(char marina_number[],double warranty[],double non_warranty[],int n);

int main()
{
    char code;
    char temp[20];
FILE *fp;

char marina_number[20][20],c[20];
double warranty[20],non_warranty[20];

char key[20];

int i,j,k,n=0;
double  sum_warranty=0.0;
double sum_non_warranty=0.0;
fp=fopen("D:marina.txt","r");
while(!feof(fp))
{
fscanf(fp,"%s[^\n]",c);
strcpy(marina_number[n],c);
fscanf(fp,"%lf",&warranty[n]);
fscanf(fp,"%lf",&non_warranty[n]);

n=n+1;
}
fclose(fp);
n=n-1;
printf("Your Data set is like this\n");
printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\t\n");
printf("*******************************************************************\n");
for(i=0;i<n;i++)
printf("    %d              %s                  %.2f            %.2f\n",i+1,marina_number[i],warranty[i],non_warranty[i]);

printf("\n");
for(j=0;j<10;j++)
{
sum_warranty=sum_warranty+warranty[j];
sum_non_warranty=sum_non_warranty+(non_warranty[j]);

}
printf("Total warranty =%5.2f\n",sum_warranty);
printf("Total non_warranty =%.2f\n",sum_non_warranty);

printf("The average value of warranty =%.2f\n",average_sum_warranty(warranty,n));
printf("The average value of non_warranty =%.2f\n",average_sum_non_warranty(non_warranty,n));

printf("\n");
printf("To sort press -y\n");
printf("To search press -n\n");
printf("Or simply press -a to terminate or Abort\n");
scanf("%c",&code);
switch(code)
{
    case 'n':
    case 'N':
        do
        {
        printf("Enter the Marina number you want to search:\n");
        scanf("%s",key);
        for (i=0;i<n;i++)
        {
            if(strcmp(marina_number,key)==0)
            {
            printf("%s is present in %d index,means %d position\n",key,c,c+1);
            printf("The Corresponding values for warranty and non_warranty is %.2f, %.2f\n",warranty,non_warranty);
            printf("If you want to search more then press -d neither press f\n");
            scanf("%c",&code);
        }
    }


}
    while(code=='d' || code=='D');


    case 'y':
    case 'Y':
        printf("After sorting it looks like:\n");
        printf("Serial No.\tMarina Number\t\tWarranty\tNon-Warranty\t\n");
        printf("***********************************************************\n");
        for(i=0;i<n-1;i++)
        {
            for (j=i+1;j<n;j++)
            {
                if(strcmp(marina_number[i],marina_number[j])<0)
                {
                    strcmp(temp,marina_number[i]);
                    strcmp(marina_number[i],marina_number[j]);
                    strcmp(marina_number[j],temp);
                }
            }

        }
    for (k=0;k<n;k++)
            printf("%d           %s          %.2f            %.2f\n",k,marina_number,warranty,non_warranty);


break;
    case 'a':
    case 'A':
        printf("Have a good day\n");
    default:
        printf("Sorry! you have entered the wrong code\n");
}

return 0;
}
//**********************************************
double average_sum_warranty(double warranty[],int n)
{
    double sum_warranty=0.0;
    double avgw;
    int i;
    for(i=0;i<10;i++)
    {
    sum_warranty =sum_warranty+warranty[i];
    }
    avgw=sum_warranty/9.0;
    return (avgw);
}
//****************************************************************




double average_sum_non_warranty(double non_warranty[],int n)
{
    double sum_non_warranty=0.0;
    double avgnw;
    int i;
    for(i=0;i<9;i++)
    {
        sum_non_warranty=sum_non_warranty+non_warranty[i];
    }

    avgnw=(sum_non_warranty)/9.0;
    return (avgnw);
}
//****************************************************************************
