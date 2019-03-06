#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-21-2016 Fri
# Last update :
#
#
# Imports
def is_prime(num):

    if num == 2 or num == -2:
        return True

    if num == 0 or num == 1 or num == -1:
        return False

    num = abs(int(num))
    for i in list(range(2,num)):
        if num % i == 0:
            return False

    return True

print(is_prime(-72))





##======================================================================
## method2
##======================================================================
# -*- coding: utf-8 -*-
def is_prime(num):
    import math

    # There's only one even prime: 2
    if num < 2    : return False
    if num == 2   : return True
    if num %2 == 0: return False


    """
    Property:
        Every number n that is not prime has at least one prime divisor p
        such 1 < p < square_root(n)
    """
    root = int(math.sqrt(num))

    # We know there's only one even prime, so with that in mind
    # we're going to iterate only over the odd numbers plus using the above property
    # the performance will be improved
    for i in xrange(3, root+1, 2):
        if num % i == 0: return False

    return True




##======================================================================
## method 2
##======================================================================
def is_prime(num):
    return num > 1 and not any(num % n == 0 for n in range(2,num))
