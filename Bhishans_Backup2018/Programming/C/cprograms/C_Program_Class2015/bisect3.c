//Bisection routine......
//To find roots of polynomial equations...

#include <stdio.h>
#include <math.h>

double F(double x)             //define the function..........
{
    return(pow(x,2)+ x -12);       //This return the value of the function
}

int main()
{
    printf("This program illustrates the bisection method in C\n");
    printf("x^3 + 3*x - 5 = 0\n");

    double x0,x1;

    printf("Enter the first approximation to the root\n");
    scanf("%lf",&x0);
    printf("Enter the second approximation to the root\n");
    scanf("%lf",&x1);

    int iter;

    printf("Enter the number of iterations you want to perform\n");
    scanf("%d",&iter);

    int ctr=1;
    double l1=x0;
    double l2=x1;
    double r,f1,f2,f3;

    //We check if the initail approximations are the root or not
    if(F(l1)==0)
    r=l1;
    else
    if(F(l2)==0)
    r=l2;
    else
    {
    while (ctr<=iter)
    {//this is an implementation of the algorithm mentioned above
        f1=F(l1);
        r=(l1+l2)/2.0;
        f2=F(r);
        f3=F(l2);

        if(f2 == 0)
        {
            r=f2;
            break;
        }
        printf("The root after %d iteration is %lf\n",ctr,r);

        if(f1*f2<0)
        l2=r;
        else
        if(f2*f3<0)
        l1=r;
        ctr++;
    } // end of while..........
    } // end of else.......

    printf("\nThe approximation to the root is %lf",r);
    getch();
    return 0;
}

//http://www.thelearningpoint.net/computer-science/c-program-numerical-computing---the-bisection-method


