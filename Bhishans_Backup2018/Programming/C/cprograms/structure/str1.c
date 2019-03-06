/*6) Write a program to input name of the months and monthly income and
expenditure of an office during last year and
display the records properly. Also calculate the total and average income
and expenditure of the office in last year. */

//terminal: clear; gcc str1.c && ./a.out


#include<stdio.h>
#include<string.h>
#include<stdlib.h>


//defining structure before int main
struct office
{
    char mname[20];
    double inc;
    double exp;
};

//int main function
int main()
{

    struct office off[12];
    double tinc,texp;
    int i;

    //code to input data from the keyboard(only 2 months)
    for(i=0;i<2;i++)
    {

        printf("\n Enter the name of the month ");
        scanf ("%s[^\n]", off[i].mname);
    
        printf("\nEnter the income amount of this month ");
        scanf("%lf",&off[i].inc);
    
        printf("\nEnter the expenditure amount of this month ");
        scanf("%lf",&off[i].exp);
    }

    //code to display
    printf("\nMonth\tIncome\tExpenditure");
    for(i=0;i<2;i++)
    {
        printf("\n%s\t%.2f\t%.2f",off[i].mname,off[i].inc,off[i].exp);
    }
    
    //code to find total
    tinc=0;
    texp=0;
    for(i=0;i<2;i++)
    {
        tinc=tinc+off[i].inc;
        texp=texp+off[i].exp;
    }
    printf("\n\nTotal\tRs. %.2f Rs. %.2f\n\n",tinc,texp);
    
    return 0;

}

