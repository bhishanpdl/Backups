# command to run: gnuplot fit.sh

# reset the previous setting, and set terminal and output
reset
set terminal postscript color enhanced dashed
set output '5vsersic.eps'
set fit logfile '5vsersic.log'


# fitting function : log I = log(Io) - kR^(1/n)    for Sersic profile
f(x)=I0*exp(-k*x**(1.0/n))

# initial guess of parameters ( we can also create start.par and put these start values)
I0=500000.0 ;k= 0.9; n=2.0 

# define a variable
file = '5v.dat'

# fitting with error variabe = sqrt(third column*fourth column) note: via 'start.par'
fit f(x) file using 2:3:(sqrt(($3)*($4))) via I0,k,n 

# labels and title 
set ylabel 'Intensity I (count/pixel)'
set xlabel 'Radius r (pixel)'
set title  "Plot of Brightness profile \n for NGC 5 V-band"

set logscale xy
unset logscale xy

#define a title inside the graph
title_f(I0,k,n) = sprintf('Best Fit : log(I) = log(%.2f) - %.2f R ** (1/%.2f)', \
                                        I0,     k,         n)

# plot the graph with error and labels
plot [*:*] file using 2:3:(sqrt($3)*($4)) with yerror linecolor rgb 'blue' title 'Data', \
           f(x) with line linetype rgb 'red' title title_f(I0,k,n)
           


