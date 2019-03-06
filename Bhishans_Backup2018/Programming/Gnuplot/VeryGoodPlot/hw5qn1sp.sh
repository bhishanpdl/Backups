
# gnuplot hw5qn1sp.sh

reset
set terminal postscript color enhanced dashed
set output 'hw5qn1sp.eps'

file = 'hw5qn1sp.dat'

set key outside
set pointsize .75
set ylabel "(error)" font "Arial Bold"
set xlabel "(no. of points)" font "Arial Bold"


f1(x) = a0 + a1*x + a2*x**2 + a3*x**3
fit f1(x) file using 1:6 via a0,a1,a2,a3

f2(x) = b0 + b1*x + b2*x**2 + b3*x**3 + b4*x**4 + b5*x**5 + b6*x**6
fit f2(x) file using 1:7 via b0,b1,b2,b3,b4,b5,b6

f3(x) = c0 + c1*x + c2*x**2 + c3*x**3 + c4*x**4 + c5*x**5 + c6*x**6
fit f3(x) file using 1:8 via c0,c1,c2,c3,c4,c5,c6

plot f1(x) title '# 1', f2(x) title '# 2', f3(x) title '# 3'


