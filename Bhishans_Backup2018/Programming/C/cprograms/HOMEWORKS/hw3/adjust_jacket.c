//adjust_jacket.c

#include<stdio.h>
#include<math.h>

int main()
{

int age;
double adjust_jacket;

printf("age\t");
scanf("%d", &age);

if (age>=40)
{

adjust_jacket = (((floor(age/10)*10) - 30) /80.0);


printf("adjust is = %.3f\n\n", adjust_jacket);
}

else {
	adjust_jacket = 0; 
	printf("adjust is = %.3f\n\n", adjust_jacket); }

return 0;
}
