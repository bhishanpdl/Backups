#!/usr/bin/python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jul 17, 2017 Mon
# Est time    : 3 min for one galaxy one filter.
# Main commands : rm -rf imgblock.fits subcomps.fit ; galfit expdisk_devauc.sh
#                 galfit -o3 galfit.01 && rm -r galfit.01
#                 ds9 -multiframe imgblock.fits subcomps.fits &
#
# Imports
import time
import subprocess

def main():
    """To run galfit we should set python as python2.
    Galfit internally uses python2.
    
    """
    cmd = """ic '1 0 %1 0 == ?'  galaxies/sect23_f814w_gal0.fits  > mask.fits;
             rm -rf imgblock.fits subcomps.fit ;
             galfit expdisk_devauc.sh;
             galfit -o3 galfit.01 && rm -rf galfit.01;
             ds9 -multiframe imgblock.fits subcomps.fits &
    """
    subprocess.call(cmd,shell=True)
    

if __name__ == '__main__':

    # beginning time
    program_begin_time = time.time()
    begin_ctime = time.ctime()

    # run main program
    main()

    # print the time taken
    program_end_time = time.time()
    end_ctime = time.ctime()
    seconds = program_end_time - program_begin_time
    m, s = divmod(seconds, 60)
    h, m = divmod(m, 60)
    d, h = divmod(h, 24)
    print('\nBegin time: ', begin_ctime)
    print('End   time: ', end_ctime, '\n')
    print("Time taken: {0:.0f} days, {1:.0f} hours, \
          {2:.0f} minutes, {3:f} seconds.".format(d, h, m, s))
