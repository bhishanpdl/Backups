# Bhishan Poudel
# Nov 27,2015 Fri
# xmgrace -batch eg2.bat -nosafe -hardcopy

#world xmin 0.0
#world ymin 0.0
#world xmax 8.0
#world ymax 2.2


#set the thickness of the x and y axis for thicker lines than the default of 1.0
xaxis bar linewidth 4.0
yaxis bar linewidth 4.0
#
#
#edit some data
#x = x * 0.1

#sonvert timestep to ps
#s0.y = s0.y / 1000.0
#x = x * 0.002


#set the line colours of the lines
#s0 line color 3
#s0 line linestyle 3
#s0 line linewidth 3.0
#s1 line color 4

s0 line color 1
s0 line linestyle 1
s0 line linewidth 3.0


#turn off the second line
#s1 hidden true


#title information (default size is 1.0)
title size 3.0
title "Volume Time"

#set the viewpoint - to make sure that axis labels are seen
view 0.350000, 0.3500000, 1.150000, 0.850000


#set the labels for the x and y axis
#giving examples of changing size, font and using subscripts and superscripts and newlines


xaxis label char size 3.0
yaxis label char size 3.0

xaxis ticklabel char size 1.5
yaxis ticklabel char size 1.5

#xaxis tick major 40000
xaxis label "time / ps"


yaxis ticklabel format scientific
yaxis ticklabel prec 1

yaxis label "volume / Å\S3"
autoscale

