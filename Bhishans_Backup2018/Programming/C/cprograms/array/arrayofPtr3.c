/* 	program : array pointer
 *	author  : Bhishan Poudel
 *
 */

#include<stdio.h>
#include<string.h>

int main(void)
{
    char arr[4];// for accommodating 3 characters and one null '\0' byte.
    char *ptr = "abc"; //a string containing 'a', 'b', 'c', '\0' 

    memset(arr, '\0', sizeof(arr)); //reset all the bytes so that none of the byte contains any junk value
    strncpy(arr,ptr,sizeof("abc")); // Copy the string "abc" into the array arr 

    printf("\n %s \n",arr); //print the array as string 

    arr[0] = 'p'; // change the first character in the array 

    printf("\n %s \n",arr);//again print the array as string
    return 0;
}
