#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-12-2016 Wed
# Last update :
#
#
# Imports
from math import sqrt
from joblib import Parallel, delayed

a = Parallel(n_jobs=2)(delayed(sqrt)(i ** 2) for i in range(10))
print('\n')
print(a)
