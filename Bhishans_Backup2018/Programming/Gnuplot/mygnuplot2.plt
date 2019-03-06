# clear; gnuplot mygnuplot.gp; rm *~

reset
set terminal postscript eps color enhanced   # size 10,5 font ",20"
set output 'potentialA.eps'

# set the position of the key
#set key top left
set key at graph 0.75, graph 0.75

set key autotitle columnheader
set key font ",24"

#title subtitle and xy labels													
set title "Potentials v_l(q,q') \n {/*0.7for l=0 and q'=0.5 fm^{-1}}" font ",24"
set xlabel "q" font ",24"
set ylabel "v0(q,q')" font ",24"

# additional labels inside the graph
set label "l = 0\n q' = 0.5 fm^{-1}" left at graph 0.15, graph 0.95  # graph 0,0 is left bottom 


# ranges
set autoscale
set xrange [0:5]
#set yrange [-1:1]

# tickmarks
set xtic auto
set ytic auto

plot 'v0a.dat' using 1:2 with lines title 'v0',\
     'v2a.dat' using 1:2 with lines title 'v2',\
     'v4a.dat' using 1:2 with lines title 'v4',

################### Notes ######################################################

# greek letters
#set ylabel "d^2{/Symbol s}/dp/d{/Symbol W} (mb/(MeV/c)/str)" 
#set xlabel "K^+ Momentum (GeV/c)"


# subtitle needs terminal enhanced
# subtitle  /*0.5 is half of original font
#           /=20 is font size 20
# set title "This is a big gamma {/Symbol=20 G}"

# bold blue color y axis
#set arrow from graph -0.01, first -0.001 rto graph 0.02, first 0.002 lc rgb "blue" lw 5 nohead front


# draw vertical line   at x=b   note that total range of x is 1
#b=0.5
#set arrow from b,graph 0 to b,graph 1 lt 2 lw 2 lc rgb "green" nohead

# drawing horizontal line at y=0
#set arrow from graph 0,first 0 to graph 1,first 0 nohead lc rgb "#000000" front

