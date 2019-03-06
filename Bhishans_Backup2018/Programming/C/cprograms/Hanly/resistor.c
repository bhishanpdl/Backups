/* Hanly 7E Chapter 8 Strings Project 2 page. 512

A resistor is a circuit device designed to have a specific resistance value
between its ends. Resistance values are expressed in ohms (⍀) or kilo-ohms
(k⍀). Resistors are frequently marked with colored bands that encode their
resistance values, as shown in Fig. 8.23. The first two bands are digits, and the
third is a power-of-ten multiplier.

Resistance = (First digit*10 + Second digit ) * 10 ^ (Third digit)

Notice that “red” is COLOR_CODES[2] and has a digit value of 2 and a multiplier
value of 102. In general, COLOR_CODES[n] has digit value n and multiplier value 10n.
Write a program that prompts for the colors of Band 1, Band 2, and Band 3,
and then displays the resistance in kilo-ohms. Include a helper function search
that takes three parameters—the list of strings, the size of the list, and a target
string, and returns the subscript of the list element that matches the target or
returns –1 if the target is not in the list. Here is a short sample run:
Enter the colors of the resistor's three bands, beginning with
the band nearest the end. Type the colors in lowercase letters
only, NO CAPS.


Color Codes for Resistors*

Color 	Value as Digit 	Value as Multiplier
Black	0		1
Brown	1 		10
Red 	2 		10^2
Orange 	3 		10^3
Yellow 	4 		10^4
Green 	5 		10^5
Blue 	6 		10^6
Violet 	7		10^7
Gray	8		10^8
White	9		10^9

*/

/* Required output:
Band 1 => green
Band 2 => black
Band 3 => yellow
Resistance value: 500 kilo-ohms
Do you want to decode another resistor?
=> y
ngs
Enter the colors of the resistor's three bands, beginning with
the band nearest the end. Type the colors in lowercase letters
only, NO CAPS.
Band 1 => brown
Band 2 => vilet
Band 3 => gray
Invalid color: vilet
Do you want to decode another resistor?
=> n

/*
* This program prompts for the colors of three bands of a resistor, and displays* value of the resistance in kilo-ohms based on a color code
*/


#include<stdio.h>
#include<math.h>	 /* for pow for UNIX use -lm  
#include <ctype.h>  	/* for toupper*/
#include<string.h>	/* for strlen*/

#define NOT_FOUND -1	/* constants */
#define SUB_1 10
#define SUB_2 7
			// function prototype
int search(const char [][SUB_2], const char [], int);
			// int main
int main()
{
  char  reply;			/* user reply*/
  char	char_left; 		/* character left in input stream*/
	
  do
  {
    int i;			/* counters*/
    int counter;
    int value;			/* subscript of target found in list*/
    double answer = 0.0;	/* value of resistor in kilo-ohms*/
    int no_error = 1;		/* denotes no error*/
		
/* initializing the array*/

  char COLOR_CODES[SUB_1][SUB_2] = { "black", "brown", "red","orange", "yellow", "green", "blue", "violet", "gray", "white"};

  char target[SUB_2];		/* target string array*/

    printf("Enter the colors of the resistor's three bands, beginning with\n");
    printf("the band nearest the end. Type the colors in lowercase letters only, ");
    printf("NO CAPS.\n");
    printf("The colors are one of these :\n");
    printf("'black', brown, 'red','orange', 'yellow', 'green', 'blue', 'violet', 'gray', 'white'\n");
//***********************************	
  for(counter = 1; counter < 4 && no_error; counter++)
  {
    printf("Band %d => ", counter);
    scanf("%s", target);
    
    value = search(COLOR_CODES, target, SUB_1);	/* searches for string*/
 
    if(value != NOT_FOUND)
    {
      switch(counter)
      { 
	case 1: answer = value * 10;
	break;
	case 2: answer += value;
	break;
        case 3:
	if(value > 3)
	  answer *= pow(10, (value - 3));
	else
	  for(i = 0; i < (3 - value); i++)
	    answer /= 10;
       }
     }
	
   else
     no_error = 0;		/* if string not found*/
}		// closing for loop
//****************************************************************


	if(no_error)
	  printf("Resistance value: %.3f kilo-ohms\n\n", answer);
	else
	  printf("Invalid Color: %s\n\n", target);
	printf("Do you want to decode another resistor?(y/n)\n => ");
	scanf("%c%c", &char_left, &reply);
	
	printf("\n");
	
      }		// end of do loop
	while(toupper(reply) == 'Y');
}		// end of int main
/* function takes as input a list of strings, its size, and a target string.
* It searches the list for the target and returns as its value the subscript of the
* target in the list. it returns -1 if target is not found.
*/
//*************************
//defining function search pre: color codes, target, size.
	int search(const char COLOR_CODES [10][SUB_2], const char target [10], int size)
	{
	  int i;	 /* counters*/
	  int j;
	  int length;
	  int counter = 0;
	  int found = 0;	/* indicates when string is found*/
	  int where;		/* location of target*/
	  
	  
	  length = strlen(target);
	  for(i = 0; i < size && !found ; i++)
	  {
	    for(j = 0; j < length; j++)
	      if(COLOR_CODES[i][j] == target[j])
	        counter++;
	      if(counter == length)
	        found = 1;
	      else
	        counter = 0;
	  }
	  --i;
	
	  if(found)
	    where = i;
	  else
	    where = NOT_FOUND;

	  return where;
	}
//**********************end of function search



