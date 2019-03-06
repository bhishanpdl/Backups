import numpy as np

col0, col1, col2 = np.loadtxt("color.txt", skiprows=0, unpack=True,
                               dtype='str', usecols=(0, 1, 2))

print(col0)
print(col1)
print(col2)
