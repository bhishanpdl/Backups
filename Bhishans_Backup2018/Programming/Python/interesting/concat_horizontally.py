#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel, Physics PhD Student, Ohio University
# Date        : Jun 15, 2017 Thu
# Last update : 
#
# Imports
import numpy as np
import pandas as pd
import time

m1 = np.array([[1,2,3], [4,5,6]])
m2 = np.array([[7,8,9], [10,11,12]])

m3 = np.hstack((m1,m2))
print('m3 = ', m3)
