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
# Trailing 0s in n! = Count of 5s in prime factors of n!
#                   = floor(n/5) + floor(n/25) + floor(n/125) + ....

# time taken, oct 22 from 10 am to 3 pm, 5 hr and still not correct.

def zeros(n):
    fives = 0
    for number in range(2, n+1):
        while number > 0:
            if number % 5 == 0:
                fives += 1
                number = number/5
            else:
                break
    return fives


print(zeros(22))

