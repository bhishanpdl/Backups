// Author :Bhishan Poudel
// Program: binary search

#include <stdio.h>
 //defining function prototypes
 double binary_search(int n, double array[100]);
 double *sorting(int n, int array[100]);
 
 //main function
int main()
{
   	int 	n;
 	double 	array[100];
 	double	*sarray[100];
   	double 	search;
   	int 	c;	// counter
   	int 	*ptr;
 
 
  	//storing the input
   	printf("Enter number of elements==> ");
   	scanf("%d",&n);
 
   	printf("Enter %d numbers\n", n);
 
   	for (c = 0; c < n; c++){
      		scanf("%lf",&array[c]);
        }
   	//calling the function
   	search = binary_search(n,array);
   	ptr = sorting(n,array);
   	//sort = sorting(n,array);
   	//printf("1st number is %lf\n", &sarray[0]);
      
return 0;
}
 //function binary_search     
double binary_search(int n, double array[100])
{
 	int 	first	= 0;			//local variables 
 	int  	last 	=  n-1;
 	int 	middle 	= (first+last)/2;	//integer division	 
 	double	search;	
 	
   printf("Enter value to search ==> ");
   scanf("%lf", &search); 
  
 //implementing binary search
   while (first <= last) {
      if (array[middle] < search)
         first = middle + 1;    
      else if (array[middle] == search) {
         printf("%lf found at location %d.\n", search, middle+1);
         break;
      }
      else
         last = middle - 1;
 
      middle = (first + last)/2;
   }
   if (first > last)
      printf("Not found! %lf is not present in the list.\n", search);
 
   return (search);   
}

//function sorting
double *sorting(int n, int array[100]){

	int i,j;
	double temp;
	static double sarray[100];
	

	for (i=0; i<n-1; i++)
	{
		for (j=i+1; j<n; j++)
		{
			if (array[i]> array[j])		
			{
				temp  = array[i]; 		
				array[i] = array[j];	
				array[j] = temp;		
			}
		}
	}
	printf("array[0] is =%.2f\n", array[0]);
	
return sarray;
}
