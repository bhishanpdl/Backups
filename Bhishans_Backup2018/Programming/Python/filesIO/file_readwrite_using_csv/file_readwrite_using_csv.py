#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author  : Bhishan Poudel
# Date    : May 23, 2016
# Ref     : https://docs.python.org/2/library/csv.html

# Imports
from __future__ import division
from __future__ import print_function
import csv

with open('eggs.csv', 'wb') as csvfile:
    spamwriter = csv.writer(csvfile, delimiter=' ',
                            quotechar='|', quoting=csv.QUOTE_MINIMAL)
    spamwriter.writerow(['Spam'] * 5 + ['Baked Beans'])
    spamwriter.writerow(['Spam', 'Lovely Spam', 'Wonderful Spam'])


with open('eggs.csv') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        print(row['first_name'], row['last_name'])
