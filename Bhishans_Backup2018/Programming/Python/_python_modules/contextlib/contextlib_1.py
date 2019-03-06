#!python
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
    pool.terminate()
