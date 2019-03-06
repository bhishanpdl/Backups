# gnuplot 4col.gp; xdg-open 4col.eps &

f = '4col.csv'

set terminal postscript color enhanced
set output '4col.eps'


# title,labels
set title 'plot '                       # plot title
set xlabel 'x'                          # x-axis label
set ylabel 'y'                          # y-axis label

# labels
set label "boiling point" at 10, 212

#plot '4col.csv' using 1:2 with lines, '4col.csv' using 1:3 with lines, '4col.csv' using 1:4 with lines

plot f u 1:2 w l t "col 1 vs 2", \
     f u 1:3 w l t "col 1 vs 3", \
     f u 1:4 w l t "col 1 vs 4"
