# Bhishan Poudel
# Nov 27,2015 Fri
# gracebat -batch histogram2.bat -nosafe -hardcopy -printfile "fig.png" -hdevice PNG


arrange (1,1,.1,.6,.6,ON,ON,ON)
 FOCUS G0
 READ NXY "temp1.txt"
 READ NXY "temp2.txt"

 #range(0..10) with 101 bins of 0.1 each
 HISTOGRAM (S0, MESH(-60, -20, 101), OFF, OFF)
 HISTOGRAM (S1, MESH(-60, -20, 101), OFF, OFF)

 # output histograms to files
 WRITE G0.S2 FILE "temp1.dat"
 WRITE G0.S3 FILE "temp2.dat"

 # clear all data from program
 KILL G0.S0
 KILL G0.S1
 KILL G0.S2
 KILL G0.S3

 # reread data back in to get rid of formatting
 READ NXY "temp1.dat"
 READ NXY "temp2.dat"

 #hides the NXY graph
 S0  line color 1
 S0  legend "6 atoms restrained"
 S1  line color 2
 S1  legend "no restrained"
 AUTOSCALE

