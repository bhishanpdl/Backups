/*
 * fftw test -- single precision
 * 
 * gcc -o a fftw3f-test.c -lm -lfftw3f; ./a  
 * 
 * # does not work
 * ld: library not found for -lfftw3f
 * 
 * /usr/local/include has only fftw3.h
 * 
 * worked after installing fftw3 for single precision:
 * 
 * sudo -H ./configure --enable-float --enable-sse
 * sudo -H make 
 * sudo -H make install
 * 
 */

#include <stdio.h>
#include <fftw3.h>
#define N 8

int main(int argc, char *argv[])
{
    float  in1[] = { 0.00000, 0.12467, 0.24740, 0.36627,
                     0.47943, 0.58510, 0.68164, 0.76754
    };

    float  in2[N];

    fftwf_complex out[N / 2 + 1];
    fftwf_plan    p1, p2;

    p1 = fftwf_plan_dft_r2c_1d(N, in1, out, FFTW_ESTIMATE);
    p2 = fftwf_plan_dft_c2r_1d(N, out, in2, FFTW_ESTIMATE);

    fftwf_execute(p1);
    fftwf_execute(p2);

    for (int i = 0; i < N; i++) {
          printf("%2d %15.10f %15.10f\n", i, in1[i], in2[i] / N);
    }

    fftwf_destroy_plan(p1);
    fftwf_destroy_plan(p2);

    return 0;
}
