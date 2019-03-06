//topic   :
//ref     : http://www.c4learn.com/c-programming/c-pointer-to-structures/
//terminal: clear; gcc str11.c && ./a.out

#include <stdio.h>
int main(int argc, char *argv[])
{

    struct student_database {
    char name[10];
    int roll;
    int marks;
    }stud1 = {"Pritesh",90,90};

    struct student_database *ptr;
    ptr = &stud1;

    printf("Roll Number : %d\n",(*ptr).roll);
    printf("Marks of Student : %d\n",(*ptr).marks);

return 0;
}
