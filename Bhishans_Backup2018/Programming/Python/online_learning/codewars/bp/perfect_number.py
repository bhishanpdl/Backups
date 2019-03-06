#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-24-2016 Mon
# Last update :
#
# Ref: https://en.wikipedia.org/wiki/Perfect_number
#


# Python Program to find Perfect Number using Functions
def perf(n):
    sum_ = 0
    for i in range(1, n):
        if n % i == 0:
            sum_ += i
    return sum_ == n


perf = lambda n: n == sum(i for i in range(1, n) if n % i == 0)
print(perf(6))
print(perf(28))
print(perf(496))
