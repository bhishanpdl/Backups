# clear; gnuplot helpergrid.gp; rm *~

reset
set terminal postscript eps color enhanced   # size 10,5 font ",20"
set output 'helpergrid.eps'

unset key
set xrange [0:40]; set yrange [0:7]
set xlabel 'Effort [a.u.]'
set ylabel 'Output [a.u.]'
set grid lt 0 lw 0.5 lc rgb "#ff0000"

p 'helpergrid.dat' u 1:2 w lp lt 3 pt 7 ps 1.5,   \
                '' u 1:(0):xticlabel(1) w p ps 0, \
                '' u (0):2:yticlabel(2) w p ps 0
