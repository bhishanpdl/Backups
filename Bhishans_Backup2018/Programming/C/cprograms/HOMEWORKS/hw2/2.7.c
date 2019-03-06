/* hw 2.7
	Develop a program to implement the Flight classification according to the criteria:
	Flight Code			Classification
	F or A				First class
	B or Q				Business class
	Y or S or M			Full Fare Economy
	K or C				Preferred Economy
	U, J, P or G			Economy class
Implement using switch statements.
*/

#include <stdio.h>
int main ()
{
	char code;
	
	printf("Please enter the flight code\n");
	scanf ("%c",&code);
	
	
	switch(code)
	{
		case'f' :
		case'a' :
		case 'F':
		case 'A':
			printf("You are in first class\n");
			break;
		case 'b':
		case 'q':
		case 'B':
		case 'Q':
			printf("You are in business class\n");
			break;
		case 'y':
		case 's':
		case 'm':
		case 'Y':
		case 'S':
		case 'M':
			printf("You are in full fare economy class\n");
			break;
		case 'k':
		case 'c':
		case 'K':
		case 'C':
			printf("You are in preferred economy class\n");
			break;
		case 'u':
		case 'j':
		case 'p':
		case 'g':
		case 'U':
		case 'J':
		case 'P':
		case 'G':
			printf("You are in economy class\n");
			break;
			
	default :
			printf("You entered wrong flight code, please enter correct code\n");
			break;
	}
	
return 0;
}
	 
