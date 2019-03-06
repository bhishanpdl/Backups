# Bhishan Poudel

# gnuplot errorbar.gp && xdg-open errorbar.eps

# define variables
f = 'errorbar.dat'


# set terminal and output
set terminal postscript eps color enhanced
set output 'errorbar.eps'

# set title and x-y ranges
set title  "plot of time vs angle"
set xrange [*:*]
set yrange [*:*]

# x and y label
set xlabel "Time (s)"
set ylabel "Angle (mrad)"

# set grid
set grid

# scatter plot
#plot f title "time vs angle"


# scatter plot with errorbar
#plot f with yerrorbars title "time vs angle"

# linespoint
plot f using 1:2 with linespoint title "time vs angle"





