// topic :“static const” vs “#define” in C
//ref    : https://stackoverflow.com/questions/1674032/static-const-vs-define-in-c/1674459#1674459
//terminal: clear; gcc constVar.c && ./a.out


#include<stdio.h>

#define VAR 5.0 //constant macro
#define MYMAX 100


int main(int argc, char *argv[])
{

    const int var      = 20;  // constant variable
    const int mymax_var=100;
    
    
    
    //you can not do printf("address of constant is %p",&MYMAX);
    
    printf("address of constant is %p\n\n",&mymax_var);
    
    
    //drawback of static const in some compiler this does not work
    //better option is just use const int
    static int const NUMBER_OF_FINGERS_PER_HAND = 5;
    static int const NUMBER_OF_HANDS = 2;

    // initializer element is not constant, this does not work.
    static int const NUMBER_OF_FINGERS = NUMBER_OF_FINGERS_PER_HAND 
                                     * NUMBER_OF_HANDS;
                                     
    printf(" NUMBER_OF_FINGERS = %d\n",  NUMBER_OF_FINGERS);
    


    printf("\n\n");
    return 0;
}

/*

    A const object is not only immutable, but has a type and is far easier to debug,
    track and diagnose, since it actually exists at compilation time 
    (and, crucially, has a name in a debug build).



    To be more clear,the define is replaced by its value at pre-processing stage,
    so we do not have any variable stored in the program. We have just the code 
    from the text segment of the program,where the define was used. However,for 
    static const we have a variable,that is allocated somewhere. For gcc,static const 
    are allocated in text segment of the program.
*/
