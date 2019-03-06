#!/usr/bin/env python3
# -*- coding: utf-8 -*-#
#
# Author      : Bhishan Poudel; Physics Graduate Student, Ohio University
# Date        : Jan 4, 2017
# Update      : Jun 19, 2017 Mon


def find_color(f606, f814):
    """Find difference in magnitudes of f606 and f814 bands."""
    mag1 = getval(f606, 'MAG')
    mag2 = getval(f814, 'MAG')    
    galnum = re.search('(.+?)(\d+)(\.fits$)', f606).group(2)
    print(galnum, ':mag606 - mag814 = %.2f'%(mag1 - mag2))


def open_in_ds9(n, galfit_outputs):
    """Open fitsfiles in ds9 with some flgs.

    Arguments:     
    n:              galaxy number
    galfit_outputs: 'f814w_fitting'
    
    COLS = 6
    

    ds9 flgs:
        ds9 -scale log -cmap a -tile grid layout 6 4 -match colorbar
            -match scale -match scalelimits FITSFILES_NAMES

    Reference:
        http://ds9.si.edu/doc/ref/command.html#scale

    """

    nums = natsort.natsorted([int(re.search('(.+?)(\d+)(\.\w*)', f).group(2))
                              for f in glob.glob(pth)])
    #print('pth = ', pth)
    #print('nums = ', nums)

    # main galaxy name is in the end, it is because while matching colorbar
    # and scale limits, ds9 used last opened galxy to match all the galaxies.
    # /Users/poudel/Research/galfit_usage/verify_2cmp_fitting/f814w_fitting/devauc_two_comp/f814w_devauc_two_comp0.fits
    # /Users/poudel/Research/galfit_usage/verify_2cmp_fitting/f814w_fitting/expdisk_res_two_comp/f814w_expdisk_res_two_comp0.fits
    # /Users/poudel/Research/galfit_usage/verify_2cmp_fitting/f814w_fitting/residual_two_comp/f814w_res_two_comp0.fits
    # /Users/poudel/Research/galfit_usage/verify_2cmp_fitting/f814w_fitting/devauc_one_comp/f814w_devauc_one_comp0.fits
    # /Users/poudel/Research/galfit_usage/verify_2cmp_fitting/f814w_fitting/expdisk_res_one_comp/f814w_expdisk_res_one_comp0.fits
    # /Users/poudel/jedisim/z_jedisim_dev_sim/galaxies/f814w_gal0.fits
    files     = [ devauc_two_comp, expdisk_res_two_comp, residual_two_comp, 
                  devauc_one_comp, expdisk_res_one_comp, gal ]
    files_lst = [ f + str(n + m) + '.fits ' + flgs
                    for m in range(COLS) if (n + m) in nums 
                    for f in files]
    files_all = " ".join(files_lst)
    #print('\nfiles = ', files_all)

    # ds9 command with flags
    ds9 = '/Applications/ds9.app/Contents/MacOS/ds9' + ' '
    cmd = ds9 + ' -height 1200 ' + ' -width 2500 ' + files_all
    subprocess.call(cmd, shell=True)


def main():
    
    # Imports
    import os
    import subprocess
    import glob
    import re
    import natsort
    from astropy.io.fits import getval

    # Variables
    COLS = 6
    galfit_outputs       = 'f814w_fitting'          
    pth                  = '/Users/poudel/Research/galfit_usage/verify_2cmp_fitting/' +\
                           '%s/devauc_two_comp/f814w_devauc*.fits'%(galfit_outputs)
    gal                  = '/Users/poudel/jedisim/z_jedisim_dev_sim/galaxies/f814w_gal'
    fit                  = '/Users/poudel/Research/galfit_usage/verify_2cmp_fitting/' + galfit_outputs 
    devauc_two_comp      = '%s/devauc_two_comp/f814w_devauc_two_comp'%fit
    expdisk_res_two_comp = '%s/expdisk_res_two_comp/f814w_expdisk_res_two_comp'%fit 
    residual_two_comp    = '%s/residual_two_comp/f814w_res_two_comp'%fit
    devauc_one_comp      = '%s/devauc_one_comp/f814w_devauc_one_comp'%fit 
    expdisk_res_one_comp = '%s/expdisk_res_one_comp/f814w_expdisk_res_one_comp'%fit
    flgs                 =  '-scale log -cmap a -tile grid layout %d 4'%COLS + ' ' +\
                            '-match colorbar -match scale -match scalelimits' + ' '
    f606                 = '/Users/poudel/jedisim/z_jedisim_dev_sim/stamps_f6/f606w_gal'
    f814                 = '/Users/poudel/jedisim/z_jedisim_dev_sim/galaxies/f814w_gal'
    
    
    
    """Run main function."""
    nums = natsort.natsorted([int(re.search('(.+?)(\d+)(\.fits)', f).group(2))
                              for f in glob.glob(pth)])
    
    # choose your range of galaxies
    #nums = [x for x in nums if (x > 194 and x < 200)]
    #print('pth = ', pth)
    #print('nums: ', nums)
    
    missing = [i for i in list(range(0, 301)) if i not in nums]
    #print('missing:', missing)
    
    
    # Display some galaxies components each time.
    # Galaxies are 0 6 11 ... 298
    for n in nums[::COLS-1]:
        print('\nNumber = ', n)
        
        # Run mag diff
        start, end = n, n+6
        if n !=298:
            for n in range(start,end):
                find_color(f606 + str(n) + '.fits', f814 + str(n) + '.fits')
        if n ==298:
            for n in range(298,302):
                find_color(f606 + str(n) + '.fits', f814 + str(n) + '.fits')
        
        # Open ds9
        open_in_ds9(n, galfit_outputs)



if __name__ == "__main__":
    main()
