# Bhishan Poudel
# Nov 27,2015 Fri
# xmgrace -batch eg1.bat -nosafe -hardcopy
# xmgrace -batch eg1.bat

READ NXY "a.dat"
READ NXY "b.dat"

s0 line color 1
s1 line color 2

s0 legend "graph1"
s1 legend "graph2"

title "graphs"
xaxis label "x"
yaxis label "y"

#yaxis ticklabel char size 0.800000
#xaxis ticklabel off


# printing as eps
#################
PRINT TO "eg1.eps"
DEVICE "EPS" OP "level2"
PRINT

# printing as png
#################
#PRINT TO "output.png"
#HARDCOPY DEVICE "PNG"
#PAGE SIZE 2560, 2048
#DEVICE "PNG" FONT ANTIALIASING on
#DEVICE "PNG" OP "transparent:on"
#DEVICE "PNG" OP "compression:9"
#PRINT

