# Bhishan Poudel
# Dec 3, 2015 Thu

# clear; python fit2.py; rm *~

import numpy
from matplotlib.pyplot import *

x = [-7.30000, -4.10000, -1.70000, -0.02564,
     1.50000, 4.50000, 9.10000]
y = [-0.80000, -0.50000, -0.20000, 0.00000,
     0.20000, 0.50000, 0.80000]

coefficients = numpy.polyfit(x, y, 1)
polynomial = numpy.poly1d(coefficients)
ys = polynomial(x)
print coefficients
print polynomial

plot(x, y, 'o')
plot(x, ys)
ylabel('y')
xlabel('x')
xlim(-10,10)
ylim(-1,1)
show()

