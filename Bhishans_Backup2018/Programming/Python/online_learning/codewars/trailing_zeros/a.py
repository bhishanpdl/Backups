#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-22-2016 Sat
# Last update :
#
#
# Write a program that will calculate the number of trailing zeros in a
# factorial of a given number.

# N! = 1 * 2 * 3 * 4 ... N

# zeros(12) = 2 #  1 * 2 * 3 .. 12 = 479001600
# that has 2 trailing zeros 4790016(00)
# Be careful 1000! has length of 2568 digital numbers.

def zeros(n):

    """
    Number of trailing zeros in a factorial of a number is given by
    n = sum i to k  floor (n/5^i)  ,
        where, 5^(k+1) > n   and k is a integer

    Ref: https://en.wikipedia.org/wiki/Trailing_zero

    """
    from math import sqrt,log,floor,ceil

    n = int(n)
    trailling_zeros = 0

    if n<5:
        return 0

    if n == 5:
        return 1

    if n >5:
        k = int(ceil(log(n-5) - 1))
        #print('{} {} {}'.format('k = ',k, ''))

        for i in range(1,k+1):
            #print('{} {} {}'.format('i = ',i, ''))
            trailling_zeros += int(floor(float(n)/(5**i)))

    return trailling_zeros

print(zeros(4))
print(zeros(5))
print(zeros(10))

