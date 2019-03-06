set terminal postscript
set output "bhishan.eps"
set title "Y vs X"
set xlabel "X"
set ylabel "Y"
f(x)=m*x+c
fit f(x) "bhishan.dat" using 1:2 via m,c
plot'bhishan.dat' using 1:2, m*x+c
