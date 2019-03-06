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
void sort(int n);
void search(int n);


 
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
	printf("1 : sort \n");
	printf("2 : search\n");
	printf("3 : exit\n");
	printf("Enter the code => ");
	scanf("%d", &code);
	
	if (code !=1 && code !=2 && code!=3){
		printf("Enter the correct code => ");
		scanf("%d", &code);
	}
	
	printf("\n");
	
	switch(code)				//switch variable should be number or character not a string
	{
    
    		case 1:	sort(n);		// calling the function
        		break;

   		case 2: search(n);
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
		

	printf("\n****************Input Data*********************\n\n");
        printf("%-8s %-12s  %-7s %-14s\n\n","S.N.", "mnumber",  "warranty", "nwarranty");
        
        for(k=0; k<n; k=k+1){
        printf("%-8d %-12s  %-7.2f  %-14.2f\n",k+1, m[k].mnumber,m[k].warranty,m[k].nwarranty);
        }
         printf("******************************************************\n");
} 
//function sort_title
 void sort(int n)
 {
        NAME	temp;
        int 	i,j,k;
        
        printf("\n*********************Sorted by mnumber*****************\n\n");
        printf("%-8s %-12s %-7s  %-14s\n\n","S.N.", "mnumber", "warranty", "nwarranty");
        
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
        printf("%-8d %-12s  %-7.2f  %-14.2f\n", k+1, m[k].mnumber,m[k].warranty,m[k].nwarranty);
        }
        printf("************************************************************\n");
}

//function search_mnumber
void search(int n){
	
	 int 	i,j,k;
        

	
	char 	key[20];	// string to search
	char 	option[10];	// option y or n

        do{
        	printf("Enter your search: =>  ");	
        	scanf("%s",key);
        	
        	int found=0;
        			
        	for (i=0;i<n;i++){
        	
        			if(strcasecmp(m[i].mnumber,key)==0){
        	
            			printf("The %s is found at position: %d\n",key,i+1);
            			
            			printf("\nDo you want to search again (y/n)? => ");
            			scanf("\n%s",option);
            			found++;
        		}
        	}
        	
        	if(found==0) {
                	printf("Sorry, %s is not found!\n", key);
        		printf("\nDo you want to search again (y/n)? => ");
            		scanf("\n%s",option);
            	}
        	
		
    		
		if (!((strcasecmp(option,"y")==0) || (strcasecmp(option,"Y")==0) || (strcasecmp(option,"n")==0) || (strcasecmp(option,"N")==0))){
    			printf("Invalid code!!\n");
    			printf("\nDo you want to search again (y/n)? => ");
            		scanf("\n%s",option);
    				
    		 }
    		 
    		 
		if((strcasecmp(option,"n")==0) || (strcasecmp(option,"N")==0)){
			printf("Thank You for using the program.\n");
			printf("Have a nice day!\n");
		}

	}
	
	while(!((strcasecmp(option,"n")==0) || (strcasecmp(option,"n")==0)));
    	
}
 
	
