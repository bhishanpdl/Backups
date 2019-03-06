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
} ;
typedef struct namelist NAME;
NAME names[10], temp[10];

//function prototypes
void display_input(int n);
void sort_title(int n);
 
 // main function
int main() 
{
printf("\n");
   	int i, j, n;
   	
   	printf("How many names you want to store? ==> ");
   	scanf (" %d", &n);
  
	//storing values in the structure
   	for (i = 0; i < n; i++) 
   	{
      		printf("%d. Enter lastname => ", i+1);
      		scanf("%s", names[i].lastname);
      		printf("%d. Enter firstname => ", i+1);
      		scanf("%s", names[i].firstname);
      		printf("%d. Enter age => ", i+1);
      		scanf("%d", &names[i].age);
      		printf("\n");
      	} 
      	// displaying input
      	display_input(n);
      	sort_title(n);	
 

return 0; 
}
//function display_input
void display_input(int n) {
	
	int k=0;

	printf("\n*************************************Original List***************************************\n\n");
       
        for(k=0; k<n; k=k+1){
        printf("%s,%s %d\n",names[k].lastname,names[k].firstname,names[k].age);
        }
      
} 
//function sort_lastname
 void sort_title(int n)
 {
        NAME	temp;
        int 	i,j,k;
        
         printf("\n*************************************Alphabetized list***************************************\n\n");
       
        for(i=0;i<n-1;i++){
        for (j=i+1;j<n;j++){			
            if (strcmp(names[i].lastname,names[j].lastname)>0){ 	// title is stirng so we use string compare	
                temp 	= names[i];
                names[i]= names[j];
                names[j]=temp;
            }
        }
	}
	//displaying sorted list
        for(k=0; k<n; k=k+1){
        printf("%s,%s %d\n",names[k].lastname,names[k].firstname,names[k].age);
        }
}
