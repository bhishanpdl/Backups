# Bhishan Poudel
# Jan 26, 2016

# clear; python invertyaxis.py ; rm *~

import matplotlib.pyplot as plt
import pylab
import matplotlib

x = [1,2,3]
y = [5,7,4]

plt.scatter(x, y)
plt.yscale('log')
plt.gca().invert_yaxis()
plt.show()
