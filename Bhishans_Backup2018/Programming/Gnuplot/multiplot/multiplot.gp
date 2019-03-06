# clear; gnuplot multiplot.gp

set terminal postscript eps color enhanced size 10,5
set output 'multiplot.eps';

set multiplot layout 1, 2 ;

set title "Figure 1";
set xlabel "x"
set ylabel "y"
plot  "data1.dat"
 
set title "Figure 2";
set xlabel "x"
set ylabel "y"
plot  "data2.dat" 
unset multiplot
