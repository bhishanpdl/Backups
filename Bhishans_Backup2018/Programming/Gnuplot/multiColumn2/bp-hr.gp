# gnuplot bp-hr.gp && xdg-open bp-hr.eps

f = 'bp-hr.dat'

set terminal postscript color enhanced
set output 'bp-hr.eps'


# set grid
set grid

# set title, x and y labels
set title  'Plot of BP and Heartrate vs. time'
set xlabel 'time (military)'
set ylabel 'BP and heartrate'

# set x and y ranges
set xrange [*:*]
set yrange [50:160]

# set labels
set label 'finished walk' at 15, 140
unset label
set label 'finished walk' at 15, 105

# plot
plot f u 1:2 w lp t 'systolic', \
     f u 1:3 w lp t 'diastolic', \
     f u 1:4 w lp t 'heartrate'
