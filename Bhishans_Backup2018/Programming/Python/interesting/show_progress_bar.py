#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Author      : Bhishan Poudel; Physics PhD Student, Ohio University
# Date        : Oct 05, 2016
# Last update :
#
#
# Imports
from __future__ import division, unicode_literals, print_function

import time,sys

for i in range(100+1):
    time.sleep(0.1)
    sys.stdout.write(('='*i)+(''*(100-i))+("\r [ %d"%i+"% ] "))
    sys.stdout.flush()
