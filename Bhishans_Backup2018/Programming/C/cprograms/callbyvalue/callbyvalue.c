// call by value and call by reference
// call_by_value(a); and call_by_reference(&b);



#include <stdio.h>
//***********************defining functioin call by value 

void call_by_value(int x) {							// x is a local variable 
	printf("Inside call_by_value x = %d before adding 10.\n", x);
	x += 10;
	printf("Inside call_by_value x = %d after adding 10.\n", x);
}
//***************defining functioin call by reference

void call_by_reference(int *y) {
	printf("Inside call_by_reference y = %d before adding 10.\n", *y); 	// *y is a local pointer
	(*y) += 10;
	printf("Inside call_by_reference y = %d after adding 10.\n", *y);
}
//**************main functioin
int main() {
	int a=10;
	int b=10;
	
	printf("a = %d before function call_by_value.\n", a); // a = 10 before function call_by_value.
	//*****************call by value
	
	call_by_value(a);  	// output: Inside call_by_value x = 10 before adding 10.
				//Inside call_by_value x = 20 after adding 10.
	
	
	printf("a = %d after function call_by_value.\n", a);	//a = 10 after function call_by_value.
	
	//**********************call by reference
	
	printf("b = %d before function call_by_reference.\n", b);	//b = 10 before function call_by_reference.
	call_by_reference(&b);						//Inside call_by_reference y = 10 before adding 10.
									//Inside call_by_reference y = 20 after adding 10.
	
	
	printf("b = %d after function call_by_reference.\n", b);	//b = 20 after function call_by_reference.
	
	
return 0;
}



/*
When to Use Call by Value and When to use Call by Reference?

One advantage of the call by reference method is that it is using pointers, so there is no doubling of the memory used by the variables (as with the copy of the call by value method). This is of course great, lowering the memory footprint is always a good thing. So why don’t we just make all the parameters call by reference?

There are two reasons why this is not a good idea and that you (the programmer) need to choose between call by value and call by reference. The reason are: side effects and privacy. Unwanted side effects are usually caused by inadvertently changes that are made to a call by reference parameter. Also in most cases you want the data to be private and that someone calling a function only be able to change if you want it. So it is better to use a call by value by default and only use call by reference if data changes are expected.

That is all for this C tutorial, where you (hopefully) have learned the difference between call-by-value and call-by-reference.
*/
