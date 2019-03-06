/* Programmer: Bhishan Poudel
 * Question  : hw 4.8 
 * Topic     : 
 A small private college offers online courses 
 and wants you to develop a C program that calculates total tuition
 and fees for their students.
  
 User will input the number of hours;
 the program should calculate the total cost.
  
 For full-times students taking greater than 15 hours of courses,
 the fees per credit hour is $44.50. 
 
 For part-time students taking 15 hours or less, 
 the fees per credit hour is $65.50
  
 ln-state tution is $1450.00 and Out-of-state tution is $2476.80
 
 Modularize the program!
 
 fees = Calculate(hours, rate)
 tuition = Calc_Tuition(T_rate, state)
 displayTotalCost = tution + fees  
 */ 
 
 #include<stdio.h>
 // function prototypes
 double calc_fees(int hours);
 double calc_tuition(char state);
 
 
 //main function
 int main()
 {
 printf("**********************************************\n");
 
 	int hours;
 	int state;
 	double fees1;
 	double tuition1;
 	double tc;	// total cost
 	
 	printf("Enter credit hour =>  ");
 	scanf ("%d", &hours);
 	printf("\nCodes:\n");
 	printf("1. In state\n");
 	printf("2. Out of state\n");
 	printf("Enter code (1 or 2) => " );
 	scanf ("%d", &state);
 	
 		fees1 	= calc_fees(hours);
 		tuition1 = calc_tuition(state);
 		
 		tc 	= fees1+tuition1;
 		
 		printf("The total cost is = $%.2f \n\n", tc);
 
 return 0;
 }
 //End of main function
 //function calc_fees
 
  double calc_fees(int hours)
  {
  	double rate;
  	double fees;
  	
  	if (hours >= 15){
  	
  		fees = hours * 44.50;
  		printf("\nFor full time students($44.50 per hour): taken hours = %d  \nfees = $%.2f\n", hours, fees);
  	}
  	if (hours<15){
  		fees = hours * 65.50;
  		printf("\nFor part time students($65.50 per hour):  taken hours = %d  \nfees = $%.2f\n", hours, fees);
  	} 
  	
  return (fees);
  }
  
  //function calc_tuition
  
  double calc_tuition(char state)
  {
  	double tuition;
  	
  	if (state == 1){
  	
  	tuition	=1450.00;
  	printf("For in state students tuition cost = $1450.00\n");
  	}
  	
  	else if (state == 2){
  	
  	tuition	= 2476.80;
  	printf("For out of state students tution cost = $2476.80\n");
  	}
  	else
  	printf("Wrong code\n");
  
  return (tuition);
  } 
  
 
