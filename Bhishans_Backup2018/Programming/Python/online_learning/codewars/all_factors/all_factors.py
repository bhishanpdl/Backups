#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-24-2016 Mon
# Last update :
#
#


def factors(n):
    return set(sum([[i, n//i] for i in range(1, int(n**.5)+1) if not n%i], []))


print(factors(243))
