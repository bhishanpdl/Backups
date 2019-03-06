from matplotlib import pyplot as plt
import numpy as np


x,y = np.loadtxt('test.csv',
                 unpack=True,
                 delimiter = ',')

plt.plot(x,y)

plt.title('Epic Info')
plt.ylabel('Y axis')
plt.xlabel('X axis')

plt.show()
