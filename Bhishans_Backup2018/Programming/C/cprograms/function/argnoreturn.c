/*Example program for with arguments & without return value:

   In this program, integer, array and string are passed as arguments to the function. 
   The return type of this function is “void” and no values 
   can be returned from the function. All the values of integer, 
   array and string are manipulated and displayed inside the function itself.
*/
#include<stdio.h>

void function(int, int[], char[]);

int main()
{
      int a = 20;
      int arr[5] = {10,20,30,40,50};  
      char str[30] = "\"fresh2refresh\"";

      function(a, &arr[0], &str[0]);
      return 0;
}
//*****************************************

void function(int a, int *arr, char *str)
{
    int i;

    printf("value of a is %d\n\n",a);  

      for (i=0;i<5;i++)
      {
         // Accessing each variable
         printf("value of arr[%d] is %d\n",i,arr[i]);  
      }
    printf("\nvalue of str is %s\n",str);  
}
//*******************output
/*


value of a is 20

value of arr[0] is 10
value of arr[1] is 20
value of arr[2] is 30
value of arr[3] is 40
value of arr[4] is 50

value of str is “fresh2refresh”

*/

