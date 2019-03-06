# Program : Hartle figure 7.1 page 143

# 2-d metric  : ds^2 = -x^2 dT^2  + dX^2
# worldline   : X(T) = A cosh(T), where A = 1 for the figure

# define variables

# Imports
import numpy as np
import matplotlib.pyplot as plt

t = np.arange(-100, 100, 0.01)
x = np.square(t)
y = np.array((t)**3-3*t)
print(t,x,y)


# Set axes limits
plt.xlim(0,5)
plt.ylim(-4,4)

plt.plot(x,y)
plt.show()

