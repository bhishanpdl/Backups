/* Author: Bhishan Poudel
   Question: hw4.9

Every credit card has following specific fields: Card type (Visa/MC/Discover), number, issuing Bank's name, Account number, account holder's name, expiration date, security code. Each card has a limit on your account. If your purchase exceeds the limit, payment is "Declined", otherwise, "Approved!" for daily smaller transactions. Simulate this CC-use at Wal-Mart or Kroger stores when you buy Cookies.
*/

#include<stdio.h>
#include<string.h>

typedef struct cc {	
	char 	type[10];		//eg. Master Card, Capital One, American Express, paypal, ebay
	int	pnum;
	char 	bank[20];
	int 	anum;		//account number
	char 	name[10];	//account holder's name
	int	exp;		//expiration date
	int	code;
	int 	limit;
} NAME;



int main() {

	NAME bhishan,bishnu,bhishal;
	int	choice;
	double 	amount;


	strcpy(bhishan.type, "Discover");
	bhishan.pnum = 123;
	strcpy(bhishan.bank , "Chase");
	bhishan.anum = 123;
	strcpy(bhishan.name , "bhishan");
	bhishan.exp  = 2017;
	bhishan.code = 123;
	bhishan.limit = 1000;

	strcpy(bishnu.type , "Visa");
	bishnu.pnum = 1234;
	strcpy(bishnu.bank , "OUCU");
	bishnu.anum = 1234;
	strcpy(bishnu.name , "bishnu");
	bishnu.exp  = 2018;
	bishnu.code = 1234;
	bishnu.limit= 2000;
	
	strcpy(bhishal.type , "MC");
	bhishal.pnum = 12345;
	strcpy(bhishal.bank, "Valley");
	bhishal.anum = 12345;
	strcpy(bhishal.name, "bhishal");
	bhishal.exp  = 2019;
	bhishal.code = 12345;
	bhishal.limit = 3000;
	
	printf("\n Codes:\n");
	printf("1: bhishan\n");
	printf("2: bishnu\n");
	printf("3: bhishal\n");
	
	printf("Please choose the code for card holder ==> ");
	scanf ("\n%d", &choice);
	
	printf("Enter the transaction amount ==> $");
	scanf ("\n%lf", &amount);
	
	switch (choice) {
		case 1: if(amount > bhishan.limit)
				printf("Declined!\n");
			else 
				printf("Approved!\n");
			break;			
		case 2: if(amount > bishnu.limit)
				printf("Declined!\n");
			else 
				printf("Approved!\n");
			break;
		case 3: if(amount > bhishal.limit)
				printf("Declined!\n");
			else 
				printf("Approved!\n");
			break;
	}
			
	
printf("\n");	
return 0;
}


	
	
