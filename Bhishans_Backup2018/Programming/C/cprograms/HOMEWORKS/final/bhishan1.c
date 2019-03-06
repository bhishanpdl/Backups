//author: bhishan poudel
//qn:1

#include<stdio.h>

//prototypes
double area(double l, double b, double x);
double volume(double l, double b, double x);

int main(){

    double l,b,x;
    double temp;
    double area1;
    double volume1;

    printf("Enter the length and breadth of the box\n");
    scanf ("%lf %lf", &l, &b);

    if(l>b)
        temp =l;

    else
        temp=b;

    printf("\nEnter the height of the box:==> ");
    scanf ("%lf", &x);

    if (x>temp){
        printf("Please enter height less %.2f==> ", temp);
        scanf("%lf", &x);
    }

    printf("\nheight of box = %.2f  ", x);
    area1 = area(l,b,x);
    volume1= volume(l,b,x);

return 0;
}
//function area
double area(double l, double b, double x){
        double area;
        area = ((l+2*x)*(b+2*x)) - 4*(x*x);
        printf("\n\nThe area= %.2f\n", area);

return (area);
}
//function volume
double volume(double l, double b, double x){
        double volume;
        volume = l*b*x;
        printf("The volume = %.2f\n", volume);


return (volume);
}
