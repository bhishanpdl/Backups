#!python
#-*- coding: utf-8 -*-
"""
:Author: Bhishan Poudel, Physics PhD Student, Ohio University

:Date:

  |today|

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
import numpy as np
from util import run_process

def jedimaster():
    # Using run_process
    run_process("Replace output dirs for both 0 & 90 deg", ['python', "a7_jedisim_odirs.py"])
    run_process("Create  3 catalogs for both 0 & 90 deg", ['python', "a8_jedisim_3cats.py"])
    run_process("Run the simulation for normal case.", ['python', "a9_jedisimulate.py"])
    run_process("Run the simulation for rotated case.", ['python', "a10_jedisimulate90.py"])

def main():
    """Run main function."""
    jedimaster()

if __name__ == "__main__":
    main()
