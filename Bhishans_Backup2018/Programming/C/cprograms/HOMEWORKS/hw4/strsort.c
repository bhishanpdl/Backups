/* Program Statement – Define a structure called cricket that will
 describe the following information
Player name
Team name
Batting average

Using cricket, declare an array player with 10 elements and write a program
to read the information about all the 10 players and print a team wise list (sorting teams)
containing names of players with their batting average.
*/






#include<stdio.h>
#include<string.h>
 
struct cricket 
{
  	char 	pname[20];
   	char 	tname[20];
   	int 	avg;
} player[10], temp;
 
 // main function
int main() 
{
printf("***************************************\n");
   	int i, j, n;
  
	//storing values in the structure
   	for (i = 0; i < 2; i++) 		//storing 2 values
   	{
      		printf("%d. Enter Player Name => ", i+1);
      		scanf("%s", player[i].pname);
      		printf("%d. Enter Team Name => ", i+1);
      		scanf("%s", player[i].tname);
      		printf("%d. Enter Average => ", i+1);
      		scanf("%d", &player[i].avg);
      		printf("\n");
   	}
   	n = 2;
 
 	//sorting team names
   	for (i = 1; i < n; i++)
      	for (j = 0; j < n - i; j++) 
      	{
         	if (strcmp(player[j].tname, player[j + 1].tname) > 0) 
         	{
            		temp = player[j];
            		player[j] = player[j + 1];
            		player[j + 1] = temp;
         	}
      	}
 
 
   	for (i = 0; i < n; i++) 
   	{
      		printf("\n%s\t%s\t%d",player[i].pname,player[i].tname,player[i].avg);
   	}
   	
printf("\n***************************************\n");
return 0; 
}
