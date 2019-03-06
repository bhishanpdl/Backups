#!/usr/bin/env python3
# @Author: Bhishan Poudel
# @Date:   13-Nov-2016 22:11
# @Last modified by:   bhishan
# @Last modified time: 12-Nov-2016.


using PyPlot
x = [1,2,3,4,5]
y = [1,3,6,8,11]
PyPlot.plot(x,y)

# add ticks
PyPlot.xticks([1,3,5])
PyPlot.yticks([1,6,11])

# tick spacing
collect(linspace(x[1], x[end], 4))
collect(x[1]:div(x[end],4):x[end])
