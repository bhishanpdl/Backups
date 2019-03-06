#!python
# -*- coding: utf-8 -*-#
"""
Utility Functions.
"""
# Imports
import argparse
import sys
import numpy as np
from matplotlib import pyplot as plt
import numpy.polynomial.polynomial as poly

# checking
# import statsmodels.api as sm # sm 0.8.0 gives FutureWarning




def read_data(infile):
    """Read the datafile and return arrays"""
    data = np.genfromtxt(infile, delimiter=None,dtype=int)
    X = data[:,0].reshape(len(data),1)
    t = data[:,-1].reshape(len(data),1)

    return [X, t]


def main():
    """Run main function."""
    pass




if __name__ == "__main__":
   import time

   # Beginning time
   program_begin_time = time.time()
   begin_ctime        = time.ctime()

   #  Run the main program
   main()


   # Print the time taken
   program_end_time = time.time()
   end_ctime        = time.ctime()
   seconds          = program_end_time - program_begin_time
   m, s             = divmod(seconds, 60)
   h, m             = divmod(m, 60)
   d, h             = divmod(h, 24)
   print("\n\nBegin time: ", begin_ctime)
   print("End   time: ", end_ctime, "\n")
   print("Time taken: {0: .0f} days, {1: .0f} hours, \
     {2: .0f} minutes, {3: f} seconds.".format(d, h, m, s))
