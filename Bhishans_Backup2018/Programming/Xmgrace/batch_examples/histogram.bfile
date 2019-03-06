# Bhishan Poudel
# Nov 27,2015 Fri
# gracebat -batch histogram.bfile -nosafe -hardcopy -printfile "fig.png" -hdevice PNG

arrange (1,1,.1,.6,.6,ON,ON,ON)
 FOCUS G0
 READ NXY "a.dat"
 READ NXY "b.dat"
 #range(0..10) with 101 bins of 0.1 each
 HISTOGRAM (S0, MESH(-60, -20, 101), OFF, OFF)
 HISTOGRAM (S1, MESH(-60, -20, 101), OFF, OFF)
 #hides the NXY graph
 G0.S0 HIDDEN TRUE
 G0.S1 HIDDEN TRUE
 S2  line color 1
 S2  legend "6 atoms restrained"
 S3  line color 2
 S3  legend "no restrained"
 AUTOSCALE
 PRINT TO "histogram.png"
 HARDCOPY DEVICE "PNG"
 PAGE SIZE 2560, 2048
 DEVICE "PNG" FONT ANTIALIASING on
 DEVICE "PNG" OP "transparent:on"
 DEVICE "PNG" OP "compression:9"
 PRINT

