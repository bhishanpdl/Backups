# Bhishan Poudel
# Nov 11, 2015

# cmd: clear; python squareroot.py



import numpy
import multiprocessing

x = numpy.linspace(0,20,10000)
p = multiprocessing.Pool(processes=4)

print p.map(numpy.sqrt, x)

print 'hello'
