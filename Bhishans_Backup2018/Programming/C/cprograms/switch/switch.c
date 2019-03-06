#include<stdio.h>
int main()
{
	char alpha;

	printf("\nenter the alphabet\n\n");
	scanf("%c",&alpha);

	switch(alpha)
       {
       case '':
       case 'A':
               printf("You entered alphabet A\n");
               break;
       case 'b':
       case 'B':
               printf("You entered alphabet B\n");
               break;
               
       default :
       		printf("the entered alphabet is other than a or b\n");
       		break;
        }
        
return 0;
}
