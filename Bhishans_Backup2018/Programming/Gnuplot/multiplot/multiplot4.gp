# clear; gnuplot multiplot4.gp; rm *~; open multiplot4.png

set terminal png size 800,600 background rgb '#bbbbbb'
set output 'multiplot4.png'

set multiplot layout 2,2 \
              margins 0.1,0.98,0.1,0.98 \
              spacing 0.08,0.08

set ylabel 'ylabel'
plot x

unset ylabel
plot 2*x

set ylabel 'ylabel'
set xlabel 'xlabel'
plot 3*x

unset ylabel
plot 4*x
unset multiplot
