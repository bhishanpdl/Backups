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
  print('func1: starting')
  for i in range(4):
    print(i)
  print('func1: finishing')

def func2():
  print('func2: starting')
  for i in range(3):
    print(i)
  print('func2: finishing')
  
def func3():
  print('fun3: starting')
  for i in range(10):
    print(i)
  print('func3: finishing')


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
  

