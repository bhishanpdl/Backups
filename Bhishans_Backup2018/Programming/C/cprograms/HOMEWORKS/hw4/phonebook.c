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

}phonebook;


int main()
{

	int n;
	phonebook x[10]; //x is a structure type variable

	char key[50];	// key is search string

	int i;		// for loop counter
	
	printf("how many contacts you want to store?\n");
	scanf (" %d", &n);

	//storing contacts inside the structure
	for(i=0;i<n;i++)
	{

		printf("\n%d: enter lastname (space/enter) firstname (space/enter) areacode (space/enter) phonenumber\n",i+1);
		scanf("%s %s %d %lld",x[i].lastname,x[i].firstname,&x[i].areacode,&x[i].phno);

	}
	
	//**************************************
	//searching

	printf("Enter the last name of person you are looking for: \n");
	scanf("%s",key);	//storing key to search


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

return 0;

}


