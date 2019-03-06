#!python
# -*- coding: utf-8 -*-
"""
:Author:  Bhishan Poudel; Physics Graduate Student, Ohio University

:Date: Aug 01, 2016

:Last update: Oct 2, 2017

:Inputs:

  1. jedimaster.py, especially the final outputs

:Outputs:
  1. jedisim_output/lsst*.fits
  2. jedisim_output/90_lsst*.fits
  3. jedisim_output/aout10_noise*.fits
  4. jedisim_output/90_aout10_noise*.fits

:Info:
  1. This is a wrapper to run jedisim program and collect it's outputs.
  2. We copy the files from each iteration and name them appropriately.

:Runtime:


"""
# Imports
from __future__ import print_function, unicode_literals, division, absolute_import
from astropy.cosmology import FlatLambdaCDM
import os
import sys
import subprocess
import math
import re
import shutil
import copy
import time
from util import run_process,updated_config,replace_outfolder

# start time
start_time = time.time()
start_ctime = time.ctime()


# Global Variables
config_path = "physics_settings/configb.sh"

def jedisim_outfolders():
    config = updated_config(config_path)
    jouts = {}
    z = config['fixed_redshift']

    # five galaxies, three psfs, and two texts.
    keys = ['lsst','mono','gcsb','gcsd','gcsm', 'psfb','psfd','psfm','catalog','dislist']
    odirs = ['jedisim_output/jout_z{}_2017'.format(z) + time.strftime("_%b_%d_%H_%M/z{}/{}/".format(z,key)) for key in keys ]
    for i, odir in enumerate(odirs):
        # replace output dirs
        replace_outfolder(odir)
        replace_outfolder(odir[0:-1]+'90/')

        # also create dictionary
        jouts[keys[i]] = odirs[i]
        jouts[keys[i]+'90'] = odirs[i][0:-1]+'90/'

    return jouts

def run_jedimaster(start, end):

    # create outfolders and get their names.
    jouts = jedisim_outfolders()

    # Write output names in dropbox textfile.
    computer = 'simplici'
    odir = '/Users/poudel/Dropbox/jout'
    tm = time.strftime("_%b_%d_%H_%M")
    if not os.path.isdir(odir):
        os.makedirs(odir)
    otxt =  '{}/jout_{}_z{}_2017{}.txt'.format(odir,computer,z,tm)

    # Create empty textfile in dropbox to be added later.
    print('Creating: {}'.format(otxt))
    with open(otxt,'w') as fo:
        fo.write("")


    # Run jedimaster in a loop
    for i in range(start, end+1):

        # Indivisual times
        loop_start_time = time.time()
        print('{} {} {}'.format('Running jedimaster loop :', i, ''))



        run_process("jedimaster.py", ['python', "jedimaster.py"])

        # Copy lsst file
        infile = r'jedisim_out/out0/scaled_bulge_disk/trial1_lsst.fits'
        outfile = jouts['lsst'] + 'lsst_z{}_{}.fits'.format(z,i)
        shutil.copyfile(infile, outfile)
        print('From and To for Loop {}: \n{}'.format(i, infile))
        print('{}\n'.format(outfile))

        # Copy lsst_mono file
        infile = r'jedisim_out/out0/scaled_bulge_disk/trial1_lsst_mono.fits'
        outfile = jouts['lsst_mono'] + 'lsst_mono_z{}_{}.fits'.format(z,i)
        shutil.copyfile(infile, outfile)
        print('From and To for Loop {}: \n{}'.format(i, infile))
        print('{}\n'.format(outfile))

        # Copy gcsb
        infile = r'jedisim_out/out0/scaled_bulge/lsst_bulge.fits'
        outfile = jouts['gcsb'] + 'gcsb_z{}_{}.fits'.format(z,i)
        shutil.copyfile(infile, outfile)
        print('From and To for Loop {}: \n{}'.format(i, infile))
        print('{}\n'.format(outfile))

        # Copy gcsd
        infile = r'jedisim_out/out0/scaled_disk/lsst_disk.fits'
        outfile = jouts['gcsd'] + 'gscd_z{}_{}.fits'.format(z,i)
        shutil.copyfile(infile, outfile)
        print('From and To for Loop {}: \n{}'.format(i, infile))
        print('{}\n'.format(outfile))

        # Copy gcsm
        infile = r'jedisim_out/out0/scaled_bulge_disk/lsst_bulge_disk.fits'
        outfile = jouts['gcsm'] + 'gscm_z{}_{}.fits'.format(z,i)
        shutil.copyfile(infile, outfile)
        print('From and To for Loop {}: \n{}'.format(i, infile))
        print('{}\n'.format(outfile))

        # Copy psfb
        infile = r'psf/psfb.fits'
        outfile = jouts['psfb'] + 'psfb_z{}_{}.fits'.format(z,i)
        shutil.copyfile(infile, outfile)
        print('From and To for Loop {}: \n{}'.format(i, infile))
        print('{}\n'.format(outfile))

        # Copy psfd
        infile = r'psfd.fits'
        outfile = jouts['psfd'] + 'psfd_z{}_{}.fits'.format(z,i)
        shutil.copyfile(infile, outfile)
        print('From and To for Loop {}: \n{}'.format(i, infile))
        print('{}\n'.format(outfile))

        # Copy psfm
        infile = r'psfm.fits'
        outfile = jouts['psfm'] + 'psfm_z{}_{}.fits'.format(z,i)
        shutil.copyfile(infile, outfile)
        print('From and To for Loop {}: \n{}'.format(i, infile))
        print('{}\n'.format(outfile))




        # Append output names in Dropbox
        hostname = 'simplici'
        loop_end_time = time.time()
        loop_time =  loop_end_time - loop_start_time

        loop_mins = loop_time / 60
        date = time.ctime()
        with open(otxt,'a') as fo:
            fo.write('{} {}: Runtime {:.0f} mins and EndDate: {}\n{}\n\n'.format(hostname, i, loop_mins, date,outfile1))


def main():
    """Run main function."""
    # Before running jedimaster, create config files
    z = 0.7
    run_process("Create configs", ['python', "a1_jedisim_config.py -z ", str(z)]) # physics_settings/configb.sh, configd.sh, configm.sh
    run_process("Interpolate sed", ['python', "a2_interpolate_sed.py -z ", str(z)])
    run_process("Create jedicolor_args.txt", ['python', "a3_jcol_args.py -z ", str(z)])

    # Now run the loop
    # start, end inclusive

    # no. of loop = end - start + 1
    start, end = 0,1
    run_jedimaster(start, end)


if __name__ == "__main__":
    # Beginning time
    program_begin_time = time.time()
    begin_ctime        = time.ctime()

    #  Run the main program
    jouts = jedisim_outfolders()
    print("jouts['lsst90'] = {}".format(jouts['lsst90']))

    # Print the time taken
    program_end_time = time.time()
    end_ctime        = time.ctime()
    seconds          = program_end_time - program_begin_time
    m, s             = divmod(seconds, 60)
    h, m             = divmod(m, 60)
    d, h             = divmod(h, 24)
    print("Begin time: ", begin_ctime)
    print("End   time: ", end_ctime, "\n")
    print("Time taken: {0: .0f} days, {1: .0f} hours, \
      {2: .0f} minutes, {3: f} seconds.".format(d, h, m, s))
