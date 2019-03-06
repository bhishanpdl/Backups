#Bhishan Poudel
# Nov 15, 2015
# ref: http://xmodulo.com/how-to-plot-ratios-of-values-with-gnuplot.html

# gnuplot my.gp

# define a variable for filename
f = 'my.txt'

#set terminal
set terminal png enhanced
set output 'output.png'

# title and x-y ranges

set title 'title'
set xrange [*:*]
set yrange [*:*]


# plot
plot "my.dat" using 1:($3/$2) title "ratio of the 3rd col over the 2nd col" with lp 
