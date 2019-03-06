/*
 * fftw test -- long double precision
 * 
 * gcc -o a fftw3l-test.c -lm -lfftw3l; ./a  
 * 
 *  # does not work
 *  ld: library not found for -lfftw3l
 *  
 *  /usr/local/include has only fftw3.h
 * 
 * 
 * Ref : http://www.hoffman2.idre.ucla.edu/fftw/
 */

#include <stdio.h>
#include <fftw3.h>
#define N 8

int main(int argc, char *argv[])
{
    long double in1[] = { 0.00000, 0.12467, 0.24740, 0.36627,
                          0.47943, 0.58510, 0.68164, 0.76754
    };

    long double in2[N];

    fftwl_complex out[N / 2 + 1];
    fftwl_plan    p1, p2;

    p1 = fftwl_plan_dft_r2c_1d(N, in1, out, FFTW_ESTIMATE);
    p2 = fftwl_plan_dft_c2r_1d(N, out, in2, FFTW_ESTIMATE);

    fftwl_execute(p1);
    fftwl_execute(p2);

    for (int i = 0; i < N; i++) {
          printf("%2d %15.10Lf %15.10Lf\n", i, in1[i], in2[i] / N);
    }

    fftwl_destroy_plan(p1);
    fftwl_destroy_plan(p2);

    return 0;
}
