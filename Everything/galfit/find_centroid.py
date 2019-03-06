#!python
# -*- coding: utf-8 -*-#
"""
Find the brightest pixel coordinate of a image.

@author: Bhishan Poudel

@date:  Oct 27, 2017

@email: bhishanpdl@gmail.com

"""
# Imports
import time
import numpy as np
from astropy.io import fits
import subprocess

def find_max_coord():
    dat = np.genfromtxt('example_data.txt')
    print("dat = {}".format(dat))
    maxpos = np.unravel_index(np.argmax(dat), dat.shape)
    print("maxpos = {}".format(maxpos))


def bright_coord():
    with open('centroids_f8.txt','w') as fo:
        for i in range(201):
            pre = '/Users/poudel/Research/a1_data/original_data/stamps_new_0_200'
            infile = '{}/sect23_f814w_gal{}.fits'.format(pre,i)
            dat = fits.getdata(infile)
            x,y = np.unravel_index(np.argmax(dat), dat.shape)
            x,y = int(y+1) , int(x+1)
            print("{} {}".format(x, y), file=fo)

    

def main():
    """Run main function."""
    # find_max_coord()
    bright_coord()
    
    # # checking
    # i = 2
    # pre = '/Users/poudel/Research/a1_data/original_data/stamps_new_0_200'
    # infile = '{}/sect23_f814w_gal{}.fits'.format(pre,i)
    # ds9 = '/Applications/ds9.app/Contents/MacOS/ds9'
    # subprocess.call('{} {}'.format(ds9, infile), shell=True)
    
            
if __name__ == "__main__":
        import time, os
        
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
        print("End of Program: {}".format(os.path.basename(__file__)))
        print("\n")
        
