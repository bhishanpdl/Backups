# clear; gnuplot multiplot6.gp; rm *~; open multiplot6.eps

set terminal postscript eps enhanced color
set output 'multiplot6.eps'

#set label "Sine and Cosine" at screen 0.5,0.95 center front

set multiplot layout 1,2 title "Sine and Cosine"
set title "Sine"
plot sin(x)

set title "Cosine is coolest!"
plot cos(x) title "Cosine",tan(x) title "Tangent"

