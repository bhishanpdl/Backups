#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-20-2016 Thu
# Last update :
#
#
# Imports
def tickets(people):

    res = "YES"

    for p in people:
        if not people[0] == 25:
            res = "NO"

        if len(people) > 1:
            if people[1] > 50  :
                res = "NO"
        if len(people) > 2:
            if people[2] == 100  :
                res = "NO"


    return res
print(tickets([50]))
print(tickets([25,25,100]))
print(tickets([25,100,25,100]))
print("\n")
print(tickets([25,25,25,100]))
print(tickets([25,50,25,100]))
# if len people >=5 answer is always yes if it goes upto there.
