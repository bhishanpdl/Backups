#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Fri Mar 24, 2017
# Last update :
# Est time    :
# Ref: https://docs.python.org/2/library/bisect.html

# Imports
from bisect import bisect


def grade(score, breakpoints=[60, 70, 80, 90], grades='FDCBA'):
    i = bisect(breakpoints, score)
    return grades[i]


a = [grade(score) for score in [33, 99, 77, 70, 89, 90, 100]]
print(a)
