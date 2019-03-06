//topic: what operator ?
//source: http://www.tutorialspoint.com/cprogramming/c_decision_making.htm

//syntax: Exp1 ? Exp2 : Exp3;
//meaning: if exp1 is true, exp2 is executed and is the value of ?
// but,    if exp1 is false,exp3 is executed and is the value of ?
// The ? is called as a ternary operator,
// because it requires three operands
#include<stdio.h>

int main(){

	int x,y,z;

	x = 5;
	y = x>4 ? 10 : 20;
	z = x<4 ? 10 : 20;

	printf("\nthe value of y= %d and z= %d\n ", y,z);

printf("\n");
return 0;
}

/*
The ? : Operator:

We have covered conditional operator ? : in previous chapter which can be used
*  to replace if...else statements. It has the following general form:

Exp1 ? Exp2 : Exp3;

Where Exp1, Exp2, and Exp3 are expressions. Notice the use and
* placement of the colon.

The value of a ? expression is determined like this: Exp1 is evaluated.
* If it is true, then Exp2 is evaluated and becomes the value of the
* entire ? expression. If Exp1 is false, then Exp3 is evaluated and its value
* becomes the value of the expression.
*/
