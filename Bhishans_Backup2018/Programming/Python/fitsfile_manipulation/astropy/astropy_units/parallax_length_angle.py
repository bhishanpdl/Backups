#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct-08-2016 Sat
# Last update :
#
#
# Imports
from astropy import units as u


a = (8.0 * u.arcsec).to(u.parsec, equivalencies=u.parallax())
print('\n')
print(a)


##======================================================================
restfreq = 115.27120 * u.GHz  # rest frequency of 12 CO 1-0 in GHz
freq_to_vel = u.doppler_radio(restfreq)
a = (116e9 * u.Hz).to(u.km / u.s, equivalencies=freq_to_vel)
print('\n')
print(a)

##======================================================================
a = (1.5 * u.Jy).to(u.erg / u.cm**2 / u.s / u.Hz,
                equivalencies=u.spectral_density(3500 * u.AA))
print('\n')
print(a)

b = (1.5 * u.Jy).to(u.erg / u.cm**2 / u.s / u.micron,
                equivalencies=u.spectral_density(3500 * u.AA))
print('\n')
print(b)





##======================================================================
## temp engergy equivalency
##======================================================================
t_k = 1e6 * u.K
a = t_k.to(u.eV, equivalencies=u.temperature_energy())
print('\n')
print(a)





##======================================================================
## Find equivalent units()
##======================================================================
a = u.Hz.find_equivalent_units()
print('\n')
print(a)

b = u.Hz.find_equivalent_units(equivalencies=u.spectral())
print('\n')
print(b)
