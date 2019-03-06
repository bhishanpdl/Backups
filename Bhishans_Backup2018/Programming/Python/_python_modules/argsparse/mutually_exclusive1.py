#!python
# -*- coding: utf-8 -*-
"""
**Author:** Bhishan Poudel; Physics PhD Student, Ohio University

**Date:** Oct 05, 2016

**Last update:** Jul 14, 2017 Fri

**Usage:** ::

  py mutually_exclusive1.py 1 2 -v

"""
# Imports
import argparse

def example4():
    """Calcuate power.
    
    
    .. note::
    
        py mutually_exclusive1.py 1 2 -v
        
    """
    
    parser = argparse.ArgumentParser(description="calculate X to the power of Y")
    group = parser.add_mutually_exclusive_group()
    group.add_argument("-v", "--verbose", action="store_true")
    group.add_argument("-q", "--quiet", action="store_true")
    parser.add_argument("x", type=int, help="the base")
    parser.add_argument("y", type=int, help="the exponent")
    args = parser.parse_args()
    answer = args.x**args.y

    if args.quiet:
        print(answer)
    elif args.verbose:
        print("{} to the power {} equals {},".format(args.x, args.y, answer))
    else:
        print("{}^{} == {}".format(args.x, args.y, answer))
        
if __name__ == '__main__':
    example4()
