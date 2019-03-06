/* Programmer: Bhishan Poudel
 * Question  : hw 4.2 
 *Topic	:  Programming project 10 from your textbook on page 448 (Chapter 7 Arrays)
 
  The results from the mayor’s race have been reported by each precinct as follows:
		Candidate	Candidate	Candidate	Candidate
Precinct	A	        B		C		D
1		192		48		206		37
2		147		90		312		21
3		186		12		121		38
4		114		21		408		39
5		267		13		382		29
Write a program to do the following:
a. Display the table with appropriate labels for the rows and columns.

b.
 Compute and display the total number of votes received by each candi-
date and the percentage of the total votes cast.

c. If any one candidate received over 50 percent of the votes, the program
should display a message declaring that candidate the winner.

d. If no candidate received 50 percent of the votes, the program should dis-
play a message declaring a runoff between the two candidates receiving
the highest number of votes; the two candidates should be identified by
their letter names.

e. Run the program once with the data shown and once with candidate C
receiving only 108 votes in Precinct 4.
*/
#include<stdio.h>
int find_sum( int x[5], int n);


int main () {
	int a[5] = {192,147,186,114,267};	// sum = 906
	int b[5] = {48,90,12,21,13};		// sum = 184
	int c[5] = {206,312,121,408,382};	// sum = 1429
	int d[5] = {37,21,38,39,29};		// sum = 164
	int x[5];				// grand total = 2683
	double ta,tb,tc,td;	//totals
	double gt;			// grand total
	double pa,pb,pc,pd; 	// percentages of candidates
	
	int i; //counter
	
	
	
	
	int n;
	n = sizeof(a)/sizeof(a[0]);
	//printf("n = %d\n", n);
	
	
	//finding totals of candidates using function
	ta = find_sum(a,n);
	tb = find_sum(b,n);
	tc = find_sum(c,n);
	td = find_sum(d,n);
	
	// finding grand total and percentages
	gt = ta+tb+tc+td;
	
	pa = (ta/gt) * 100.0;
	pb = (tb/gt) * 100.0;
	pc = (tc/gt) * 100.0;
	pd = (td/gt) * 100.0;
	
	//displaying the results
	printf("****************************************************************************\n");
	printf("		Candidate	Candidate	Candidate	Candidate\n");
	printf("Precinct	A	        B		C		D	 \n");
	
	for (i=0;i<5;i++) {
	printf("%-15d %-15d %-15d %-15d %d\n", i+1,a[i],b[i],c[i],d[i]);
	}
	
	printf("----------------------------------------------------------------------\n");
	printf("Total       =   %.0f             %.0f            %.0f		%.0f\n", ta,tb,tc,td);
	printf("Grand total =   %.0f\n", gt);
	printf("Percentage  =   %.2f%%          %.2f%%          %.2f%%         %.2f%%\n", pa,pb,pc,pd);
	
	//winner above 50%
	if (pa>=50)
	printf("\nThe winner is A \n");
	if (pb>=50)
	printf("\nThe winner is B \n");
	if (pc>=50)
	printf("\nThe winner is C \n");
	if (pd>=50)
	printf("\nThe winner is D \n");
	
	//nobody above 50%
	if (!((pa||pb||pc||pd)>=50)) {
	printf("\nThere will be run off between top two candidates\n");
		if (pa>=pb && pa>=pc && pa>=pd)  
		printf("Run off candidate is A\n");
		if (pb>=pa && pb>=pc && pb>=pd)   
		printf("Run off candidate is B\n");
		if (pc>=pb && pc>=pa && pc>=pd)   
		printf("Run off candidate is C\n");
		if (pd>=pb && pd>=pc && pd>=pa)   
		printf("Run off candidate is D\n");
	}
	
	
	
printf("\n");	
return 0;
}
//function find_sum
int find_sum( int x[5], int n){
	
	
	int sum =0;
	int i;
	
	for (i=0; i<n; i++) {
	sum = sum + x[i]; 
	}
	
	//printf("total sum is %d\n", sum);

return (sum);
}
//function greater_fifty
 
		

