#!/usr/bin/python

#cmd  : clear; python ptr2.py

def add(a, b): return a + b
tests = { (1,4):5, (0, 0):0, (-1, 3):3 }
for test, result in list(tests.items()):
   print('test: adding', test, '==', result, '---', add(*test) == result)
