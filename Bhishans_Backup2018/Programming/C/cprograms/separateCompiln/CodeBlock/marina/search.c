// defining function search

void search(char mnumber[20][5],double warranty[20],double nwarranty[20],int n)
{
	int 	c = 0;	// counter
	char 	key[20];	// string to search
	char 	option[10];	// option y or n

        do
        {
        	printf("Enter the Marina number you want to search: =>  ");
        	scanf("%s",key);

        	int found=0;
        	for (c=0;c<n;c++){
            		if(strcasecmp(mnumber[c],key)==0)	{
            			printf("Position 	= %d\n",c+1);
            			printf("Warranty 	= %7.2f\n",warranty[c]);
            			printf("Non Warranty 	= %7.2f\n",nwarranty[c]);
            			printf("Do you want to search again (y/n)? => ");
            			scanf("\n%s",option);
            			found++;
        		}
        	}

        	if(found==0) {
                	printf("\nSorry, the number is not found!\n");
        		printf("Do you want to search again (y/n)? => ");
            		scanf("\n%s",option);
            	}



		if (!((strcasecmp(option,"y")==0) || (strcasecmp(option,"Y")==0) || (strcasecmp(option,"n")==0) || (strcasecmp(option,"N")==0))){
    			printf("Invalid code!!\n");
    			printf("Do you want to search again (y/n)? => ");
            		scanf("\n%s",option);

    		 }


	}

	while(!((strcasecmp(option,"n")==0) || (strcasecmp(option,"n")==0)));

}
