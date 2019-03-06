#!python
# -*- coding: utf-8 -*-
"""
**Author:** Bhishan Poudel; Physics PhD Student, Ohio University

**Date:** Oct 05, 2016

**Last update:** Jul 14, 2017 Fri

**Usage:**::
  python argparse_3.py 1 2 --opt_arg 3 --switch

"""
# Imports
import argparse

def example3():
    """ Example."""
    
    # Instantiate the parser
    parser = argparse.ArgumentParser(description='Optional app description')

    # Required positional argument
    parser.add_argument('pos_arg', type=int,
                        help='A required integer positional argument')

    # Optional positional argument
    parser.add_argument('opt_pos_arg', type=int, nargs='?',
                        help='An optional integer positional argument')

    # Optional argument
    parser.add_argument('--opt_arg', type=int,
                        help='An optional integer argument')

    # Switch
    parser.add_argument('--switch', action='store_true',
                        help='A boolean switch')

    args = parser.parse_args()

    print("Argument values:")
    print(args.pos_arg)
    print(args.opt_pos_arg)
    print(args.opt_arg)
    print(args.switch)

    if args.pos_arg > 10:
        parser.error("pos_arg cannot be larger than 10")

    #Correct use:

    # python argparse_3.py 1 2 --opt_arg 3 --switch

if __name__ == '__main__':
    example3()
