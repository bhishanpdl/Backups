#!python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 05, 2016
# Last update :
#
# Ref: https://www.oreilly.com/learning/20-python-libraries-you-arent-using-but-should
#
# Imports
from collections import namedtuple

def main():
    
    A = namedtuple('A', 'count enabled color')
    tup = A(count=1, enabled=True, color="red")
    print(tup.count) # 1


    print(tup.enabled) # True
    print(tup.color) # "red"
    print(tup) # A(count=1, enabled=True, color='red')

    ##======================================================================
    print('{} {} {}'.format('\nexample2','', ''))
    def f():
        return 2, False, "blue"

    count, enabled, color = f()

    tup = f()
    enabled = tup[1]
    print(tup)

if __name__ == '__main__':
    main()
