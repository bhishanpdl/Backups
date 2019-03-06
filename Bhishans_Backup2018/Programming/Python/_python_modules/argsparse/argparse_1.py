#!python
# -*- coding: utf-8 -*-

"""
**Author:** Bhishan Poudel; Physics PhD Student, Ohio University

**Date:** Oct 05, 2016

**Last update:** Jul 14, 2017 Fri

**Usage:**::

  python argparse_1.py -h
  python argparse_1.py
  python argparse_1.py -a 5 -b 6
"""


# Imports
import argparse


def mysum(a, b):
    """ Short script to add two numbers.
    
    >>> print ("This is a Doctest block")
    This is a Doctest block
    
    ximg
    """
    return a + b

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description="Add two numbers")
    parser.add_argument('-a',
                        help='First value',
                        type=float,
                        default=0)
    parser.add_argument('-b',
                        help='Second value',
                        type=float,
                        default=0)
    args = parser.parse_args()
    print(mysum(args.a, args.b))
