#!python
# -*- coding: utf-8 -*-
#
"""
**Author:** Bhishan Poudel; Physics PhD Student, Ohio University

**Date:** Oct 05, 2016

**Last update:** Jul 14, 2017 Fri

**Usage:**::

  python argparse_2.py -h
  python argparse_2.py 1 2 3 4
  python argparse_2.py 1 2 3 4 --sum
"""

# Imports
import argparse

def example():
    """ Example."""
    
    parser = argparse.ArgumentParser(description='Process some integers.')
    parser.add_argument('integers', metavar='N', type=int, nargs='+',
                        help='an integer for the accumulator')
    parser.add_argument('--sum', dest='accumulate', action='store_const',
                        const=sum, default=max,
                        help='sum the integers (default: find the max)')

    args = parser.parse_args()
    print (args.accumulate(args.integers))
    
if __name__ == '__main__':
    example()
