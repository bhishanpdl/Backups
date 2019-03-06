/* Programmer	: Bhishan Poudel
 * Question  	: hw 4.4 
 *Topic		: Classic Phone book program
 
 Classic Phone book program: Define a structure for the Phonebook with 
 possible fields: Lastname, Firstname, area code, last 4-digits of the phone number
Implement the search by the Lastname, if found to display the phone number, 
otherwise to display a message "NOT Found!"

 */
 
#include<stdio.h>
#include<string.h>


typedef struct
{

	char 		lastname[50];
	char 		firstname[50];
	int 		areacode;
	long long int 	phno;

}phonebook;


int main()
{
printf("\n");
	int n;
	phonebook x[10]; //x is a structure type variable

	char key[50];	// key is search string

	int i;		// for loop counter
	
	printf("how many contacts you want to store? ==> ");
	scanf (" %d", &n);

	//storing contacts inside the structure
	for(i=0;i<n;i++)
	{

		printf("\n%d of %d: Enter: lastname firstname areacode phonenumber\n\t\t",i+1,n);
		scanf(" %s %s %d %lld",x[i].lastname,x[i].firstname,&x[i].areacode,&x[i].phno);

	}
	
	//**************************************
	//searching

	printf("\nEnter the last name of person you are looking for: \n");
	scanf("%s",key);	//storing key to search


	int found = 0;		// found = 0 is used to search number zero or not.
	for(i=0;i<n;i++)
	{

		if(strcmp(x[i].lastname, key) ==0 ) 
		{ 
			printf("The phone number of %s %s is %lld\n", x[i].firstname, x[i].lastname, x[i].phno); 
			found++;
			break;
		}
		
	}
	if (found ==0)
	{
			printf("Not found!\n");
	}
printf("\n");
return 0;
}


