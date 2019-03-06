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

//terminal: clear; gcc filereadNames.c && ./a.out

#include<stdio.h>
#include<string.h>	// for strcmp
#include<stdlib.h>   	// for stderr
 
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
   	int i, j;
   	FILE *fp;
   	fp = fopen("filereadNames.txt", "r");
   	
   	if (fp == NULL) {
        	fprintf(stderr, "Could not open file\n"); // when file is missing
        	exit(-1);
        }
   	
     
	//storing input from file into  the structure
	int     n=0;					// if n=0 forgot, we get Segmentation fault
	char    buf[1024] ;         //  length of one buffer is 1024
	
	//while(!feof(fp))          // we can also do like this but it may show warning
	
	while (fgets(buf, sizeof(buf), fp) != NULL)
	
	{
		fscanf(fp, "%s[^\n]", names[n].lastname);	//scan doesnot need & for string
		fscanf(fp, "%s[^\n]",names[n].firstname );
		fscanf(fp, "%d", &names[n].age);		//scan needs & for numbers
		
		n++;
	}
	fclose(fp);
	n=n-1;
      	// displaying input
      	display_input(n);
      	sort_title(n);	
 
printf("\n");
return 0; 
}
//function display_input
void display_input(int n) {
	
	int k=0;

	printf("\n**************************Original List********************************\n\n");
       
        for(k=0; k<n; k=k+1){
        printf("%s%s %d\n",names[k].lastname,names[k].firstname,names[k].age);
        }
      
} 
//function sort_lastname
 void sort_title(int n)
 {
        NAME	 temp;
        int 	i,j,k;
        
         printf("\n***************************Alphabetized list***************************\n\n");
       
        for(i=0;i<n-1;i++){
        for (j=i+1;j<n;j++){			
            if (strcmp(names[i].lastname,names[j].lastname)>0){ 	// for stirng so we use string compare	
                temp 	= names[i];
                names[i]= names[j];
                names[j]=temp;
            }
        }
	}
	//displaying sorted list
        for(k=0; k<n; k=k+1){
        printf("%s%s %d\n",names[k].lastname,names[k].firstname,names[k].age);
        }
}
