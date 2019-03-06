/* Author: Bhishan Poudel
   Question:4

Simulate an ATM or Banking transactions (use Arrays and loops) Desired Features:
 User enters 4‐digit PIN to initiate ATM transaction. Maximum 4 tries to re‐enter PIN, otherwise, “transaction ABORTED!”
 To continue, Options – (D)eposit, (W)ithdraw or (P)rint balance only!
 If deposit, update balance to reflect deposit amount to opening balance
 If withdraw, more than balance in account, prompt user to re‐enter less amount to
 withdraw, else, ABORT withdrawal
 If withdrawing lesser amount than existing balance, update after withdrawal
 If user want “Print Only” no change to existing balance
*/

#include<stdio.h>
#define PIN 1234

int current_balance(int balance);

int main ()
{
printf("\n");

	int 	pin,n;
	int  	balance;
	int 	c=0;
	char 	choice;
	
	printf("Please enter your PIN number ==> ");
	scanf ("%d", &pin);
	
	if (pin != PIN){  			// when wrong pin number, we can retry upto 4 times
	
		 for (c=0; c<3; c++) { 
		 
	    		printf("Please enter the PIN code again!==> ");
	    		scanf("%d", &pin);
	    
	      		if (PIN == pin)			// when pin code is true, loop is broken
	      		break;
	  	} 	  
	} 
	//when we enter 4 wrong pin codes we get this warning
	if (c==3) 
		printf("You have entered wrong PIN number four times, transaction aborted\n");
	
	// when pin is true we continue	
	if (PIN == pin) {
		printf("Enter your opening balance ==> $");
	  	scanf("%d", &balance);
		  	
	  	balance = current_balance(balance);		// calling the function	
	}	
printf("\n");
return 0;
}
//end of main function
//defining function current_balance

int current_balance( int balance)
{
	char option,choice;  	
	int deposit =0;
	int newbalance=0 ;
	int withdraw = 0;	
	
	do
    	{
		printf("\nFor deposit press d, for withdraw press w, for printing the balance press p ==> "); 
		scanf ("\n%c", &option); 
	      	
	      	if (!(option == 'p' || option == 'P' || option == 'd' || option == 'D' || option == 'w' || option == 'W' )) {
	      		printf("Wrong code!\n");
	      		printf("Please press p or w or d\n");
	      	}
	      
		if (option == 'p' || option == 'P') { 
	  		printf("\nYour current balance is $%d\n", balance); 
			balance = newbalance;
		}
	      
		if (option == 'd' || option == 'D') {
	       		printf("\nEnter the amount you want to deposit ==> $");
	      		scanf (" %d", &deposit); 
	          
	       		newbalance = balance + deposit;
	         
	        	printf("\nYour current balance is $%d\n", newbalance); 
	        	balance = newbalance;
		} 
	       
		if (option == 'w' || option == 'W') {
	        	printf("\nEnter the amount you want to withdraw ==>  $\n");
	       		scanf (" %d", &withdraw); 
	        	
	        	if (withdraw > balance) {
	          		printf("Please enter the withdraw amount less than your current balance ($%d) ==> ", balance);
	           		scanf (" %d", &withdraw);
	         	}
	         
			newbalance = balance - withdraw;
	         
			printf("\nYour current balance is $%d\n", newbalance); 
		
			balance = newbalance;	
			
	         
		} 
		printf("\nDo you want another transaction (y/n)? ==> ");
		scanf (" %c", &choice);
		
		if (!(choice == 'y' || choice == 'Y' || choice == 'n' || choice == 'N')){
			printf("Wrong code!\n");
			printf("Please press y or n \n");
			printf("\nDo you want another transaction (y/n)? ==> ");
			scanf (" %c", &choice);
		}
		
	}
	
    while(choice == 'y' || choice == 'Y');
return (newbalance);
}
	

