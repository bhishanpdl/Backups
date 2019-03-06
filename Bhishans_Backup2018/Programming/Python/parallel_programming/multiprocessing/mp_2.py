#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-12-2016 Wed
# Last update :
#
#
# Imports
import multiprocessing
import time

data = (
    ['a', '2'], ['b', '4'], ['c', '6'], ['d', '8'],
    ['e', '1'], ['f', '3'], ['g', '5'], ['h', '7']
)

def mp_worker((inputs, the_time)):
    print " Processs %s\tWaiting %s seconds" % (inputs, the_time)
    time.sleep(int(the_time))
    print " Process %s\tDONE" % inputs

# general approach
def mp_handler():
    p = multiprocessing.Pool(2)
    p.map(mp_worker, data)


# If you want "a lock for each pool limit" so that your
# processes run in tandem pairs, ala:
# A waiting B waiting | A done , B done | C waiting , D waiting | C ...
def mp_handler2():
    subdata = zip(data[0::2], data[1::2])
    for task1, task2 in subdata:
        p = multiprocessing.Pool(2)
        p.map(mp_worker, (task1, task2))

if __name__ == '__main__':
    mp_handler()
