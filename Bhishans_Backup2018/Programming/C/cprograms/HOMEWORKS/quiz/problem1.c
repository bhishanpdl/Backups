// author: bhishan poudel
// qn: quiz1.c

#include <stdio.h>
#include <string.h>

//defining structure before the int main
struct pet
{
    char itemname[10];
    int oh;
    double prices;
    double cost;
};
typedef struct pet NAME;
NAME bhishan[10];

//defining function prototypes
void sorting(int n);
void maximum(int n);
void minimum(int n);

//int main function
int main()
{
 	FILE *fp;
	fp=fopen("pet.txt","r");
	
    	int 	i
    	int 	value =0;
    	int 	n=0;
    	double tinval=0.0;
    
    
    
    	//storing the input from file to the structure
    	while(!feof(fp)) {
            fscanf(fp,"%s[^\n]",bhishan[n].itemname);

            fscanf(fp,"%d",&bhishan[n].oh);
            fscanf(fp,"%lf",&bhishan[n].prices);
            n=n+1;
        }
        fclose(fp);
	n=n-1;
	
	// calculating total
        for(i=0;i<n;i++){
        
            bhishan[i].cost=(bhishan[i].oh)*(bhishan[i].prices);
        value=value+bhishan[i].oh;
    	tinval=tinval+bhishan[i].cost;
        }
            
        //displaying input
        printf("-------------------------\n");
        printf("unsorted list \n");
        printf("-------------------------\n");
        printf("\nItem*ID..  On-Hand  Price\tCost..\n");
    	printf("*********************************************************\n");
    
        for(i=0;i<n;i++)
            printf("%s\t    %d\t    $%.2f\t$%.2f\n",bhishan[i].itemname,bhishan[i].oh,bhishan[i].prices,bhishan[i].cost);
        printf("************************************************************\n");
        printf("TOTAL\t    %d\t    $%.2f\n\n",value,tinval);
        
        printf("-------------------------\n");
        printf("Sorting by the price\n");
        printf("-------------------------\n");
        sorting(n);
        maximum(n);
        minimum(n);
return 0;
}

//defining function sorting
void sorting(int n)
{
    int i,j,k;
    NAME temp1;
    for(j=0;j<n-1;j++)
    {

        for(k=j+1;k<n;k++)
        {
            if(bhishan[j].prices>bhishan[k].prices)
            {
                temp1=bhishan[j];
                bhishan[j]=bhishan[k];
                bhishan[k]=temp1;
            }

            }
        }
    printf("\nItem-ID\t\tOn-Hand\t\tPrice\n");
    printf("*********************************************************\n");
     for(i=0;i<n;i++)
            printf("%s\t\t%d\t\t$%.2f\n",bhishan[i].itemname,bhishan[i].oh,bhishan[i].prices);

}
//defining function maximum of quantity-on-hand
void maximum(int n)
{
 int maximum=bhishan[0].oh;
 int i;
 for(i=1;i<n;i++)
 {
     if(bhishan[i].oh>maximum)
        maximum=bhishan[i].oh;
     else
        maximum=maximum;
 }
 printf("\nMaximum of quantity on hand is :    %d\n",maximum);

}
//defining function minimum of price
void minimum(int n)
{
 double minimum=bhishan[0].prices;
 int i;
 for(i=1;i<n;i++)
 {
     if(bhishan[i].prices<minimum)
        minimum=bhishan[i].prices;
     else
        minimum=minimum;
 }
 printf("\nMinimum of Price is:      $%.2f\n",minimum);

}
