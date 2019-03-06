from numpy import *
import matplotlib.pyplot as plt



x, y = loadtxt('input.dat', unpack=True,skiprows=6,delimiter=' ',usecols=(0,1))


# with open ('input.dat') as d:
#	x, y, yerr = loadtxt(d, unpack=True,skiprows=2)

plt.plot(x,y)
plt.plot(x,y,'ro')
plt.show() 
