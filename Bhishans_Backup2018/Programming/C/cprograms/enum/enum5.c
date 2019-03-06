//topic    : enumeration in c
//terminal : clear; gcc enum.c && ./a.out

#include <stdio.h>

enum week{ sunday, monday, tuesday, wednesday, thursday, friday, saturday};
//         0       1       2        3          4         5       6


int main()
{
    enum week today;
    
    today = wednesday;
    
    printf("%d day",today+1);
    
    printf("\n\n");
    return 0;
   }
