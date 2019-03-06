// defining function sort_name
void sort_name(char mnumber[20][5],double warranty[20],double nwarranty[20],int n)
{
        char temp[20];
        int i,j;	//local variables

        printf("\n******************************Sorted by Name******************************\n");
        printf("%-5s %-13s %-10s %-10s\n\n", "S.N.", "Marina Number", "Warranty", "Non-Warranty") ;

        for(i=0;i<n-1;i++){
           	 for (j=i+1;j<n;j++){
                	if(strcmp(mnumber[i],mnumber[j])<0){	// sorting dealphabetizing order

                    		strcpy(temp,mnumber[i]);
                    	strcpy(mnumber[i],mnumber[j]);
                    	strcpy(mnumber[j],temp);
                	}
            	}
	}

	//displaying sorted list
        for (i=0;i<n;i++)
            printf("%-5d %-13s %-10.2f %-10.2f\n",i+1,mnumber[i],warranty[i],nwarranty[i]);
}
