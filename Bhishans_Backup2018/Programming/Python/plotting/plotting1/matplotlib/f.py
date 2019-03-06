import numpy
import matplotlib.pyplot as plt

dataset = numpy.genfromtxt(fname='example2.txt',skip_header=1)

print (dataset)

x=dataset[:,0]
y=dataset[:,1]

plt.figure(1)
plt.plot(x,y)
plt.plot(x,y,'ro')
#plt.save()
plt.show()
