#!/usr/bin/gnuplot
# Bhishan Poudel
# Jan 18, 2016
# ref: http://www.gnuplotting.org/understand-parametric-plotting

# clear; gnuplot 3dplot2.gp; xdg-open 3dplot2.png

reset
set terminal pngcairo size 350,262 enhanced font 'Verdana,10'
set output '3dplot2.png'


# color definitions
set border lw 1.5
set style line 1 lc rgb '#000000' lt 1 lw 2
set style line 2 lc rgb '#c0c0c0' lt 2 lw 1

unset key; unset border 
set tics scale 0
set lmargin screen 0
set bmargin screen 0 
set rmargin screen 1
set tmargin screen 1 
set format ''

set mapping spherical
set angles degrees
set hidden3d

# Set xy-plane to intersect z axis at -1 to avoid an offset between the lowest z
# value and the plane
set xyplane at -1
set view 56,81

set parametric
set isosamples 25
set urange[0:360]
set vrange[-90:90]

r = 0.99
splot r*cos(v)*cos(u), \
      r*cos(v)*sin(u), \
      r*sin(v) \
      with lines linestyle 2, \
      'world.dat' \
      with lines linestyle 1
      
      
      
