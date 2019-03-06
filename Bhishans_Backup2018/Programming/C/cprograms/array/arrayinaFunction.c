#include<stdio.h>

int main()
{


//in C99 we can do this
void array_function(int m, int n, float a[m][n])
 {
      for (int i = 0; i < m; i++)
          for (int j = 0; j < n; j++)
              a[i][j] = 0.0;
 }


 void another_function(void)
 {
     float a1[10][20];
     float a2[15][15];
     array_function(10, 20, a1);
     array_function(15, 15, a2);
 }

    return 0;
}
