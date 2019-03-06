#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 06, 2016
# Last update :
#
# Ref: http://stackoverflow.com/questions/890128/why-are-python-lambdas-useful
#
# Imports
from __future__ import division, unicode_literals, print_function

mult3 = filter(lambda x: x % 3 == 0, [1, 2, 3, 4, 5, 6, 7, 8, 9])

# This sets mult3 to [3, 6, 9], those elements of the original list
# that are multiples of 3.
# This is shorter (and, one could argue, clearer) than

def filterfunc(x):
    return x % 3 == 0

mult3 = filter(filterfunc, [1, 2, 3, 4, 5, 6, 7, 8, 9])
print(mult3)

# Of course, in this particular case, you could do the same thing as
# a list comprehension:

mult3 = [x for x in [1, 2, 3, 4, 5, 6, 7, 8, 9] if x % 3 == 0]
print(mult3)

# (or even as
a = list(range(3,10,3))
print(a)

# but there are many other, more sophisticated use cases where you
# can't use a list comprehension and a lambda function may be the
# shortest way to write something out.
