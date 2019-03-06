# Bhishan Poudel
# Nov 15, 2015
# ref: http://seclab.skku.edu/wp-content/uploads/2015/02/gnuplot-freq-commands.pdf
# Bhishan Poudel
# Nov 15, 2015 Sun

# cmd: gnuplot rainfall.gp

f = 'rainfall.txt'

set terminal png
set output 'rainfall.png'


set xrange [-0.5:3.5]								# set the x-axis range
set yrange [0:90]									# set the y-axis range
set style line 1 lt 1 lc rgb "red" lw 1 pt 1		# line style for line 1
set style line 2 lt 1 lc rgb "green" lw 1 pt 2		# line style for line 2
set style line 3 lt 1 lc rgb "blue" lw 1 pt 3		# line style for line 3
set style line 4 lt 1 lc rgb "magenta" lw 1 pt 4	# line style for line 4
set xlabel 'Quarter'								# set X-axis label
set ylabel 'Rainfall (in mm)'						# set Y-axis label
set key top left									# set the position of the key
set key autotitle columnheader						#   column-headers   in   the source file are to
													# be used as titles in the legend
													

# plot all the data sets, taking  the  x-axis  labels  from column 1

plot f u 2:xticlabels(1) w linespoints ls 1, \
    '' u 3:xticlabels(1) w linespoints ls 2, \
    '' u 4:xticlabels(1) w linespoints ls 3, \
    '' u 5:xticlabels(1) w linespoints ls 4


