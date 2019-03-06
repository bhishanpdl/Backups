#!/usr/bin/env python

#Bhishan Poudel
# Dec 8, 2015

from multiprocessing.pool import ThreadPool

def do_something(n):
    val = 0
    for i in xrange(n):
        for x in xrange(i):
            val += x
    return val

with ThreadPool(4) as p:
    nums = [2000,15000, 10000, 1000, 12000]
    p.map(do_something, nums)
