#include<stdio.h>
#define N 10                         /*    SYMBOLIC CONSTANT*/
void main()
{

       int count;
       float sum,average,number;

       sum=0;
       count=0;
       printf("Enter the temperaure of 10 days\n");

       while(count<N)
       {
    	scanf("%f",&number);
    	sum=sum+number;
    	count=count+1;
       }
       		average=sum/N;
       		printf("\nN=%d Sum=%.2f\n",N,sum);
       		printf("Average=%.2f\n",average);
	
}
