#!python
# -*- coding: utf-8 -*-
"""This program makes a realistic simulation of LSST images.

.. note:: TDCR is transform-distort-convolve-rescale:

  - jeditransform will transforms bulge-disk fitsfiles and creates 12420 zipped stamps and also create dislist.txt.
  - jedidistort will distort the zipped stamps according to the dislist.txt and writes 12420 unzipped distorted fitsfiles.
  - jedipaste will combine these 12420 distorted images into one large HST.fits according to distortedlist.txt.
  - jediconvolve will convolve HST.fits with psfb.fits or psfd.fits or psfm.fits and creates 6 convolved bands.
  - jedipaste will combine these 6 convolved bands and create HST_convolved_image.
  - jedirescale will scale down this HST_convolved_image to lsst_bulge.fits and so on.

:Runtime:

  10 minutes for only one of 21 loops. (July 27, 2017)

"""
# Imports
from __future__ import print_function, unicode_literals, division, absolute_import
import subprocess, sys, shutil, time, argparse, os
import math
import re
import copy
import numpy as np
from astropy.io import fits
# local imports
from util import replace_outfolder, run_process, updated_config

def debug():
    config = updated_config('physics_settings/configd.sh')
    rescaled_outfile = config['rescaled_outfiled']
    print("Debugging:")
    print(config['catalog_file']) # jedisim_out/out0/scaled_disk/trial1_catalog.txt
    print(config['dislist_file']) # jedisim_out/out0/scaled_disk/trial1_dislist.txt
    run_process("jeditransform", ['./executables/jeditransform',
                                  config['catalog_file'],
                                  config['dislist_file']
                                  ])


def lsst_TDCR(config, psf_name, rescaled_outfile):
    """Create a single lsst_bulge or lsst_disk or lsst_bulge_disk image
    images after running 6 programs. We will add noise to this later.

    Args:
      config_path (str): input physics config file.
        e.g. physics_settings/configb.sh
        e.g. physics_settings/configd.sh

      psf_names (str): input psf file for scaled_bulge or unscaled_disk
        e.g. config['psfb'] = psf/psfb.fits
        e.g. config['psfd'] = psf/psfd.fits

      rescaled_outfile (str): output after running 6 programs.
        This is the final output of program jedirescale.
        e.g. config['rescaled_outfileb'] = lsst_bulge.fits
        e.g. config['rescaled_outfiled'] = lsst_disk.fits
        e.g. config['rescaled_outfilebd'] = lsst_bulge_disk.fits

    :Outputs: The outputs are following:

      jedisim_out/out0/lsst_bulge.fits # gcb
      jedisim_out/out0/lsst_disk.fits  # gcd
      jedisim_out/out0/lsst_bulge_disk.fits # gcm

    Note that we combine these two files and call it chromatic lsst.fits.
    We convolve this image with monochromatic psf and call that lsst_mono.fits.

    :Runtime: 5 min 44 sec for 201 scaled bulge galaxies.

    """
    # Transform scaled_bulge or scaled_disk fitsfiles according to:
    # jedisim_out/out0/scaled_bulge/trial1_catalog.txt.
    #
    # jeditransform will create 12420 .gz fitsfiles. For example:
    # jedisim_out/out0/scaled_bulge/stamp_0/stamp_0_to_999.fits.gz  (for stamps 0 to 12 )
    #
    # It also creates dislist for the jedidistort,viz.,
    # jedisim_out/out0/scaled_bulge/trial1_dislist.txt
    print("Running lsst_TDCR for : {}".format(rescaled_outfile))
    run_process("jeditransform", ['./executables/jeditransform',
                                  config['catalog_file'],
                                  config['dislist_file']
                                  ])

    # This program distorts the 12420 galaxies from jedisim_out/out0/stamp_/
    # according to dislist.txt and lens.txt and write distorted
    # galaxies inside 13 folders jedisim_out/out0/distorted_/
    #
    # In the end we get unzipped distorted images in 13 folders.
    # jedisim_out/out0/distorted_0/distorted_0.fits 1000*12+ 420 fitsfiles.
    run_process("jedidistort", ['./executables/jedidistort',
                                config['nx'],
                                config['ny'],
                                config['dislist_file'],
                                config['lens_file'],
                                config['pix_scale'],
                                config['lens_z']
                                ])

    # This program combines 12,420 distorted fits files inside the
    # jedisim_out/out0/distorted_/distorted_fits/
    # into a single large embedded image: jedisim_out/out0/HST.fits.
    run_process("jedipaste", ['./executables/jedipaste',
                              config['nx'],
                              config['ny'],
                              config['distortedlist_file'],
                              config['HST_image']
                              ])

    # Convolve the given single fitsfile with given PSF and write 6 bands
    # of convolved images.
    # E.g. convolve HST.fits with psfb.fits to get 6 bands of convolved images.
    run_process("jediconvolve", ['./executables/jediconvolve',
                                 config['HST_image'],
                                 psf_name,
                                 config['output_folder'] + 'convolved/'
                                 ])

    # Combine 6 convolved bands into one HST_convolved image.
    run_process("jedipaste", ['./executables/jedipaste',
                              config['nx'],
                              config['ny'],
                              config['convolvedlist_file'],
                              config['HST_convolved_image']
                              ])

    # Change the PIXSCALE of the input fitsfile into another one.
    # e.g. HST has pixscale 0.06 and we change it to LSST pixscale = 0.2
    # This gives convolved scaled files gcsb, gcsd, gcsm
    # gcsb = rescaled_outfileb = jedisim_out/out0/scaled_bulge/lsst_bulge.fits
    run_process("jedirescale", ['./executables/jedirescale',
                                config['HST_convolved_image'],
                                config['pix_scale'],
                                config['final_pix_scale'],
                                config['x_trim'],
                                config['y_trim'],
                                rescaled_outfile
                                ])


def lsst_monochromatic(config):
    """Convolve lsst chromatic with psf_mono.fits and get monochromatic image.

    :Output: jedisim_out/out0/lsst_mono.fits

    """
    # Add noise to  monochromatic image and choose this as lsst_mono final output.
    # jedisim_out/out0/scaled_bulge_disk/trial1_lsst_mono.fits  # main output 2
    run_process("jedinoise", ['./executables/jedinoise',
                              config['rescaled_outfilem'],
                              config['exp_time'],
                              config['noise_mean'],
                              config["lsst_mono"]
                              ])

def lsst_chromatic(configb,configd,configm):
    """Combine lsst_bulge and lsst_disk and take this as chromatic.

    :Output: jedisim_out/out0/lsst.fits # main output 1

    """

    # Combine lsst_bulge with lsst_disk and call it lsst_unnoised.fits
    dat = fits.getdata(configb['rescaled_outfileb']) + fits.getdata(configd['rescaled_outfiled'])
    fits.writeto(configm["lsst_unnoised"], dat, header = fits.getheader(configb['rescaled_outfileb']), overwrite=True)


    # Add noise to  chromatic image and choose this as lsst final output.
    # jedisim_out/out0/scaled_bulge_disk/trial1_lsst.fits  # main output 1
    run_process("jedinoise", ['./executables/jedinoise',
                              configm['lsst_unnoised'],
                              configm['exp_time'],
                              configm['noise_mean'],
                              configm["lsst"]
                              ])


def main():
    """Run main function."""

    # Config dictionaries
    configb = updated_config('physics_settings/configb.sh')
    configd = updated_config('physics_settings/configd.sh')
    configm = updated_config('physics_settings/configm.sh')

    # NOTE: we should first create output dirs and catalogs before running
    # this jedisimulate program.

    # Get convolved scaled files g_csb, g_csd , and g_csm
    lsst_TDCR(configb, configb['psfb'], configb['rescaled_outfileb']) # out 3
    lsst_TDCR(configd, configd['psfd'], configd['rescaled_outfiled']) # out 4
    lsst_TDCR(configm, configm['psfm'], configm['rescaled_outfilem']) # out 5


    # get final monochromatic image
    # jedisim_out/out0/scaled_bulge_disk/trial1_lsst_mono.fits # main out 2
    lsst_monochromatic(configm)

    # get final chromatic image
    # jedisim_out/out0/scaled_bulge_disk/trial1_lsst.fits # main out 1
    lsst_chromatic(configb,configd,configm)


if __name__ == "__main__":
    import time

    # Beginning time
    program_begin_time = time.time()
    begin_ctime        = time.ctime()

    #  Run the main program
    # main()
    debug()

    # comment time print, we will print from runner program.

    # # Print the time taken
    # program_end_time = time.time()
    # end_ctime        = time.ctime()
    # seconds          = program_end_time - program_begin_time
    # m, s             = divmod(seconds, 60)
    # h, m             = divmod(m, 60)
    # d, h             = divmod(h, 24)
    # print("\nBegin time: ", begin_ctime)
    # print("End   time: ", end_ctime, "\n")
    # print("Time taken: {0: .0f} days, {1: .0f} hours, \
    #   {2: .0f} minutes, {3: f} seconds.".format(d, h, m, s))
