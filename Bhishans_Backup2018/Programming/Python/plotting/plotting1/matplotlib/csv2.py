import matplotlib.pyplot as plt
import numpy as np

x,y = np.loadtxt('example.txt',delimiter=',',unpack=True)

plt.xlabel('x')
plt.ylabel('y')
plt.title('graph1')
plt.legend()
plt.show()
