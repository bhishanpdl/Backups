#!/usr/bin/env python3

# integrate ax from 0 to 3 with a = 5
# using scipy.integrate.quad
# intgrand = 5x
# limit    = 0 to 3
# ans      = 5x**2/2 = 2.5 x**2 
from scipy import integrate
import numpy as np
a = 5

# lambda method
fun = lambda a,x: a*x

# function method
def fun(a,x):
    return a*x


y = integrate.quad(fun, 0, 3, args=(a))

print(y)

y2 = 2.5 * (3**2 - 0**2)
print(y2)
