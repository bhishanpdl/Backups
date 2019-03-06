//unix: clear; gcc sineSeries.c -lm && ./a.out    
    
# include <stdio.h>    
# include <math.h>   
int main()   
{   
     int i, n ;   
     float x, val, sum, t ;
     
/*     printf("Enter the value for x : ") ;   */
/*     scanf("%f", &x) ;   */
/*     printf("\nEnter the value for n : ") ;   */
/*     scanf("%d", &n) ;*/

      x = 30; // degree
      n = 10; // expansion terms
     
      val = x ;   
      x = x * 3.14159 / 180 ; // x radian  
      t = x ;   
      sum = x ;  
     for(i = 1 ; i < n + 1 ; i++)   
     {   
          t = (t * pow((double) (-1), (double) (2 * i - 1)) *   
          x * x) / (2 * i * (2 * i + 1)) ;   
          sum = sum + t ;   
     }   
     
     printf("\nSine value of %.0f degree is : %10.6f\n", val, sum) ;
       
return 0;     
}   
