//author: bhishan poudel
//question: 3
#include<stdio.h>
#include<string.h>

int main(){

    int i;
    int n=0;
    double distance[20];
    int rating[20];
    int code;

    char name[20][20];
    char c[20];
    double key;
    double price[20];

    int found=0;

    FILE *fp;
    fp=fopen("m.txt","r");


    while(!feof(fp)){
    fscanf(fp,"%s[^\n]",c);
    strcpy(name[n],c);

    fscanf(fp,"%lf",&price[n]);
    fscanf(fp,"%lf",&distance[n]);
    fscanf(fp,"%d",&rating[n]);
    n=n+1;
    }
    fclose(fp);
    n=n-1;

printf("******************Input Data*******************************\n");
printf("%-20s %-6s %-6s %-6s\n","Name","Price","Distance","Rating");
printf("----------------------------------------------------------\n");
for(i=0;i<n;i++)
    printf("%-20s %-6.2f %-6.2f %-5d\n",name[i],price[i],distance[i],rating[i]);
    printf("------------------------------------------------------\n");

printf("\n");
printf("If you want to search by price then press 1\n");
printf("If you want to search by distance then press 2\n");
scanf("\n%d",&code);
if(code == 1)
{
    printf("Enter the price you  want to search\n");
    scanf("%lf",&key);
    printf("Required motel are:\n");
    printf("---------------------------------------------------------\n");
    for(i=0;i<n;i++)
    {
        if(price[i]<=key)
        {
            printf("name = %-20s distance = %-6.2f price = %-6.2f\n",name[i],distance[i],price[i]);
            found=1;
        }
    }
    if(found==0)
        printf("%.2f is not found in the list\n");
}
if(code == 2)
{
     printf("Enter the distance you  want to search\n");
    scanf("%lf",&key);
    printf("Required motels are:\n");
    printf("---------------------------------------------------\n");
    for(i=0;i<n;i++)
    {
        if(distance[i]<=key)
        {
            printf("name = %-20s distance = %-6.2f price = %-6.2f\n",name[i],distance[i],price[i]);

            found=1;


}
    }
    if(found==0)
        printf("%.2f is not found\n");
        }

return 0;
}
