# clear; gnuplot multiplot3.gp; rm *~; open multiplot3.eps

set terminal postscript eps color enhanced size 10,5
set output 'multiplot3.eps';

set multiplot layout 3,1
  # Here the 1st plot
    set yrange [0:100]
    set key
       plot sin(x) t "plot 1"
  # Here the 2st plot
    unset key
    set xlabel "X of the second plot " 
       plot cos(x) t "plot 2"
  # Here the 3rd plot
    # unset key # is not needed 
    set xlabel "X of the last plot " 
    set y2label "Process CPU time, %";  # better before if you want it acts
   plot cos(1.5*x) t "plot 3"

unset multiplot

