/*  hw 2.6
bicycle salesperson is offered a choice of wage plans: 
(1) a straight salary of $300 per week; 
(2) $3.50 per hour for 40 hours plus a 10% commission on sales; 
(3) a straight 15% commission on sales with no other salary.
 Develop a C program that takes as input the salesperson’s expected weekly sales 
 and outputs the wages paid under each plan as well as announcing the best-paying plan.
 */
 
 #include<stdio.h>

 
 int main()
 {
 	float x,t1,t2,t3,m;
 	
 	printf("Enter the expected weekly sales\n");
 	scanf ("%f",&x);
 	
 	t1 = 300;
 	t2 = 3.5*40 + (x/10.0);
 	t3 = 15*x/100.0;
 	
 	printf("The first  plan gives total amount of $%.2f\n",t1);
 	printf("The second plan gives total amount of $%.2f\n",t2);
 	printf("The third  plan gives total amount of $%.2f\n",t3);
 	
 	if (t1==t2==t3)
      		printf("All the plans are same\n");
      	else if (t1==t2)
      		printf("First and second are same and better than third plan\n"); 	// e.g. 1600
      	else if (t2==t3)
      		printf("Second and third plans are same and better than first\n");  	// e.g. 2800
      	else if (t1==t3)
      		printf("First and third plan are same but better plan is second plan\n"); 	// eg. 2000 first=third=300 but second=340
 	else if(t1>=t2 && t1>=t3)
         	printf("The best-paying plan is first plan.\n");
      	else if(t2>=t1 && t2>=t3)
         	printf("The best-paying plan is second plan\n");
      	else if (t3>=t1 && t3>=t2)
         	printf("The best-paying plan is third plan\n");
      	
 	 
 return 0;
 }
 	
 	
 	
 	
 	
 	
 
