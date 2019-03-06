/* C program to read N names and numbers and sort them alphabetically. */
//***********************************************************

#include<stdio.h>
#include<string.h>

int main()
{
printf("************************************************************\n");

	char 	name[10][8];
	long int num[10]; 
	char 	temp[8];
	int 	i,j;		// counters
	int 	n=0;		// counter for while loop of file.
	
	FILE *fp;
	fp = fopen("sortingfile.txt", "r");
	
	//storing input from file using while loop
	while(!feof(fp)) {
	  	fscanf(fp, "%s[^\n]", temp);		//no & for scanning string
	  	strcpy(name[n], temp);
	  	fscanf(fp, "%ld", &temp);		//& for scanning numbers
	  	strcpy(num[n], temp);
	  	n++;
	}
	n =  n-1;
	
	
	// displaying the given input
	printf("Data before sorting is:\n");
	printf("S.N.\tName\t Number\n");
	printf("************************************************************************\n");

	for(i=0;i<n;i++) {
		printf("%d\t  %s\t %ld  ",i+1,name[i],num[i]);
	}
	
	printf("**********************************************************************\n");
		
	//implementing sorting strings 	(mnemonic: FOR FOR IF)
	for (i=0; i<n-1; i++)
	for (j=i+1; j<n; j++){
	  if (strcmp(name[i], name[j])>0) {			// strcpy(target,source)>0 means string1>string2. eg. 5>3 or t>s
				strcpy(temp, name[i]); 		// temp    = name[i]
				strcpy(name[i], name[j]);	// name[i] = name[j]
				strcpy(name[j], temp);		// name[j] = temp
	  }
	}
	
		
	// display sorted names
	printf("\n---------------------------------------------------\n");
	printf(" Name\tNumber\n");
	printf("-----------------------------------------------------\n");
	
	for (i=0; i<n; i++)
	{
		printf("%s\t %ld\n", name[i], num[i]);
	}
	printf("----------------------------------------------------\n");
		
printf("************************************************************\n");
return 0;
}
