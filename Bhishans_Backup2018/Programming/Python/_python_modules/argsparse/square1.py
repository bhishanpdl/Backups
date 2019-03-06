#!python
# -*- coding: utf-8 -*-
"""
**Author:** Bhishan Poudel; Physics PhD Student, Ohio University

**Date:** Oct 05, 2016

**Last update:** Jul 14, 2017 Fri

**Usage:**::
  python square1.py 5

"""
# Imports
import argparse

def example5():
    """Calcuate power.
    
    Usage:
        python square1.py 5
        
    """    
    parser = argparse.ArgumentParser()
    parser.add_argument("square", type=int,
                        help="display a square of a given number")
    parser.add_argument("-v", "--verbosity", action="count", default=0,
                        help="increase output verbosity")
    args = parser.parse_args()
    answer = args.square**2
    if args.verbosity >= 2:
        print("the square of {} equals {}".format(args.square, answer))
    elif args.verbosity >= 1:
        print("{}^2 == {}".format(args.square, answer))
    else:
        print(answer)

if __name__ == '__main__':
    example5()
