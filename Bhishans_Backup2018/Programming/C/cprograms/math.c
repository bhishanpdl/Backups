//topic: math.h
//filepath: cd /Users/poudel/Copy/Programming/C/cprograms/maths
//unix: clear; gcc math.c -lm && ./a.out

#include<stdio.h>
#include<math.h>


int main(){
	
	int x = 2;
	int y = 3;
	int z;
	
	z = pow(x,y);
	printf("z is = %d\n", z);
	
	//aliter:
	printf("\nAnswer is = %.2lf \n", pow(2,3));
	
	//log10 float
	float c = log10f(100);
	
	printf("\nc= %.2f\n", c);
	return 0;
}
