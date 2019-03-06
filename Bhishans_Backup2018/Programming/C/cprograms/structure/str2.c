//topic: structure
//ref  : http://www.c4learn.com/c-programming/c-pointer-array-structure/
//terminal: clear; gcc str2.c && ./a.out


#include<stdio.h>
#include<stdlib.h>

struct stud
    {
    int roll;
    char name[10];
    }*ptr[10];

int main()
{
    int i;

    //storing details using keyboard
    printf("Enter the Student Details : ");
    for(i=0;i<3;i++)
    {
        ptr[i] = (struct stud *) malloc(sizeof(struct stud));

        printf("\nEnter the Roll Number : "); //eg. 1,2,3
        scanf("%d",&ptr[i]->roll);
        printf("\nEnter the Name : ");//e.g. ram,sam,dam
        scanf("%s",ptr[i]->name);
    }
    
    
    //printing stored details
    printf("\nStudent Details are : ");

    for(i=0;i<3;i++)
    {
        printf("\nRoll Number : %d",ptr[i]->roll);
        printf("\nName : %s",ptr[i]->name);
    }

return(0);
}


