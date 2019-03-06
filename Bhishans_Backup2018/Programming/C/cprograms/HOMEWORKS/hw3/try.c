// adjust_waist.c

#include<stdio.h>
#include<math.h>

int main()
{

int age;
double adjust_waist;

printf("age\t");
scanf("%d", &age);

if (age>=30)
{

adjust_waist = (((floor(age/2)*2) - 28) /20.0);


printf("adjust is = %.3f\n\n", adjust_waist);
}

else {
	adjust_waist = 0; 
	printf("adjust is = %.3f\n\n", adjust_waist); }

return 0;
}
