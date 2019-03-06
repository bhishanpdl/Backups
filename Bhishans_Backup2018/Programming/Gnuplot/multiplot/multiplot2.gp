# clear; gnuplot multiplot2.gp; rm *~; open multiplot2.eps

set terminal postscript eps color enhanced size 10,5 background rgb '#bbbbbb'
set output 'multiplot2.eps';

set multiplot layout 2,1

# plot 1
set key horizontal top right 
set title "Figure 1";
set xlabel "x"
set ylabel "y"

plot 'data1.dat' using 1:2 with lines dashtype 1 linecolor 1 title 'data1'

# plot 2
set key horizontal top right
set title "Figure 2";
set xlabel "x"
set ylabel "y"

plot 'data2.dat' using 1:2 with lines dashtype 2 linecolor 2 title 'data2'

