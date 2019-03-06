set terminal postscript color
set output 'Data.eps'

set title 'plot of x vs y'
set xrange [*:*]
set yrange [*:*]

set xlabel "x"
set ylabel "y"

f(x) = a*x + b

fit f(x) 'Data.csv' u 1:2 via a, b

title_f(a,b) = sprintf('f(x) = %.2fx + %.2f', a, b)

plot "Data.csv" u 1:2 w l, f(x) t title_f(a,b)
