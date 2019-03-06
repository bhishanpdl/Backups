#!/usr/bin/python

#bp: clear; python main.py

# for same path
import mymodule1
from mymodule2 import b1,b2,b3

# for different path
import sys

pathname = '/home/bhishan/OneDrive/Programming/Python/pyprograms/SeparateCompln/mylib'

sys.path.insert(0, pathname )
import mymodule3
from mymodule4 import d2

###############################################################################
print mymodule1.a1()
print b2()

print mymodule3.c3()
print d2()
