
#include <time.h>
#include <stdio.h>

int main(void)
{
    time_t mytime;
    mytime = time(NULL);
    printf(ctime(&mytime));


    //// Example 2
    //time_t t = time(NULL);
    //struct tm tm = *localtime(&t);
    //printf("Date: %d-%d-%d %d:%d:%d\n", tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);


    //// Example 3
    //time_t t = time(NULL);
    //struct tm *tm = localtime(&t);
    //printf("Date: %s\n", asctime(tm));

    // Example 4
    time_t t = time(NULL);
    struct tm *tm = localtime(&t);
    char s[64];
    strftime(s, sizeof(s), "%c", tm);
    printf("strftime = %s\n", s);

    return 0;
}

