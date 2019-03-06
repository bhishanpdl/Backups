#!/usr/bin/env python

# Bhishan Poudel
# Dec 8, 2015

# clear; python a.py ; rm *~

import multiprocessing
import time

def clock(interval):
    while True:
        print("The time is %s" % time.ctime())
        time.sleep(interval)
    
if __name__== '__main__':
    p = multiprocessing.Process(target=clock, args=(2,))  # prints time after args seconds
    p.start()
