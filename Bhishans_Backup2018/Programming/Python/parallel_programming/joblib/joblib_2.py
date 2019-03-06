#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-12-2016 Wed
# Last update :
#
#
# Imports
from joblib import Parallel, delayed
import multiprocessing

# what are your inputs, and what operation do you want to
# perform on each input. For example...
inputs = range(10)
def processInput(i):
    return i * i

num_cores = multiprocessing.cpu_count()

results = Parallel(n_jobs=num_cores)(delayed(processInput)(i) for i in inputs)
print(results)
