#include<stdio.h>

int main(){


    int naxes1[1] = {6};
    int naxes2[1] = {6};
    int naxes3[1] = {6};

    if (naxes1[0]  == naxes2[0] == naxes3[0])
        printf("first doesnot work\n");
        
    if (naxes1[0]  == naxes2[0] && naxes1[0]== naxes3[0])
        printf("second works\n");
        
    
        
    return 0;
}
