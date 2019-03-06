 /*Write a program to read two numbers and find the bigger number by
using function.*/

#include<stdio.h>

int bigger(int,int);

int main(){

	int n1,n2,big;
	printf("Enter the first number ");
	scanf("%d",&n1);
	printf("Enter the second number ");
	scanf("%d",&n2);

	big=bigger(n1,n2);
	
	printf("\nthe bigger number= %d\n\n",big);

return(0);
}

int bigger(int a,int b){	//a and b are local variables
if(a>b) 
return(a);

else
return(b);
}

