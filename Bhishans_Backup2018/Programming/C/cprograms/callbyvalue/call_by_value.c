#include<stdio.h>

void interchange(int number1,int number2)
{
    int temp;
    temp = number1;
    number1 = number2;
    number2 = temp;
}

int main() {

    int num1=50,num2=70;
    interchange(num1,num2);

    printf("\nNumber 1 : %d",num1);
    printf("\nNumber 2 : %d\n\n",num2);
    	printf("\ninterchanged number 1: %d\n\n",number1);
	printf("\ninterchanged number 2: %d\n\n",number2);

    return(0);
}
