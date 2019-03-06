# clear; gnuplot forloop.gp; rm *~

set terminal postscript eps color enhanced   # size 10,5 font ",20"
set output 'forloop.eps'


unset bars
max = 1e6
set xrange[0:8]
plot for [i=1:4] 2*i+sin(x) ls i title '', \
for [i=1:4] 'values.dat' using (1):1:(max) every ::(i-1)::(i-1) with xerror ls i ps 0 title ''
