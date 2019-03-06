#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 24, 2016


# Imports
import numpy as np

t = np.arange(2, 10, 2) ; print(t)
t1 = np.arange(1, 4, 0.5) ; print(t1)  # last digit is not included

x = np.square(t) ; print(x)

y = np.array( (t)**3 - 3*t ); print(y)

z = np.array( (-1/t) ); print(z)
z1 = np.array( (-1.0/t) ); print(z1)
z2 = np.array( (-1.0/(t**2)) ); print(z2)

a = 5.0
z3 = np.array( np.sqrt(a*a + t**2 )  ) ; print(z3)
z4 = np.array( z3**2  ) ; print(z4)


