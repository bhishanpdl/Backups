#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016
# Ref     : https://stackoverflow.com/questions/17497866/read-every-second-line-and-print-to-new-file

# Imports
from __future__ import division
from __future__ import print_function
from itertools import islice

#with open('input') as fin, open('output', 'w') as fout:
    #fout.writelines(islice(fin, None, None, 2))




# And if necessary, filter out the blank lines first,
# then take every 2nd from that...
# non_blanks = (line for line in fin if line.strip())
# fout.writelines(islice(non_blanks, None, None, 2))

with open('input') as fin, open('output', 'w') as fout:
    non_blanks = (line for line in fin if line.strip())
    fout.writelines(islice(non_blanks, None, None, 2))
