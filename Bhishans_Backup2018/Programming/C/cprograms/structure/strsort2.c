/* Author: Bhishan Poudel
  
*/

#include<stdio.h>
#include<string.h>	//for strcmp for sorting
#include<stdlib.h>	//for stderr (when input file is not present)

//defining structure before the int main
struct marina { 
	char 	mnumber[20];
	
	double  warranty;
	
	
	double 	nwarranty;
};
typedef struct marina NAME;
NAME m[10], temp[10];	//we have 10 m each having titles etc. and also 10 temps to compare

//function prototypes
void display_input(int n);
void sort_title(int n);
void sort_nwarranty(int n);


 
//main function
int main() {
printf("\n");
	FILE *fp;
	fp = fopen("marina.txt", "r");
	
	int code;	// to sort by mnumber or nwarranty
	int n=0;
	int temp1; 	// for warranty strcpy
	long int temp2;	// for nwarranty strcpy
	
	if (fp == NULL) {
        	fprintf(stderr, "Could not open file\n");	// if we use printf("No files"), we will get segmentation fault.
        	exit(-1);
        }
	
	//storing input from file into  the structure
	while(!feof(fp)){
		fscanf(fp, "%s[^\n]", m[n].mnumber);	//scan doesnot need & for string
		
		fscanf(fp, "%lf", &m[n].warranty);	//scan needs & for numbers
		
		
		fscanf(fp, "%lf", &m[n].nwarranty);
		
		n=n+1;					// if n=0 forgot, we get Segmentation fault
	}
	fclose(fp);
	n=n-1;
	
	//displaying input by calling the function
	display_input(n);
	
	//choosing sort by mnumber or sort by nwarranty
	printf("MENU:\n");
	printf("1 : sort by mnumber \n");
	printf("2 : sort by nwarranty)\n");
	printf("3 : exit\n");
	printf("Enter the code => ");
	scanf("%d", &code);
	
	switch(code)				//switch variable should be number or character not a string
	{
    
    		case 1:	sort_title(n);		// calling the function
        		break;

   		case 2: sort_nwarranty(n);
        		break;
    
    		case 3: printf("Thank You for using the program!\n");
    		
    		default: 
    			printf("Sorry! you have entered the wrong code\n");
	}
	
printf("\n");	
return 0;
}  
//function display_input
void display_input(int n) {
	int k=0;
		

	printf("\n*************************************Input Data***************************************\n\n");
        printf("%-12s  %-7s %-14s\n\n","mnumber",  "warranty", "nwarranty");
        
        for(k=0; k<n; k=k+1){
        printf("%-12s  %-7.2f  %-14.2f\n",m[k].mnumber,m[k].warranty,m[k].nwarranty);
        }
         printf("*******************************************************************************************\n");
} 
//function sort_title
 void sort_title(int n)
 {
        NAME	temp;
        int 	i,j,k;
        
        printf("\n*************************************Sorted by mnumber***************************************\n\n");
        printf("%-12s %-7s  %-14s\n\n","mnumber",  "warranty", "nwarranty");
        
        for(i=0;i<n-1;i++){
        for (j=i+1;j<n;j++){			
            if (strcmp(m[i].mnumber,m[j].mnumber)>0){ 	// mnumber is stirng so we use string compare	
                
                temp 	= m[i];
                m[i]	= m[j];
                m[j]	= temp;
            }
        }
	}
	//displaying sorted list
        for(k=0; k<n; k=k+1){
        printf("%-12s  %-7.2f  %-14.2f\n",m[k].mnumber,m[k].warranty,m[k].nwarranty);
        }
        printf("************************************************************************************\n");
}
//function sort_isbn
void sort_nwarranty(int n)
{
        NAME	temp;
        int 	i,j,k;
        
         printf("\n*************************************Sorted by nwarranty***************************************\n\n");
         printf("%-12s %-7s  %-14s\n\n","mnumber", "warranty","nwarranty"); 
        
        	
        
        for(i=0;i<n-1;i++){		
        for (j=i+1;j<n;j++){			
            if (m[i].nwarranty > m[j].nwarranty){		// nwarranty is long integer we directly compare
                temp 	= m[i];
                m[i]=m[j];
                m[j]=temp;
            }
        }
	}


	//displaying sorted list
        for(k=0; k<n; k=k+1){
        printf("%-12s %-7.2f  %-14.2f\n",m[k].mnumber,m[k].warranty,m[k].nwarranty);
        }
      printf("*******************************************************************************************\n");
}



