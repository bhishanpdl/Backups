#!/usr/bin/python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Feb 10, 2016


# Imports
import multiprocessing
import time
def worker(num):

    print ("Worker"+str(num)+" start!")
    for i in range(30000000):
        abc = 123
    print ("Worker"+str(num)+" finished!")
    return



if __name__ == '__main__':
    jobs = []
    start = time.time()

    for i in range(5):
        p = multiprocessing.Process(target=worker, args=(i,))
        jobs.append(p)
        p.start()
        # p.join()


    for job in jobs:
        job.join()

    end = time.time()
    print (end - start)
