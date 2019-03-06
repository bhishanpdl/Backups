# clear; gnuplot plotting_data3.gp; rm *~; open plotting_data3.png


set terminal png size 350,262 enhanced font 'Verdana,10'
set output 'plotting_data3.png'


# color definitions
set border linewidth 1.5
set style line 1 lc rgb '#0060ad' lt 1 lw 2 pt 7 ps 1.5 # --- blue
set style line 2 lc rgb '#dd181f' lt 1 lw 2 pt 5 ps 1.5 # --- red

unset key

set ytics 1
set tics scale 0.75

set xrange [0:5]
set yrange [0:4]

plot 'plotting_data3.dat' index 0 with linespoints ls 1, \
     ''                   index 1 with linespoints ls 2
