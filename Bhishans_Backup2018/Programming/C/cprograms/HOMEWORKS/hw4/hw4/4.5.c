/* Programmer	: Bhishan Poudel
 * Question  	: hw 4.5
 *Topic		: Classic Grade book program
 */
 
 /*Before writing program we make some assumption as following :

Maximum total marks is 500.     
  Student_percentage         Grades
     >=80                        A
     >=60                        B
     >=50                        C
     >=40                        D
     <40                         F
  
  */
  
#include<stdio.h>
#include<string.h>


struct student
{
  char name[20];
  int marks;
  double per;
  char grade[5];
};

struct student s[20];

void grading_criteria(void);

int main(){
printf("\n");
	int i;
	int n;
	
	grading_criteria();
	
	printf("How many student's grades you want to store? ==> ");
	scanf(" %d", &n);
	
	
	//storing grades of f student into the structure
 	for(i=1; i<=n; i++){
 	
  		printf("%d: Enter student name : ",i);
  		scanf("%s", s[i].name);
  		printf("%d: Enter student obtained marks = ",i);
  		scanf("%d",&s[i].marks);
  
 
 	}
 	
 	//finding percentage
 	for(i=1; i<=n; i++)
   	s[i].per=s[i].marks * 1.0/5.0;
   	
   	//finding letter grade   	
 	for(i=1; i<=n; i++){
 	
  		if(s[i].per>=80)
    			strcpy(s[i].grade,"A");
  		else if(s[i].per>=60)
    			strcpy(s[i].grade,"B");
  		else if(s[i].per>=50)
    			strcpy(s[i].grade,"C");
  		else if(s[i].per>=40)
    			strcpy(s[i].grade,"D");
  		else
    			strcpy(s[i].grade,"F");
 	}
 	
 	//displaying grades
 	printf("\n*************************************************\n");
 	printf("S.N.  Student Marks   Percentage    Grade\n");
 	
	 for(i=1; i<=n; i++)
  	printf("\n%-4d  %-8s %-6d %-12.2f  %-8s ",i,s[i].name,s[i].marks,s[i].per,s[i].grade);
  	printf("\n*************************************************\n");

printf("\n\n");
 return 0;
}
 
//function grading_criteria
void grading_criteria(void) {

	printf("Grading Criteria:\n");
	printf("Maximum total marks is 500\n");
	printf("*************************************************\n");
	printf("Student_percentage         Grades\n");
	printf(">=80                        A\n");
	printf(">=60                        B\n");
	printf(">=50                        C\n");
	printf(">=40                        D\n");
	printf("<40                         F\n");
	printf("*************************************************\n\n");
	
}
