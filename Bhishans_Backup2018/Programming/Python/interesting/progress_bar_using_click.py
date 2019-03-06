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
import click,time,sys

with click.progressbar(range(10)) as bar:
    for i in bar:
        #print('count = ', i)
        pass


# example 2
with click.progressbar(range(100000), file=sys.stderr, show_pos=True, width=70, bar_template='(_(_)=%(bar)sD(_(_| %(info)s', fill_char='=', empty_char=' ') as bar:
    for i in bar:
        pass
