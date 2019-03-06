#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Tue Mar 14, 2017


# Imports
import numpy as np
from scipy.integrate import simps


col1, col2 = np.genfromtxt("data.txt", delimiter=None,
                           usecols=(0, 1), dtype=None, unpack=True)
mysum = simps(col1)
print(mysum)
