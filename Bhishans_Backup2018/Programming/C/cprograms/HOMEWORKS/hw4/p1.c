/* Programmer	: Bhishan Poudel
 * Question  	: hw 4.4 
 *Topic		: Classic Phone book program
 */
 
#include<stdio.h>
#include<string.h>


typedef struct
{

	char 		lastname[50];
	char 		firstname[50];
	int 		areacode;
	long long int 	phno;

}PHONEBOOK;

//function prototypes
void search( PHONEBOOK x[10], int n);

//main function
int main()
{

	int n;
	PHONEBOOK x[10]; //x is a structure type variable

	int i;		// for loop counter
	
	printf("how many contacts you want to store?\n");
	scanf (" %d", &n);

	//storing contacts inside the structure
	for(i=0;i<n;i++)
	{
		printf("\n%d: enter lastname (space/enter) firstname (space/enter) areacode (space/enter) phonenumber\n",i+1);
		scanf("%s %s %d %lld",x[i].lastname,x[i].firstname,&x[i].areacode,&x[i].phno);
	}
	//calling the function
	search(PHONEBOOK x[10], n);
	
return 0;
}
// function search
//**************************************

void search(PHONEBOOK x[10], int n)
{

typedef struct
{

	char 		lastname[50];
	char 		firstname[50];
	int 		areacode;
	long long int 	phno;

}PHONEBOOK;


	PHONEBOOK x[10]; //x is a structure type variable
	int i;
	char key[50];	// key is search string
	
	printf("Enter the last name of person you are looking for: \n");
	scanf("%s",key);	//storing key to search string


	int count = 0;		// count = 0 is used to search number zero or not.
	for(i=0;i<n;i++)
	{

		if(strcmp(x[i].lastname, key) ==0 ) 
		{ 
			printf("The phone number of %s %s is %lld\n", x[i].firstname, x[i].lastname, x[i].phno); 
			count++;
			break;
		}
		
	}
	if (count ==0)
	{
			printf("Not found!\n");
	}
}
//end of function search

