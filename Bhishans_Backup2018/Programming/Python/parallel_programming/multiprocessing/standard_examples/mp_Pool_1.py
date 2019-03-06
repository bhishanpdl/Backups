#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-12-2016 Wed
# Last update :
#
# Info:
#
# Imports
from multiprocessing import Pool
import contextlib

def f(x):
    return x*x

if __name__ == '__main__':
    with contextlib.closing(Pool(processes=4)) as pool:
        print(pool.map(f, range(10)))
    pool.terminate()  # contextlib does not do this.


# For python3
# may not use contextlib and with Pool(processes=4)) as pool:

# method without using with

print('{} {} {}'.format('\nmethod2 without the use of "with"','', ''))
pool = Pool(processes=4)            # start 4 worker processes
print(pool.map(f, range(10)))       # prints "[0, 1, 4,..., 81]"
pool.terminate()
