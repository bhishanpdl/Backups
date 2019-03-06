#!/usr/bin env python

# Bhishan Poudel
# Nov 11, 2015
# ref: http://blog.dominodatalab.com/simple-parallelization/

# cmd: clear; unsetenv PYTHONHOME; unsetenv PYTHONPATH; python parallel1.py

# cmd: clear; python parallel1.py

from joblib import Parallel, delayed  
import multiprocessing

# what are your inputs, and what operation do you want to 
# perform on each input. For example...
inputs = range(10)  
def processInput(i):  
    return i * i

num_cores = multiprocessing.cpu_count()

results = Parallel(n_jobs=num_cores)(delayed(processInput)(i) for i in inputs)

print('num of cores =', num_cores)
print('results = ', results)
