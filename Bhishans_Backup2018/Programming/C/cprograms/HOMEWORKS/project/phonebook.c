/* Author: Bhishan Poudel
   Question:2

Develop a C Program called Phone Book which allows the user 
to enter frequently called phone numbers as well as friedns & emergency numbers with names. 
User should be able to search for any friend or emergency numbers from the phonebook by the name,
if found the program should displsy name and the corresponding phone mumber, 
otherwise, display a messsage "Not Found!!'. 
*/

#include<stdio.h>
#include<string.h>

//function prototype

void search(char name[20][20],char number[20][20],char address[20][20], int n);
//main function
int main(){
	int 	i = 0;
	char 	name[20][20];
	char 	number[20][20];
	char	address[20][20];
	char 	key;
	int 	n = 0;
	char	buff[20];
	
	do {
		printf("Input the name ==> ");
		scanf (" %s", buff);
		strcpy(name[n],buff);	
		
		printf("Input the phone number ==> ");
		scanf (" %s", number[n]);
		
		
		printf("Input the address ==> ");
		scanf (" %s", buff);
		strcpy(address[n], buff);
		
		printf("\nDo you want to store a contact list(y/n)? => ");
		scanf (" %c", &key);
		
		n = n+1;
        }
    	while(key == 'y' || key == 'Y');
    	printf("Now you can search the person you want\n");
	search(name,number,address,n);
	 	
return 0;
}

//*************************************************
// defining the function search


void search(char name[20][20],char number[20][20],char address[20][20], int n)
{
	int c = 0;	// counter
	char key[20];	// string to search
	char code;	// code y or n

        do
        {
        	printf("Enter the name you want to search: =>  ");
        	scanf(" %s",key);	
        	int count=0;			
        	for (c=0;c<n;c++)		
        	{
            		if(strcasecmp(name[c],key)==0)		// if compared value is equal
            		{
            			printf("\n\nsearched name 	= %s\n", key);
            			printf("phone number	= %s \n", number[c]);
            			printf("current address	= %s \n", address[c]);
            			
            			
            			printf("\nDo you want to search again (y/n)? => ");
            			scanf("\n%c",&code);				
            			count++;
        		}
        	}
        	
        	if(count==0) 
        	{
                	printf("\nSorry, the name is not found!\n\n");
        	break; }


	}
    	while(code == 'y' || code == 'Y');
    	if (!(code == 'y' || code == 'Y' ||code == 'n' || code == 'N'))
    		printf("Invalid code!!\n");
    	if (code == 'n' || code == 'N' )
    		printf("Thanks for using the program\n");
}
//end of function search


