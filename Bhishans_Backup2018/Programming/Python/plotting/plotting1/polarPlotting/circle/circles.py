#In this calculation, l/M= a = 4.3. 
import numpy as np
import matplotlib.pyplot as plt
import math

a= 4.3
eps=0.0
x1 = np.arange(0.001,25.0,0.001)
x2 = np.arange(-30, 30, 0.001)
marker_on = [3768,14720]  # rmax,rmin / stepsize e.g. 3.768/.001

y1 = -(1/x1) + a**2/(2*x1**2) - a**2/(x1**3)
y2 = a**2-x2**2


#Sub plot 1: Veff vs. r/M. Showing minima and maxima.
plt.subplot(2, 2, 1)
plt.plot(x1, y1, 'k')
plt.plot(x1[marker_on], y1[marker_on], 'ko')
plt.ylim(-0.04,0.06)
plt.axhline(y=0,color="black")
plt.fill_between(x1,y1,-0.04,color="darkgray")
plt.ylabel(r'$V_{eff}$').set_rotation(0)

#Sub plot 2: Circular orbits for e = 0
plt.subplot(2, 2, 2)
circle1 = plt.Circle((0,0), 3.768, color='k', fill=False)
circle2 = plt.Circle((0,0), 14.72, color='k', fill=False)
circle3 = plt.Circle((0,0), 2, color = 'darkgray')
plt.gca().set_xlim((-30,30))
plt.gca().set_ylim((-30,30))
plt.gcf().gca().add_artist(circle1)
plt.gcf().gca().add_artist(circle2)
plt.gcf().gca().add_artist(circle3)

#Subplot 3: Veff vs. r/M. This time showing E and turning points. 
plt.subplot(2, 2, 3)
plt.plot(x1, y1, 'black')
plt.fill_between(x1,y1,-0.04,color="darkgray")
plt.ylim(-0.04,0.06)
plt.axhline(y=0, color="black")
plt.hlines(y=-0.028, xmin=11, xmax=22,
	   linewidth=2,linestyle='-', color = 'k')
plt.vlines(x=11, ymin=-0.028, ymax=0,
	   linewidth=2,linestyle='--', color = 'k')
plt.vlines(x=22, ymin=-0.028, ymax=0, 
	   linewidth=2,linestyle='--', color ='k')
plt.xlabel(r'$ \frac{r}{M}$')
plt.ylabel(r'$V_{eff}$').set_rotation(0)

#Subplot 4: Showing precesion of orbit due to GR correction.
plt.subplot(2, 2, 4)
circle1 = plt.Circle((0,0), 3.768, color='k', linestyle="dotted",fill=False)
circle2 = plt.Circle((0,0), 14.72, color='k', linestyle='dotted',fill=False)
circle3 = plt.Circle((0,0), 2, color = 'darkgray')
plt.gca().set_xlim((-30,30))
plt.gca().set_ylim((-30,30))
plt.gcf().gca().add_artist(circle1)
plt.gcf().gca().add_artist(circle2)
plt.gcf().gca().add_artist(circle3)

plt.show()

