/* Conversion of Celsius to Fahrenheit temperatures */

#include <stdio.h>
				/* Constant macros */
#define CBEGIN 100
#define CLIMIT -5
#define CSTEP 20

int main(void)
{
				/* Variable declarations */
int celsius;
double fahrenheit;

				/* Display the table heading */
printf("Celsius Fahrenheit\n");

				/* Display the table */
for (celsius = CBEGIN; celsius >= CLIMIT; celsius -= CSTEP) 
{
	fahrenheit = 1.8 * celsius + 32.0;
	printf("%3d \t %7.2f\n", celsius, fahrenheit);		// %3d = space space 1 %d = 1 space space
								// tab is equal to 8 spaces
}

return (0);
}
