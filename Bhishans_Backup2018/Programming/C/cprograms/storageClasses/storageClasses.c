//topic: C - Storage Classes
//source:http://www.tutorialspoint.com/cprogramming/c_storage_classes.htm

// storage classes in C are: auto,register,static,and extern.

#include <stdio.h>
 
/* function declaration */
void func(void);
 
static int count = 5; /* global variable */
 
main()
{
   while(count--)
   {
      func();
   }
   return 0;
}
/* function definition */
void func( void )
{
   static int i = 5; /* local static variable */
   i++;

   printf("i is %d and count is %d\n", i, count);
}

/*
The auto Storage Class

The auto storage class is the default storage class for all local variables.

{
   int mount;
   auto int month;
}

The example above defines two variables with the same storage class, auto can only be used within functions, i.e., local variables.
The register Storage Class

The register storage class is used to define local variables that should be stored in a register instead of RAM. This means that the variable has a maximum size equal to the register size (usually one word) and can't have the unary '&' operator applied to it (as it does not have a memory location).

{
   register int  miles;
}

The register should only be used for variables that require quick access such as counters. It should also be noted that defining 'register' does not mean that the variable will be stored in a register. It means that it MIGHT be stored in a register depending on hardware and implementation restrictions.
The static Storage Class

The static storage class instructs the compiler to keep a local variable in existence during the life-time of the program instead of creating and destroying it each time it comes into and goes out of scope. Therefore, making local variables static allows them to maintain their values between function calls.

The static modifier may also be applied to global variables. When this is done, it causes that variable's scope to be restricted to the file in which it is declared.

In C programming, when static is used on a class data member, it causes only one copy of that member to be shared by all objects of its class.
*/ 
