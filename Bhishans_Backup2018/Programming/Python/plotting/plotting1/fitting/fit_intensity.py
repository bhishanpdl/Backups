# clear; python fit_intensity.py; rm *~

#!/usr/bin/env python
import numpy as np
import math
import matplotlib.pyplot as plt
from scipy import interpolate
from scipy.optimize import minimize

inputf = '77r.dat'
pixel, intensity, int_err = np.loadtxt(inputf, dtype='f8', comments='#', usecols=(1,2,3), unpack=True)
#tck = interpolate.splrep(pixel,intensity, s=0)
#I_0 = interpolate.splev(0.0, tck, der=0)
#print I_0, intensity[0]
#use luminosity distance of NGC7768, 110Mpc, m-M=35.20
#MAG = mag-36.2

num_points = len(intensity)
print num_points

params = np.array([1000.0,5.0,1.0])
def fitfun(params):
    diff = 0.0
    for i in range(num_points):
        diff += (intensity[i]- params[0]*math.exp(-params[1]*pixel[i]**params[2]))**2.0/int_err[i]**2.0
    return diff
        
res = minimize(fitfun, params, method='Powell')
print res
      
[c1, c2, c3] = res.x
n = 1./c3
x = np.linspace(0, pixel[-1], 100)
y = np.array([c1*math.exp(-c2*x[i]**c3) for i in range(len(x))])

plt.errorbar(pixel, intensity, yerr=int_err, fmt='--o', label='Data')
plt.plot(x, y, label="Fitting function")
plt.xscale('log')
plt.yscale('log')
plt.legend(loc='upper right')

#plt.loglog(lnints, lnpix, '*')
plt.grid(True)
plt.xlabel('pixel')
plt.ylabel('Intensity')
plt.title(inputf)
figname = 'sNGC5v_intensity_pixel.eps'
plt.savefig(figname)
plt.show()

