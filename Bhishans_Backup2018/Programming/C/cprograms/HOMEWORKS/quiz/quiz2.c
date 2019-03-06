// author: bhishan poudel
// qn: quiz2.c

#include<stdio.h>

struct state
{
	char st[10];
    	int zipcode;
};
 
typedef struct state NAME;
NAME state[10], temp[10];

void search (int i);

//int main
int main()
	
{

    	int n=0, k,j;

	FILE *fp;

	fp = fopen("state.txt","r");
	
	
	while(!feof(fp)) 
	{
        fscanf(fp, "%s[^\n]",state[n].st);
        fscanf(fp, "%d", &state[n].zipcode);
		
        n= n+1;
	}	
    n= n-1;
    
	fclose(fp);
    	search(k);

    return 0;
}
//function search

void search (int i)
{
  
    char temp[20];
    int found = 0, n;
    
                printf("Enter the state to search\n");
                scanf("%s",temp);
                for (n=0;n<i;n=n+1)
                {
                    if (strcasecmp (state[n].st,temp)==0)
                    {
                        printf("\nstate:\t%s\n",state[n].st);
                        printf("\nzip code:\t%d\n",state[n].zipcode);
                        
                        found=1;
                    }
                }
                
                if(found==0)
                    printf("state not found\n");
               
        
}


