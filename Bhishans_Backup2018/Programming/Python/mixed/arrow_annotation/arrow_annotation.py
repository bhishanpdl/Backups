#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Jun-23-2017 Fri
# Last update : 
#
#

def kinetic_energy(m:'in KG', v:'in M/S')->'Joules': 
    """ Calculate the kinetic energy.
    Arguments:
    m: mass in kg
    v: velocity in m/s
    
    """
    
    return 1/2*m*v**2
 
print(kinetic_energy.__annotations__)
print("\n")
print(kinetic_energy.__doc__)
