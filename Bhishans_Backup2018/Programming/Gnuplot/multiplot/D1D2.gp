# clear; gnuplot D1D2.gp; rm *~

# plot third column of D1 vs 2nd column of D2

set terminal postscript eps color enhanced size 10,5
set output 'D1D2.eps';


set title "col3 vs col 5";
set xlabel "x"
set ylabel "y"

plot "< paste D1.csv D2.csv" u 3:5 w l


