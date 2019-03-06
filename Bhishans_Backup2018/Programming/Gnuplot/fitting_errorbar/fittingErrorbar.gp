# Bhishan Poudel

# gnuplot fittingErrorbar.gp && xdg-open fittingErrorbar.eps

# define variables
f = 'fittingErrorbar.dat'


# set terminal and output
set terminal postscript eps color enhanced
set output 'fittingErrorbar.eps'
set fit logfile 'fittingErrorbar.log'

# set title and x-y ranges
set title  "plot of time vs angle"
set xrange [*:*]
set yrange [-60:60]

# x and y label
set xlabel "The x axis is \n time"  # "" works for \n but '' doesnot work
set ylabel "Angle (mrad)"

# set grid
set grid

# fit the data
theta(t) = theta0 + a * exp(-t / tau) * sin(2 * pi * t / T + phi)
#a = 40
#tau = 15
#phi = -0.5
#T = 15
#theta0 = 10
#fit theta(x) f using 1:2:3 via a, tau, phi, T, theta0
fit theta(x) f using 1:2:3 via 'start.par'

# extracting title 
title_theta(t) = sprintf('fitted curve: theta(t) = %.2f + %.2f * exp(-t / %.2f) * sin(2 * pi * t / %.2f + %.2f)', \
                                     theta0,a,              tau,                     T,     phi)

# plot
plot f  title 'errorbars' with yerrorbars, \
     theta(x) title title_theta(t)


