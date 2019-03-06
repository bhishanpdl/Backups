#!/usr/bin/python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Feb 10, 2016


# Imports
from multiprocessing import Process

def f(name):
    print('hello', name)

if __name__ == '__main__':
    p = Process(target=f, args=('bob',))

p.start()
p.join()
