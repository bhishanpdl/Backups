#include<stdio.h>
float calculate_area(int);
int main()
{
    int radius;
    float area;
    printf("\nEnter the radius of the circle : ");
    scanf("%d",&radius);
    area = calculate_area(radius);
    printf("\nArea of Circle : %f ",area);
    return(0);
}
float calculate_area(int radius)
{
    float areaOfCircle;
    areaOfCircle = 3.14 * radius * radius;
    return(areaOfCircle);
}
