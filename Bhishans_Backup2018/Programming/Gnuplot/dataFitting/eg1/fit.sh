# gnuplot fit.sh

reset
set terminal png
# set terminal postscript color enhanced dashed
set output '77r.png'

f(x)=I0*exp(-k*x**(1.0/n))
#log I = log(Io) - kR^(1/n)    for Sersic profile

I0=5000.0 ;k= .10; n=1.0

file = '77r.dat'

fit f(x) file u 2:3 via I0,k,n 
title_f(I0,k,n) = sprintf('best fit: log(I) = log( %.2f) - %.2f R^{1/%.2f}', I0, k, n)

set ylabel 'log(I) (count/pixel)'
set xlabel 'r (pixel)'
set title 'Plot of Brightness profile for NGC 7768 V-band'
set logscale y
plot [*:*] file u 2:3:4 w ye lc rgb 'blue' t 'Data', \
           f(x) w l lt rgb 'red' t title_f(I0,k,n)

# set x axis a logscale
set output '77r2.png'
set ylabel 'log(I) (count/pixel)'
set xlabel 'log(R) (pixel)'
set logscale x
replot

