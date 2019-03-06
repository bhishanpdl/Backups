# gnuplot xvalues1.gp


f = 'xvalues1.dat'


#set terminal
set terminal png enhanced               # to see available options just type: set terminal
set output 'xvalues1.png'               # png,jpeg,gif,eps

set title 'Title'
set xrange [0:1000]
set yrange [0:1]

#scatter plot

splot f


# examples
#set terminal png size 400,300 enhanced font "Helvetica,20"
#set output 'output.png'

#set terminal jpg color enhanced "Helvetica" 20
#set output "output.jpg"

#set terminal gif color enhanced
#set output "output.gif"

