# clear; gnuplot dashtypes.gp; rm *~; open dashtypes.eps

set terminal postscript eps color enhanced size 10,5
set output 'dashtypes.eps';

set title "Figure 1"
set xlabel "x"
set ylabel "y"

set label "custom label" at 0.1,4

# ranges
set autoscale                          # let gnuplot determine ranges (default)
                                       #set xrange [0:4]


# tickmarks

set xtic auto                          # set xtics automatically
set ytic auto                          # set ytics automatically
                                       # eg. set xtics (1,2,3,4)
                                       # eg. set ytics (1.1, 2.2, 3.3, 4.4)

plot 'n3.dat' using 1:2 with lines dashtype 2 title 'data1'

# dashtype "." ".-"  "-" "..-"

