// defining function sort_warranty
void sort_warranty(char mnumber[20][5],double warranty[20],double nwarranty[20],int n)
{
        double temp;
        int i,j;	//local variables

        printf("\n******************************Sorted by Warranty***************************\n");
        printf("%-5s %-13s %-10s %-10s\n\n", "S.N.", "Marina Number", "Warranty", "Non-Warranty") ;

        for(i=0;i<n-1;i++){
           	 for (j=i+1;j<n;j++){
                	if(warranty[i]>warranty[j]){	// sorting dealphabetizing order

                    		temp        = warranty[i];
                            warranty[i] = warranty[j];
                            warranty[j] = temp;
                	}
            	}
	}

	//displaying sorted list
        for (i=0;i<n;i++)
            printf("%-5d %-13s %-10.2f %-10.2f\n",i+1,mnumber[i],warranty[i],nwarranty[i]);
}
