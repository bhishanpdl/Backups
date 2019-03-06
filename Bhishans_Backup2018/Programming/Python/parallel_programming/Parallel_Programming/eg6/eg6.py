#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 14, 2016
# Ref     : https://stackoverflow.com/questions/22064546/python-multiprocessing-memory-management-for-a-loop-over-multidimensional-array?rq=1


# Imports
import numpy as np
import multiprocessing as mp


def loop(arg):
    max_n, a, b, c, a0, b0, c0 = arg
    res_total = np.zeros(shape, dtype=np.float)
    print 'starting'
    for _ in range(max_n):
        rad = np.sqrt((a - a0) ** 2 + (b - b0) ** 2 + (c - c0) ** 2)
        res_total = res_total + rad
    print 'done'
    return res_total


def rand_function(a, b, c, a0, b0, c0):
    c_cpu = mp.cpu_count()
    n_loop = 10
    print "No. of processors : ", c_cpu
    pool = mp.Pool(c_cpu)
    out = pool.map(loop, [(n_loop / c_cpu, a, b, c, a0, b0, c0)
                             for _ in range(c_cpu)])

    print 'collating'
    final_result = np.zeros(shape, dtype='float')
    for i in out:
        final_result += i
    print final_result.shape


shape = (50, 50, 50)
rand_function(np.arange(0, 250, 5), np.arange(0, 250, 5),
                  np.arange(0, 250, 5), 540, 26, 826)
