/* Programmer: Bhishan Poudel
 * Question  : hw 4.3 
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
 double calc_fees(int hours, double rate);
 double calc_tuition(char state);
 double displayTotalCost(double tution, double fees);
 
 //main function
 int main()
 {
 printf("**********************************************\n");
 
 	int hours;
 	int state;
 	
 	printf("Enter credit hour =>  ");
 	scanf ("%d", &hours);
 	printf("In or out state codes:\n");
 	printf("1. In state\");
 	printf("2. Out of state\n");
 	printf("Enter the in or out state code (1/2) =>  );
 	scanf ("%d", &state);
 	
 		fees = calc_fees(int hours, double rate);
 		tuition = calc_tuition(char state);
 		
 		displayTotalCost(double tution, double fees);
 		 
 printf("************End of Program********************\n");	
 return 0;
 }
 //End of main function
 //function calc_fees
 
  double calc_fees(int hours)
  {
  	double rate;
  	double fees;
  	
  	if (hours >= 15)
  	{
  		fees = hour * 44.50;
  	
  return (fees);
  }
  
  //function calc_tuition
  
  double calc_tuition(char state)
  {
  
  return (tuition);
  }
  
  //function displayTotalCost
  double displayTotalCost(double tution, double fees)
  {
  
  return (total);
  }
  //End of function displayTotalCost
  
 
