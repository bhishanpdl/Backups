# clear; gnuplot multiplot.gp; rm *~; open multiplot.eps

set terminal postscript eps color enhanced size 10,5 background rgb '#bbbbbb' "Times-Roman" 14 colortext
set output 'multiplot.eps';

set multiplot layout 3,1
set style line 1 dashtype 3 linecolor 3 linewidth 7
unset style  # colors red 	green 	blue 	magenta 	lightblue	yellow 	black 	orange	grey 
set style line 1 dashtype 3 linecolor rgb "magenta" linewidth 7 pointsize default pointinterval 0

# plot 1
set key horizontal top right
set title "Legendre Polynomials"
set xlabel "x"
set ylabel "{/Symbol Y}_3(x)"

plot 'n3.dat' using 1:2 with lines dashtype 1 linecolor 1 linewidth 7 title 'order n=3'

# plot 2
unset title
set title ""
set key horizontal top right
set xlabel "x"
set ylabel "{/Symbol Y}_4(x)"

plot 'n4.dat' using 1:2 with lines dashtype 2 linecolor 2 linewidth 7 title 'order n=4'

# plot 3
unset title
set title ""
set key horizontal top right
set xlabel "x"
set ylabel "{/Symbol Y}_5(x)"
set xrange [-1:1]

#plot 'n5.dat' using 1:2 with lines dashtype 3 linecolor 3 linewidth 7 title 'order n=5'
#plot 'n5.dat' using 1:2 with lines linestyle 1 title 'order n=5'
#plot 'n5.dat' u 1:2 w l ls 1 t 'order n=5'
plot 'n5.dat' w l ls 1 t 'order n=5'


