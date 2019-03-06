#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jun 05, 2017 Mon
# Last update : 
# ref: http://stackoverflow.com/questions/7207309/python-how-can-i-run-python-functions-in-parallel

#
# Imports
import time
from multiprocessing import Process

def func1():
  print 'func1: starting'
  for i in xrange(4):
    print i
  print 'func1: finishing'

def func2():
  print 'func2: starting'
  for i in xrange(3):
    print i
  print 'func2: finishing'
  
def func3():
  print 'fun3: starting'
  for i in xrange(10):
    print i
  print 'func3: finishing'

#if __name__ == '__main__':
#  p1 = Process(target=func1)
#  p1.start()
#  p2 = Process(target=func2)
#  p2.start()
#  p1.join()
#  p2.join()

def runInParallel(*fns):
  proc = []
  for fn in fns:
    p = Process(target=fn)
    p.start()
    proc.append(p)
  for p in proc:
    p.join()

if __name__ == '__main__':
  runInParallel(func1, func2,func3)
  

