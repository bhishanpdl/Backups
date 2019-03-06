#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Mar 15, 2016


# Imports
import os, sys, subprocess, math, re, shutil,copy
from multiprocessing import Process

#function to run a program and write output to the shell
#==============================================================================
def run_process(name, args,):
    print("-----------------------------------------------------------")
    print("Running: %s"%name)
    print("Command:")
    for arg in args:
        print(arg, end=' ')
    print("")
    print("-----------------------------------------------------------")
    process = subprocess.Popen(args)

    process.communicate()
    if process.returncode != 0:
        print("Error: %s did not terminate correctly. Return code: %i." \
               %(name, process.returncode))
        sys.exit(1)  # this will exit the code in case of error
#==============================================================================


def func1():
  print('func1: starting')
  run_process("prog1.c", ['./prog1'])
  print('func1: finishing')

def func2():
  print('func2: starting')
  run_process("prog2.c", ['./prog2'])
  print('func2: finishing')

def func3():
  print('fun3: starting')
  run_process("prog3.c", ['./prog3', 'first argument'])
  print('func3: finishing')

def func4():
  print('fun4: starting')
  print('func4: finishing')

#if __name__ == '__main__':
#  p1 = Process(target=func1)
#  p1.start()
#  p2 = Process(target=func2)
#  p2.start()
#  p3 = Process(target=func1)
#  p3.start()
#  p4 = Process(target=func2)
#  p4.start()
#  p1.join()
#  p2.join()
#  p3.join()
#  p4.join()

def runInParallel(*fns):
  proc = []
  for fn in fns:
    p = Process(target=fn)
    p.start()
    proc.append(p)
  for p in proc:
    p.join()

if __name__ == '__main__':
  runInParallel(func1,func2,func3,func4)


