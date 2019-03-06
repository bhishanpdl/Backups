/* Programmer: Bhishan Poudel
 * Question  : hw 4.1 
 *Topic	:  Programming project 6 from your textbook on page 515 (Chapter 8 String)
 Write a program that stores lists of names (the last name first) and ages in
 parallel arrays and sorts the names into alphabetical order keeping the ages
 with the correct names. Sample output:
 Original list
-----------------------------
Ryan, Elizabeth		62
McIntyre, Osborne	84
DuMond, Kristin		18
Larson, Lois		42
Thorpe, Trinity		15
Ruiz, Pedro		35

Alphabetized list
-----------------------------
DuMond, Kristin		18
Larson, Lois		42
McIntyre, Osborne	84
Ruiz, Pedro		35
Ryan, Elizabeth		62
Thorpe, Trinity		15
*/

#include<stdio.h>
#include<string.h>
 
struct namelist 
{
  	char 	lastname[20];
   	char 	firstname[20];
   	int 	age;
} person[10], temp;
 
 // main function
int main() 
{
printf("***************************************\n");
   	int i, j, n;
   	
   	printf("How many names you want to store?\n");
   	scanf (" %d", &n);
  
	//storing values in the structure
   	for (i = 0; i < n; i++) 
   	{
      		printf("%d. Enter lastname => ", i+1);
      		scanf("%s", person[i].lastname);
      		printf("%d. Enter firstname => ", i+1);
      		scanf("%s", person[i].firstname);
      		printf("%d. Enter age => ", i+1);
      		scanf("%d", &person[i].age);
      		printf("\n");
      		
   	}
   	
 
 	//sorting by lastname using bubble sort method
   	for (i = 1; i < n; i++)
      	for (j = 0; j < n - i; j++) 
      	{
         	if (strcmp(person[j].lastname, person[j + 1].lastname) > 0) 
         	{
            		temp = person[j];
            		person[j] = person[j + 1];
            		person[j + 1] = temp;
         	}
      	} 
      	
	
 
 	printf("The sorted namelist is:\n\n");
   	for (i = 0; i < n; i++) 
   	{
      		printf("%s,%s\t%d\n",person[i].lastname,person[i].firstname,person[i].age);
   	} 
   	
printf("\n***************************************\n");
return 0; 
}
