#!/usr/bin/gnuplot

# Bhishan Poudel
# Jan 18, 2016
# ref: http://www.gnuplotting.org/understand-parametric-plotting

# clear; gnuplot circle.gp; xdg-open circle.png

reset
set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
set output 'circle.png'


# Style definitions
set border lw 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2     # --- blue
set style line 2 lc rgb '#dd181f' lt 1 lw 2     # --- red

unset key; unset tics; unset border
set lmargin 0
set rmargin 1
set tmargin 1
set bmargin 0

set size ratio -1
set xrange [-1.2:1.2]
set yrange [-1.2:1.2]
set trange [0:2*pi]

set parametric

# Radius
r = 1.0
h = r / sqrt(2.)
set arrow from 0,0 to h,h nohead ls 2
set label 'r' at 0.28,0.45 textcolor ls 2

# Parametric functions for a circle
fx(t) = r*cos(t)
fy(t) = r*sin(t)

plot fx(t),fy(t) ls 1
