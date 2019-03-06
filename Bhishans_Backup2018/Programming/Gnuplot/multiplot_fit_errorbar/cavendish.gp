# gnuplot cavendish.gp && xdg-open cavendish.eps

set terminal postscript eps color enhanced
set output 'cavendish.eps'

set title  "Cavendish Data"
set xlabel "Time (s)"
set ylabel "Angle (mrad)"
set grid


#plot "cavendish.data" title ""

#plot "cavendish.data" with yerrorbars title "hello world"



# example 3
theta(t) = theta0 + a * exp(-t / tau) * sin(2 * pi * t / T + phi)
a = 40
tau = 15
phi = -0.5
T = 15
theta0 = 10
fit theta(x) "cavendish.data" using 1:2:3 via a, tau, phi, T, theta0

#plot "cavendish.data" using 1:(theta($1) - $2):3 title "Residuals" with yerrorbars

set yrange [-80:60]
plot "cavendish.data" title "" with yerrorbars, theta(x) title ""

set y2range [-20:120]
set y2tics border

plot "cavendish.data" title "" with yerrorbars, theta(x) title "", "cavendish.data" using 1:(theta($1) - $2):3 axes x1y2 title "" with yerrorbars

set x2zeroaxis lt -1
set y2label "Residuals"
replot



