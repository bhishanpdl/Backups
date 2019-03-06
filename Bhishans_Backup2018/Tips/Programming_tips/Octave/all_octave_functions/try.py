#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016

# Imports
from __future__ import division
from __future__ import print_function
from itertools import islice

with open('input') as fin, open('output', 'w') as fout:
    fout.writelines(islice(fin, None, None, 2))
