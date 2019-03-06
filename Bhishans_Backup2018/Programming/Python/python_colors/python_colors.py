import matplotlib.pyplot as plt
import numpy as np

print (plt.style.available)
plt.style.use('seaborn-dark-palette')
plt.style.use('ggplot')

num_lines = 6

ax = plt.subplot(111)

for i in range(num_lines):
    x = np.linspace(0, 20, 200)
    ax.plot(x, np.sin(x) + i)

plt.show()
