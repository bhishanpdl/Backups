/* hw 2.8 
Develop a program that computes the cost of postage on a first class letter 
according in the following rate schedule: 
44 cents for the first ounce or fraction of an ounce. 
15 cents for each additional half ounce, plus $5.00 service charge if the customer desires a special delivery.
*/

/* example 5.1 ounces with with special delivery 
  total = 44 + 4*2*15 + 1*15 + 5;
  for 5.7 ounces with special delivery
  total = 44 + 4*2*15 + 2*15 + 5;
  inputs are ounces and special delivery y or n; 
  output is total cost
  
 */
 
 #include<stdio.h>
 #include<math.h>
 
 int main ()
 {
 	int integer;
 	float ounces,total,decimal,dollar;
 	char choice,y,n;
 	
 	
 	printf("Please enter the weight of the parcel in ounces\n");
 	scanf ("%f", &ounces);
 	
 	printf("Would you like to request for special delivery?\n");
  	printf("if yes press y,\nif no please press n\t");
  	scanf (" %c", &choice);					// if there is no space before %c it will not work properly.( Hanly page 97).
 	
  	integer = floor (ounces);
  	decimal = ounces- integer;
  	
  	if (ounces <=1 && choice == 'n' ) {
  		printf("The total due is 44 cents\n"); }
  		
  	else if (ounces <=1 && choice == 'y') {
  		printf("Including special delivery charge $5, ");			// $5 is added for special delivery
  		printf("the total due is $5.44\n"); }
  		
  	else if (ounces >1 && choice == 'n' && decimal<=.5 && decimal >0) {		// case like 5.1
  		total = 44 + (integer-1)*2*15 + 1*15;
  		dollar= total/100.0;
  		printf("The total due is $ %.2f\n",dollar); }
  	else if (ounces >1 && choice == 'n' && decimal<=.5 && decimal == 0) {		// case like 5.0
  		total = 44 + (integer-1)*2*15 + 0*15;
  		dollar= total/100.0;
  		printf("The total due is $ %.2f\n",dollar); }
  		 
 	else if (ounces >1 && choice == 'n' && decimal >.5) {				// case like 5.6
  		total = 44 + (integer-1)*2*15 + 2*15;
  		dollar= total/100.0;
  		printf("The total due is $%.2f \n",dollar); }
  		
 	else if (ounces >1 && choice == 'y' && decimal <=.5 && decimal >0) {
  		total = 44 + (integer-1)*2*15 + 1*15 + 500;
  		dollar= total/100.0;
  		printf("Including special delivery cost of $5, ");
  		printf("the total due is $%.2f\n",dollar); }
  	else if (ounces >1 && choice == 'y' && decimal <=.5 && decimal == 0) {
  		total = 44 + (integer-1)*2*15 + 0*15 + 500;
  		dollar= total/100.0;
  		printf("Including special delivery cost of $5, ");
  		printf("the total due is $%.2f\n",dollar); }
  		
  	else if (ounces >1 && choice == 'y' && decimal >.5) {
  		total = 44 + (integer-1)*2*15 + 2*15 + 500;
  		dollar= total/100.0;
  		printf("Including special delivery cost $5, ");
  		printf("the total due is $ %.2f\n",dollar); }
  	else 
  		printf("Please enter the correct values");		// when we press alphabet other than y or n this will be displayed
  		printf("\n\n");
  	
  	 	
return 0;
}
 
