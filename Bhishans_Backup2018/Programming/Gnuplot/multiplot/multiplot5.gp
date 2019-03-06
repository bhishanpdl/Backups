# clear; gnuplot multiplot5.gp; rm *~; open multiplot5.eps

set terminal postscript eps enhanced color
set output 'multiplot5.eps'

L = 0.14
R = 0.95

TOP=0.98
DY = 0.29

set multiplot

set offset 0,0,graph 0.05, graph 0.05

set ylabel 'y' offset 1
set xlabel 'x'


set tmargin at screen TOP-1.65*DY
set bmargin at screen TOP-3*DY
set lmargin at screen R-6*L
set rmargin at screen R-3*L
plot "data1.dat" w l title"TITLE 1" 

set ytics format ''
unset ylabel
set lmargin at screen R-3*L
set rmargin at screen R
plot "data2.dat" w l title"TITLE 2"

