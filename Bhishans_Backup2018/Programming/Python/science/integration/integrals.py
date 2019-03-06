#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Tue Mar 14, 2017
# Last update :
# Est time    :

# Imports
from scipy.special import zeta
from scipy import integrate
from numpy import pi
import numpy as np
from numpy import exp

x = np.linspace(0, np.inf, 1e6)
f = x**2 / (np.e**2 -1)
f1 = lambda x: x**2 / (exp(x) -1)
#ans = integrate.simps(f,x)

#ans2 = integrate.quad(f1(x), x, 0, np.inf)
