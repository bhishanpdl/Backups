#include<stdio.h>

int main ()
{
	int x=0;

	switch(x)
	{

  	case 1: printf( "One" );

  	case 0: printf( "Zero" );

  	case 2: printf( "Hello World" );	//output will be ZeroHello World, because there is no break;

}

return 0;
}
