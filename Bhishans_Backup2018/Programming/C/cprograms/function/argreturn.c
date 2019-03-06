/*Example program for with arguments & with return value:

 In this program, integer, array and string are passed as arguments to the function. 
 The return type of this function is “int” and value of the   variable “a” is 
 returned from the function. The values for array and string are modified inside the function itself.
 */

#include<stdio.h>
#include<string.h>

int function(int, int[], char[]);

int main()
{
      int i, a = 20;
      int arr[5] = {10,20,30,40,50};  
      char str[30] = "\"fresh2refresh\"";

      printf("    ***values before modification***\n");  
      printf("value of a is %d\n",a);  

      for (i=0;i<5;i++)
      {
         // Accessing each variable
         printf("value of arr[%d] is %d\n",i,arr[i]);  
      }
      printf("value of str is %s\n",str); 

      printf("\n    ***values after modification***\n"); 

      a= function(a, &arr[0], &str[0]);

      printf("value of a is %d\n",a);  

      for (i=0;i<5;i++)
      {
         // Accessing each variable
         printf("value of arr[%d] is %d\n",i,arr[i]);  
      }
      printf("value of str is %s\n",str); 

      return 0;
}

int function(int a, int *arr, char *str)
{
    int i;

    a = a+20;
    arr[0] = arr[0]+50;
    arr[1] = arr[1]+50;
    arr[2] = arr[2]+50;
    arr[3] = arr[3]+50;
    arr[4] = arr[4]+50;
    strcpy(str,"\"modified string\"");

    return a;

}
/*
Output:
***values before modification***
value of a is 20
value of arr[0] is 10
value of arr[1] is 20
value of arr[2] is 30
value of arr[3] is 40
value of arr[4] is 50
value of str is “fresh2refresh”***values after modification***
value of a is 40
value of arr[0] is 60
value of arr[1] is 70
value of arr[2] is 80
value of arr[3] is 90
value of arr[4] is 100
value of str is “modified string”

*/
