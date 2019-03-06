//topic : math.h function cos and cosf
//source: http://en.cppreference.com/w/c/numeric/math/cos
//source: https://msdn.microsoft.com/en-us/library/ydcbat90.aspx


#include<stdio.h>
#include<math.h>
#define PI 3.14159

int main(){
	
	int 		x = 55;
	float 	c = cosf( x*PI/180);
	
	printf("\nc equals to %f\n", c);
	
	
	double pi = acos(-1);
    // typical usage
    printf("cos(pi/3) = %f\n", cos(pi/3));
    printf("cos(pi/2) = %f\n", cos(pi/2));
    printf("cos(-3*pi/4) = %f\n", cos(-3*pi/4));
    // special values
    printf("cos(+0) = %f\n", cos(0.0));
    printf("cos(-0) = %f\n", cos(-0.0));
	
	return 0;
}


// function: 	cos 	 	cosf    cosl    acos		cosh   	coshf   
// argument:		double	float	long		inverse hyp		hyp,float	
/*
float       cosf( float arg );
	(1) 	(since C99)
double      cos( double arg );
	(2) 	
long double cosl( long double arg );
	(3) 	(since C99)
Defined in header <tgmath.h>
		
#define cos( arg )
	(4) 	(since C99)
	
1-3) Computes the cosine of arg (measured in radians).
4) Type-generic macro: If the argument has type long double, cosl is called. Otherwise, if the argument has integer type or the type double, cos is called. Otherwise, cosf is called. If the argument is complex, then the macro invokes the corresponding complex function (ccosf, ccos, ccosl).
*/
